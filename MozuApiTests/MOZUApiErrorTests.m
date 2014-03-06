//
//  MOZUApiErrorTests.m
//  MozuApi
//
//  Created by Kevin Wright on 11/5/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Foundation/Foundation.h>
#import "DDLog.h"
#import "MOZUAPIError.h"

@interface MOZUApiErrorTests : XCTestCase

@end

@implementation MOZUApiErrorTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testExample
{
    /*
    NSString *jsonData = @"{"
    "\"exceptionDetail\": {"
        "\"type\": \"Mozu.Core.Exceptions.VaeInvalidOrMissingTokenException\","
        "\"message\": \"There was a problem with your access token when accessing the operation GetTenant: AppNotSet - \","
        "\"source\": \"Mozu.Core.Api\","
        "\"targetSite\": \"Void OnAuthActionExecuting(Mozu.Core.Api.Filters.ActionFilterContext)\","
        "\"stackTrace\": \"   at Mozu.Core.Api.Filters.Auth.ApiAuthenticationFilter.OnAuthActionExecuting(ActionFilterContext filterContext)\r\n   at Mozu.Core.Api.Filters.BaseActionFilter.OnActionExecuting(HttpActionContext actionContext)\r\n   at System.Web.Http.Filters.ActionFilterAttribute.System.Web.Http.Filters.IActionFilter.ExecuteActionFilterAsync(HttpActionContext actionContext, CancellationToken cancellationToken, Func`1 continuation)\""
    "},"
    "\"applicationName\": \"Tenant\","
    "\"errorCode\": \"INVALID_ACCESS_TOKEN\","
    "\"message\": \"There was a problem with your access token when accessing the operation GetTenant: AppNotSet - \","
    "\"additionalErrorData\": ["
                            "{"
                                "\"name\": \"OperationName\","
                                "\"value\": \"GetTenant\""
                            "},"
                            "{"
                                "\"name\": \"WWW-Authenticate\","
                                "\"value\": \"Api-Application, accesstoken=none\""
                            "}"
                            "]"
    //"items\": []"
"}";
*/
    
    //    NSString *jsonData = @"{"
    //    "\"exceptionDetail\": {"
    //    "\"type\": \"Mozu.Core.Exceptions.VaeInvalidOrMissingTokenException\","
    //    "\"message\": \"There was a problem with your access token when accessing the operation GetTenant: AppNotSet - \","
    //    "\"source\": \"Mozu.Core.Api\","
    //    "\"targetSite\": \"Void OnAuthActionExecuting(Mozu.Core.Api.Filters.ActionFilterContext)\","
    //    "\"stackTrace\": \"stacktrace\""
    //    "},"
    //    "\"applicationName\": \"Tenant\","
    //    "\"errorCode\": \"INVALID_ACCESS_TOKEN\","
    //    "\"message\": \"There was a problem with your access token when accessing the operation GetTenant: AppNotSet - \","
    //    "\"additionalErrorData\": ["
    //    "{"
    //    "\"name\": \"OperationName\","
    //    "\"value\": \"GetTenant\""
    //    "},"
    //    "{"
    //    "\"name\": \"WWW-Authenticate\","
    //    "\"value\": \"Api-Application, accesstoken=none\""
    //    "}"
    //    "]"
    //    //"items\": []"
    //    "}";
    
NSString* jsonStr = @"{ \
        \"applicationName\": \"AppDev\", \
        \"errorCode\": \"INVALID_CREDENTIALS\", \
        \"message\": \"Invalid Credentials: Invalid credentials. \", \
        \"additionalErrorData\": [ \
                                { \
                                    \"name\": \"CredentialsName\", \
                                    \"value\": \"Invalid credentials\" \
                                } \
                                ], \
        \"items\": [], \
        \"exceptionDetail\": { \
            \"type\": \"Mozu.Core.Exceptions.VaeInvalidCredentialsException\", \
            \"message\": \"Invalid Credentials: Invalid credentials. \", \
            \"source\": \"Mozu.AppDev.Domain\", \
            \"targetSite\": \"Mozu.AppDev.Domain.Auth.AuthTicket CreateAuthTicket(System.String, System.String)\", \
            \"stackTrace\": \"trace sample stack \" \
        } \
    }";
    
    NSData* jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    id data = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    //MOZUApiError *mozuError = [[MOZUApiError alloc] initWithString:jsonData statusCode:200];
    //DDLogDebug(@"data = %@", data);
    NSLog(@"data = %@", data);
    XCTAssertNotNil(data, @"failed to parse MOZUApiError");
    //XCTAssertNotNil(mozuError, @"failed to parse MOZUApiError");
}

-(NSString*)loadFile:(NSString*)name
{
    NSBundle *unitTestBundle = [NSBundle bundleForClass:[self class]];
    NSString *pathForFile = [unitTestBundle pathForResource:name ofType:nil];
    NSString* retVal = [[NSString alloc] initWithContentsOfFile:pathForFile encoding:NSUTF8StringEncoding error:nil];
    return retVal;
}

- (void)testApiError1
{

    NSString *jsonStr = [self loadFile:@"ApiError1.txt"];
    //NSError *error = nil;
    MOZUAPIError* apiError = [[MOZUAPIError alloc] initWithString:jsonStr statusCode:200];
    DDLogError(@"%@", apiError.localizedDescription);
    XCTAssertNotNil(apiError, @"failed to parse MOZUApiError");
    //XCTAssertNotNil(mozuError, @"failed to parse MOZUApiError");
}

- (void)testApiError2
{
    NSString *jsonStr = [self loadFile:@"ApiError2.txt"];
    //NSError *error = nil;
    MOZUAPIError* apiError = [[MOZUAPIError alloc] initWithString:jsonStr statusCode:200];
    DDLogError(@"%@", apiError.localizedDescription);
    XCTAssertNotNil(apiError, @"failed to parse MOZUApiError");
}

@end
