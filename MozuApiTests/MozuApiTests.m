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
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:authInfo appHost:host useSSL:NO refeshInterval:nil completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
        if (error) {
            DDLogError(@"%@", error.localizedDescription);
            XCTAssertNil(response, @"Resource not nill but had error.");
            self.waitingForBlock = NO;
        } else {
            [tenantResource tenantWithTenantId:tenantId userClaims:nil completionHandler:^(MOZUTenant *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
                if (error) {
                    DDLogError(@"%@", error.localizedDescription);
                    XCTAssertNil(result, @"Result not nill but had error.");
                    XCTFail(@"%@", error);
                } else {
                    XCTAssertNotNil(result, @"Result nil with no error.");
                    NSLog(@"%@", result);
                    DDLogDebug(@"%@", result);
                }
                self.waitingForBlock = NO;
            }];
        }
    }];
    
    [self waitForBlock];
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
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:authInfo appHost:authenticationHost useSSL:NO refeshInterval:nil completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
        [client executeWithCompletionHandler:^(id result, MOZUAPIError *error, NSHTTPURLResponse *response) {
            if (result) {
                DDLogDebug(@"result = %@", result);
                XCTAssertNotNil(result, @"Result nil with no error.");
            } else {
                DDLogError(@"%@", error.localizedDescription);
                XCTAssertNil(result, @"Result not nill but had error.");
                XCTFail(@"%@", error);
            }
            self.waitingForBlock = NO;
        }];
    }];
    
    
    [self waitForBlock];
    
}

- (void)testAdminProductDetails
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
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:authInfo appHost:authenticationHost useSSL:NO refeshInterval:nil completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
        [adminProductResource productWithDataViewMode:MOZULive productCode:@"1001" userClaims:nil completionHandler:^(MOZUAdminProduct *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
            if (result) {
                DDLogDebug(@"result = %@", result);
                XCTAssertNotNil(result, @"Result nil with no error.");
            } else {
                DDLogError(@"%@", error.localizedDescription);
                XCTAssertNil(result, @"Result not nill but had error.");
                XCTFail(@"%@", error);
            }
            self.waitingForBlock = NO;
        }];
    }];
    
    [self waitForBlock];
}

- (void)testAdminProductCollection
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
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:authInfo appHost:authenticationHost useSSL:NO refeshInterval:nil completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
        [adminProductResource productsWithDataViewMode:MOZULive
                                            startIndex:@(0)
                                              pageSize:@(200)
                                                sortBy:@"productCode+asc"
                                                filter:@"isRecurring+eq+false"
                                                     q:nil
                                                qLimit:@(100)
                                               noCount:@(NO)
                                            userClaims:nil
                                     completionHandler:^(MOZUAdminProductCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
                                         if (result) {
                                             DDLogDebug(@"result = %@", result);
                                             XCTAssertNotNil(result, @"Result nil with no error.");
                                         } else {
                                             DDLogError(@"%@", error.localizedDescription);
                                             XCTAssertNil(result, @"Result not nill but had error.");
                                             XCTFail(@"%@", error);
                                         }
                                         self.waitingForBlock = NO;
                                     }];
        
    }];
    
    [self waitForBlock];
}

- (void)testProductInCatalogInfosArray
{
    // Authentication
    NSString *appId = @"f4ff75a969544ca5849aa2df016be775";
    NSString *sharedSecred = @"149b0a7c0b6b48499605a2df016be775";
    MOZUAppAuthInfo* authInfo = [MOZUAppAuthInfo new];
    authInfo.ApplicationId = appId;
    authInfo.SharedSecret = sharedSecred;
    NSString *authenticationHost = @"home.mozu-si.volusion.com";
    
    // Context
    NSInteger tenantId = 7290;
    NSNumber *siteId = @(10825);
    NSNumber *masterCatalogID = @(1);
    NSNumber *catalogID = @(1);
    NSString *tenantHost = @"t7290-s10825.mozu-si.volusion.com";
    MOZUAPIContext *context = [[MOZUAPIContext alloc] initWithTenantId:tenantId siteId:siteId masterCatalogId:masterCatalogID catalogId:catalogID];
    context.tenantHost = tenantHost;

    // Resource
    MOZUAdminProductResource *adminProductResource = [[MOZUAdminProductResource alloc] initWithAPIContext:context];
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:authInfo appHost:authenticationHost useSSL:NO refeshInterval:nil completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
        NSString *productCode = @"1001";
        [adminProductResource productInCatalogsWithDataViewMode:MOZULive productCode:productCode userClaims:nil completionHandler:^(NSArray<MOZUProductInCatalogInfo> *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
            if (result) {
                DDLogDebug(@"result = %@", result);
                XCTAssertNotNil(result, @"Result nil with no error.");
            } else {
                DDLogError(@"%@", error.localizedDescription);
                XCTAssertNil(result, @"Result not nill but had error.");
                XCTFail(@"%@", error);
            }
            self.waitingForBlock = NO;
        }];
    }];
    
    [self waitForBlock];
}

@end
