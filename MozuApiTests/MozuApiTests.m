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
#import "MOZUTenantUrl.h"

@interface MozuApiTests : XCTestCase

@end

@implementation MozuApiTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMozuClient
{
    // ci env
    //NSString *appId = @"df2edc9e2ac849d9ad26a230012af527";
    //NSString *ss = @"db969fc376e4497c90cba230012af527";
    //NSString *baseUrl = @"http://mozu-ci.com";
    
    // dev env
    NSString *appId = @"c00c1693055f4a519d34a2490188d350";
    NSString *ss = @"d0863f54a3b04cb5a66da2490188d350";
    NSString *baseUrl = @"http://aus02nqrprx001.dev.volusion.com";
    
    MOZUAppAuthInfo* authInfo = [MOZUAppAuthInfo new];
    authInfo.ApplicationId = appId;
    authInfo.SharedSecret = ss;;
    
//    MOZUClient* client = [[[[[[MOZUClient new]
//                              withBaseAddress:baseUrl]
//                             withResourceUrl:@"/api/platform/applications/authtickets"]
//                            withBody:authInfo]
//                           withVerb:@"POST"]
//                          withHandler:^(NSString* jsonData, MOZUApiError* error) {
//                              NSLog(@"jsonData = %@", jsonData);
//                          }];
    
    MOZUClient* client = [MOZUClient new];
    [client withBaseAddress:baseUrl];
    [client withVerb:@"POST"];
    [client withResourceUrl:@"/api/platform/applications/authtickets"];
    [client withBody:authInfo];
    [client withJsonParser:^(NSString* jsonResult) {
        return [[MOZUAuthTicket alloc] initWithString:jsonResult error:nil];
        
    }];
    [client withHandler:^(id result, MOZUApiError* error, NSDictionary* headers) {
        NSLog(@"result = %@", result);
    }];
    [client execute];
    
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:30]];
    
}

- (void)testTenantResource
{
    // ci env
    //NSString *appId = @"df2edc9e2ac849d9ad26a230012af527";
    //NSString *ss = @"db969fc376e4497c90cba230012af527";
    //NSString *baseUrl = @"http://mozu-ci.com";
    
    // dev env
    NSString *appId = @"c00c1693055f4a519d34a2490188d350";
    NSString *ss = @"d0863f54a3b04cb5a66da2490188d350";
    NSString *baseUrl = @"http://aus02nqrprx001.dev.volusion.com";
    int tenantId = 257;
    
    MOZUAppAuthInfo* authInfo = [MOZUAppAuthInfo new];
    authInfo.ApplicationId = appId;
    authInfo.SharedSecret = ss;;
    
    [MOZUAppAuthenticator initializeWithAuthInfo:authInfo baseAppAuthUrl:baseUrl refeshInterval:nil];
    
    [MOZUTenantResource getTenant:tenantId withAuthTicket:nil withResultHandler:^(MOZUTenant *result) {
        NSLog(@"result = %@", result);
    }];
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:30]];
    
}

- (void)testTenantUrl
{
    MOZUUrl* url = [MOZUTenantUrl getTenantUrl:257];
    NSLog(@"url = %@", url);

}

@end
