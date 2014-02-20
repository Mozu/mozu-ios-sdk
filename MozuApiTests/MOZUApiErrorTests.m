//
//  MOZUApiErrorTests.m
//  MozuApi
//
//  Created by Kevin Wright on 11/5/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Foundation/Foundation.h>
#import "MOZUApiError.h"

@interface MOZUApiErrorTests : XCTestCase

@end

@implementation MOZUApiErrorTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
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
    
NSString* jsonData = @"{ \
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
            \"stackTrace\": \"   at Mozu.AppDev.Domain.Auth.Handlers.AuthenticateAppHandler.CreateAuthTicket(String appId, String sharedSecret) in d:\\Build\\03\\Mozu\\Dev_Mozu.AppDev\\Sources\\Mozu.AppDev.Domain\\Auth\\Handlers\\AuthenticateAppHandler.cs:line 59\r\n   at Mozu.AppDev.WebApi.Controllers.AppAuthTicketsController.AuthenticateApp(AppAuthInfo appAuthInfo) in d:\\Build\\03\\Mozu\\Dev_Mozu.AppDev\\Sources\\Mozu.AppDev.WebApi\\Controllers\\AppAuthTicketsController.cs:line 48\r\n   at lambda_method(Closure , Object , Object[] )\r\n   at System.Web.Http.Controllers.ReflectedHttpActionDescriptor.ActionExecutor.<>c__DisplayClass13.b__c(Object instance, Object[] methodParameters)\r\n   at System.Web.Http.Controllers.ReflectedHttpActionDescriptor.ActionExecutor.Execute(Object instance, Object[] arguments)\r\n   at System.Threading.Tasks.TaskHelpers.RunSynchronously[TResult](Func`1 func, CancellationToken cancellationToken)\" \
        } \
    }";
    
    id data = [NSJSONSerialization JSONObjectWithData:[jsonData dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
    //MOZUApiError *mozuError = [[MOZUApiError alloc] initWithString:jsonData statusCode:200];
    DDLog(@"%@", data);
    //XCTAssertNotNil(mozuError, @"failed to parse MOZUApiError");
}

@end
