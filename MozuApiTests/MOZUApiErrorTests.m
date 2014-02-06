//
//  MOZUApiErrorTests.m
//  MozuApi
//
//  Created by Kevin Wright on 11/5/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <XCTest/XCTest.h>
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
    NSString *jsonData = @"{"
    "\"exceptionDetail\": {"
    "\"type\": \"Mozu.Core.Exceptions.VaeInvalidOrMissingTokenException\","
    "\"message\": \"There was a problem with your access token when accessing the operation GetTenant: AppNotSet - \","
    "\"source\": \"Mozu.Core.Api\","
    "\"targetSite\": \"Void OnAuthActionExecuting(Mozu.Core.Api.Filters.ActionFilterContext)\","
    "\"stackTrace\": \"stacktrace\""
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
    
   MOZUApiError *mozuError = [[MOZUApiError alloc] initWithString:jsonData andStatusCode:200];
    XCTAssertNotNil(mozuError, @"failed to parse MOZUApiError");
}

@end
