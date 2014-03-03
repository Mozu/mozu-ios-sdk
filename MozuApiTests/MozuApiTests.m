//
//  MozuApiTests.m
//  MozuApiTests
//
//  Created by Kevin Wright on 10/29/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MOZUAppAuthenticator.h"
#import "MOZUAppAuthInfo.h"
#import "MOZUAuthTicket.h"
#import "MOZUClient.h"
#import "MOZUTenantResource.h"
#import "MOZUTenantURLComponents.h"

@interface MozuApiTests : XCTestCase

@property (nonatomic) BOOL waitingForBlock;

@end

@implementation MozuApiTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.waitingForBlock = YES;
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)waitForBlock
{
    while(self.waitingForBlock) {
        [NSRunLoop.currentRunLoop runMode:NSDefaultRunLoopMode
                               beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    }
}

/*
- (void)testMozuClient
{
    // ci env
    //NSString *appId = @"df2edc9e2ac849d9ad26a230012af527";
    //NSString *ss = @"db969fc376e4497c90cba230012af527";
    //NSString *baseUrl = @"http://mozu-ci.com";
    
    MOZUURLComponents *components = [[MOZUURLComponents alloc] initWithTemplate:@"/api/platform/tenants/{tenantId}"
                                                                     parameters:@{@"tenantId": @"1"}
                                                                       location:MOZUTenantPod useSSL:YES];
    
    // dev env
    NSString *appId = @"c00c1693055f4a519d34a2490188d350";
    NSString *ss = @"d0863f54a3b04cb5a66da2490188d350";
//    NSString *baseUrl = @"http://aus02nqrprx001.dev.volusion.com";
    
    
    MOZUAppAuthInfo* authInfo = [MOZUAppAuthInfo new];
    authInfo.ApplicationId = appId;
    authInfo.SharedSecret = ss;
    
    MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:components verb:@"POST"];
    client.body = authInfo;
    client.JSONParser = ^(NSString *JSONResult) {
        JSONModelError *JSONError = nil;
        JSONModel *model = [[MOZUAuthTicket alloc] initWithString:JSONResult error:&JSONError];
        if (!model) {
            DDLogError(@"%@", JSONError.localizedDescription);
        }
        return model;
    };
    
    // TODO: Create api context.
    // client.apicontext = lkjdflj;
    client.context = [MOZUAPIContext alloc];
    
    
    [client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
        if (result) {
            DDLogDebug(@"result = %@", result);
        } else {
            DDLogError(@"%@", error.localizedDescription);
        }
    }];
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:30]];
    
}
*/
- (void)testTenantResource
{
    // ci env
    NSString *appId = @"f4ff75a969544ca5849aa2df016be775";
    NSString *ss = @"149b0a7c0b6b48499605a2df016be775";
    NSString *host = @"home.mozu-si.volusion.com";
    NSInteger tenantId = 7290;
    
    MOZUAppAuthInfo* authInfo = [MOZUAppAuthInfo new];
    authInfo.ApplicationId = appId;
    authInfo.SharedSecret = ss;;

    MOZUTenantResource *tenantResource = [[MOZUTenantResource alloc] init];
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:authInfo appHost:host useSSL:NO refeshInterval:nil completionHandler:^(NSHTTPURLResponse *response, MOZUApiError *error) {
        if (error) {
            DDLogError(@"%@", error.localizedDescription);
            XCTAssertNil(response, @"Resource not nill but had error.");
            self.waitingForBlock = NO;
        } else {
            [tenantResource tenantWithTenantId:tenantId userClaims:nil completionHandler:^(MOZUTenant *result, MOZUApiError *error, NSHTTPURLResponse *response) {
                if (error) {
                    DDLogError(@"%@", error.localizedDescription);
                    XCTAssertNil(result, @"Tenant not nill but had error.");
                    XCTFail(@"%@", error);
                } else {
                    XCTAssertNotNil(result, @"Tenant nil with no error.");
                    NSLog(@"%@", result);
                    DDLogDebug(@"%@", result);
                }
                self.waitingForBlock = NO;
            }];
        }
    }];

    [self waitForBlock];
}

- (void)testTenantUrl
{
    MOZUURLComponents* components = [MOZUTenantURLComponents URLComponentsForGetTenantOperationWithTenantId:257];
    DDLogDebug(@"url = %@", components.URL);

}

@end
