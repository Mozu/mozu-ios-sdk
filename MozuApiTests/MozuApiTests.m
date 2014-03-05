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
#import "MOZUAdminProductResource.h"

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


- (void)testMozuClient
{

    NSInteger productCode = 1001;
    MOZUURLComponents *components = [[MOZUURLComponents alloc] initWithTemplate:@"/api/commerce/catalog/admin/products/{productCode}"
                                                                     parameters:@{@"productCode": @(productCode)}
                                                                       location:MOZUTenantPod useSSL:NO];
    
    NSString *appId = @"f4ff75a969544ca5849aa2df016be775";
    NSString *sharedSecred = @"149b0a7c0b6b48499605a2df016be775";
    
    MOZUAppAuthInfo* authInfo = [MOZUAppAuthInfo new];
    authInfo.ApplicationId = appId;
    authInfo.SharedSecret = sharedSecred;
    
    MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:components verb:@"GET"];
    client.JSONParser = ^(NSString *JSONResult) {
        JSONModelError *JSONError = nil;
        JSONModel *model = [[MOZUAdminProductCollection alloc] initWithString:JSONResult error:&JSONError];
        if (!model) {
            DDLogError(@"%@", JSONError.localizedDescription);
        }
        return model;
    };

    NSInteger tenantId = 7290;
    NSString *authenticationHost = @"home.mozu-si.volusion.com";
    NSString *tenantHost = @"t7290-s10825.mozu-si.volusion.com";
    NSNumber *siteId = @(10825);
    NSNumber *masterCatalogID = @(1);
    NSNumber *catalogID = @(1);
    client.context = [[MOZUAPIContext alloc] initWithTenantId:tenantId siteId:siteId masterCatalogId:masterCatalogID catalogId:catalogID];
    client.context.tenantHost = tenantHost;
    NSString *dataViewModeString = [@(MOZULive) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:authInfo appHost:authenticationHost useSSL:NO refeshInterval:nil completionHandler:^(NSHTTPURLResponse *response, MOZUApiError *error) {
        [client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
            if (result) {
                DDLogDebug(@"result = %@", result);
                XCTAssertNotNil(result, @"Tenant nil with no error.");
            } else {
                DDLogError(@"%@", error.localizedDescription);
                XCTAssertNil(result, @"Tenant not nill but had error.");
                XCTFail(@"%@", error);
            }
            self.waitingForBlock = NO;
        }];
    }];
    
    
    [self waitForBlock];
    
}

- (void)testAdminProductResource
{
    NSString *appId = @"f4ff75a969544ca5849aa2df016be775";
    NSString *sharedSecred = @"149b0a7c0b6b48499605a2df016be775";
    MOZUAppAuthInfo* authInfo = [MOZUAppAuthInfo new];
    authInfo.ApplicationId = appId;
    authInfo.SharedSecret = sharedSecred;
    NSString *authenticationHost = @"home.mozu-si.volusion.com";
    
    NSInteger tenantId = 7290;
    NSNumber *siteId = @(10825);
    NSNumber *masterCatalogID = @(1);
    NSNumber *catalogID = @(1);
    NSString *tenantHost = @"t7290-s10825.mozu-si.volusion.com";
    MOZUAPIContext *context = [[MOZUAPIContext alloc] initWithTenantId:tenantId siteId:siteId masterCatalogId:masterCatalogID catalogId:catalogID];
    context.tenantHost = tenantHost;
    
    MOZUAdminProductResource *adminProductResource = [[MOZUAdminProductResource alloc] initWithAPIContext:context];

//    [adminProductResource productsWithDataViewMode:MOZULive
//                                        startIndex:@(0)
//                                          pageSize:nil
//                                            sortBy:nil
//                                            filter:nil
//                                                 q:nil
//                                            qLimit:nil
//                                           noCount:nil
//                                        userClaims:nil
//                                 completionHandler:^(MOZUAdminProductCollection *result, MOZUApiError *error, NSHTTPURLResponse *response) {
//                                     
//                                 }];
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:authInfo appHost:authenticationHost useSSL:NO refeshInterval:nil completionHandler:^(NSHTTPURLResponse *response, MOZUApiError *error) {
        [adminProductResource productWithDataViewMode:MOZULive productCode:@"1001" userClaims:nil completionHandler:^(MOZUAdminProduct *result, MOZUApiError *error, NSHTTPURLResponse *response) {
            if (result) {
                DDLogDebug(@"result = %@", result);
                XCTAssertNotNil(result, @"Tenant nil with no error.");
            } else {
                DDLogError(@"%@", error.localizedDescription);
                XCTAssertNil(result, @"Tenant not nill but had error.");
                XCTFail(@"%@", error);
            }
            self.waitingForBlock = NO;
        }];
    }];
    
    [self waitForBlock];
}

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
