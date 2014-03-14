//
//  MozuApiTests.m
//  MozuApiTests
//
//  Created by Kevin Wright on 10/29/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MOZUAppAuthenticator.h"
#import "MOZUUserAuthenticator.h"
#import "MOZUAppAuthInfo.h"
#import "MOZUUserAuthInfo.h"
#import "MOZUAuthTicket.h"
#import "MOZUClient.h"
#import "MOZUTenantResource.h"
#import "MOZUTenantURLComponents.h"
#import "MOZUAdminProductResource.h"
#import "MOZURefreshInterval.h"
#import "DDTTYLogger.h"
#import "MOZUAddressValidationRequestResource.h"

@interface MozuApiTests : XCTestCase

@property (nonatomic) BOOL waitingForBlock;

@end

@implementation MozuApiTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.waitingForBlock = YES;
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
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
            XCTAssertNil(response, @"Resource not nil but had error.");
            self.waitingForBlock = NO;
        } else {
            [tenantResource tenantWithTenantId:tenantId userClaims:nil completionHandler:^(MOZUTenant *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
                if (error) {
                    DDLogError(@"%@", error.localizedDescription);
                    XCTAssertNil(result, @"Result not nil but had error.");
                    XCTFail(@"%@", error);
                } else {
                    XCTAssertNotNil(result, @"Result nil with no error.");
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
        JSONModel *model = [[MOZUAdminProduct alloc] initWithString:JSONResult error:&JSONError];
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
                DDLogDebug(@"result = %@", [result productCode]);
                XCTAssertEqualObjects([result productCode] , [@(productCode) stringValue] , @"Product codes don't match.");
            } else {
                DDLogError(@"%@", error.localizedDescription);
                XCTAssertNotNil(error, @"Result nil but had no error.");
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
                XCTAssertNil(error, @"Result with error.");
            } else {
                DDLogError(@"%@", error.localizedDescription);
                XCTAssertNotNil(error, @"Result nil but had no error.");
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
                                             XCTAssertNil(error, @"Result with error.");
                                         } else {
                                             DDLogError(@"%@", error.localizedDescription);
                                             XCTAssertNotNil(error, @"Result nil but had no error.");
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
                XCTAssertNil(error, @"Result with error.");
            } else {
                DDLogError(@"%@", error.localizedDescription);
                XCTAssertNotNil(error, @"Result nil but had no error.");
                XCTFail(@"%@", error);
            }
            self.waitingForBlock = NO;
        }];
    }];
    
    [self waitForBlock];
}
/*
- (void)testAccessTokenRefresh
{
    // Authentication
    NSString *appId = @"f4ff75a969544ca5849aa2df016be775";
    NSString *sharedSecred = @"149b0a7c0b6b48499605a2df016be775";
    MOZUAppAuthInfo* appAuthInfo = [MOZUAppAuthInfo new];
    appAuthInfo.ApplicationId = appId;
    appAuthInfo.SharedSecret = sharedSecred;
    NSString *authenticationHost = @"home.mozu-si.volusion.com";
    
    // Refresh interval
    NSTimeInterval accessTokenInterval = 0.5 * 60.0;
    NSTimeInterval refreshTokenInterval = 2.0 * 60.0;
    NSTimeInterval loopInterval = 20.0;
    MOZURefreshInterval *refreshInterval = [[MOZURefreshInterval alloc] initWithAccessTokenExpirationInterval:accessTokenInterval refreshTokenTokenExpirationInterval:refreshTokenInterval];
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:appAuthInfo appHost:authenticationHost useSSL:NO refeshInterval:refreshInterval completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
        DDLogDebug(@"Initial refresh interval: %@", [MOZUAppAuthenticator sharedAppAuthenticator].refreshInterval);
        NSUInteger loops = 10;
        [self executeClientWithUserAuthTicket:nil interval:loopInterval loops:loops];
    }];
    
    
    [self waitForBlock];
    
}
*/
- (void)executeClientWithUserAuthTicket:(MOZUUserAuthTicket *)userClaims interval:(NSTimeInterval)interval loops:(NSUInteger)loops
{
    DDLogDebug(@"loops: %lu", (unsigned long)loops);
    if (loops > 0) {
        __block NSUInteger loopsCopy = loops;
        
        NSInteger productCode = 1001;
        MOZUURLComponents *components = [[MOZUURLComponents alloc] initWithTemplate:@"/api/commerce/catalog/admin/products/{productCode}"
                                                                         parameters:@{@"productCode": @(productCode)}
                                                                           location:MOZUTenantPod useSSL:NO];
        MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:components verb:@"GET"];
        client.userClaims = userClaims;
        client.JSONParser = ^(NSString *JSONResult) {
            JSONModelError *JSONError = nil;
            JSONModel *model = [[MOZUAdminProduct alloc] initWithString:JSONResult error:&JSONError];
            if (!model) {
                DDLogError(@"%@", JSONError.localizedDescription);
            }
            return model;
        };
        
        NSInteger tenantId = 7290;
        NSString *tenantHost = @"t7290-s10825.mozu-si.volusion.com";
        NSNumber *siteId = @(10825);
        NSNumber *masterCatalogID = @(1);
        NSNumber *catalogID = @(1);
        client.context = [[MOZUAPIContext alloc] initWithTenantId:tenantId siteId:siteId masterCatalogId:masterCatalogID catalogId:catalogID];
        client.context.tenantHost = tenantHost;
        NSString *dataViewModeString = [@(MOZULive) stringValue];
        [client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];

        DDLogDebug(@"BEFORE: Refresh interval: %@", [MOZUAppAuthenticator sharedAppAuthenticator].refreshInterval);
        [client executeWithCompletionHandler:^(id result, MOZUAPIError *error, NSHTTPURLResponse *response) {
            DDLogDebug(@"AFTER: Refresh interval: %@", [MOZUAppAuthenticator sharedAppAuthenticator].refreshInterval);
            if (result) {
                DDLogDebug(@"result = %@", [result productCode]);
                XCTAssertEqualObjects([result productCode] , @"1001" , @"Product codes don't match.");
                loopsCopy--;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(interval * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    [self executeClientWithUserAuthTicket:userClaims interval:interval loops:loopsCopy];
                });
            } else {
                DDLogError(@"%@", error.localizedDescription);
                XCTAssertNotNil(error, @"Result nil but had no error.");
                XCTFail(@"%@", error);
                self.waitingForBlock = NO;
            }
        }];
    } else {
        self.waitingForBlock = NO;
    }
}

- (void)testBodyString
{
    XCTFail(@"FAIL");
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
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:authInfo appHost:authenticationHost useSSL:NO refeshInterval:nil completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
        // Resource
        MOZUAddressValidationRequestResource *addressValidationResource = [[MOZUAddressValidationRequestResource alloc] initWithAPIContext:context];
        MOZUAddressValidationRequest *validationRequest = [MOZUAddressValidationRequest new];
        MOZUAddress *address = [MOZUAddress new];
        address.address1 = @"1004 Minda";
        address.cityOrTown = @"Austin";
        address.stateOrProvince = @"TX";
        address.countryCode = @"US";
        address.addressType = @"Residential";
        validationRequest.address = address;

        [addressValidationResource validateAddressWithBody:validationRequest userClaims:nil completionHandler:^(MOZUAddressValidationResponse *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
            if (result) {
                DDLogDebug(@"result = %@", result);
                XCTAssertNil(error, @"Result with error.");
            } else {
                DDLogError(@"%@", error.localizedDescription);
                XCTAssertNotNil(error, @"Result nil but had no error.");
                XCTFail(@"%@", error);
            }
            self.waitingForBlock = NO;
        }];
    }];
    
    [self waitForBlock];
}
/*
- (void)testUserAuthentication
{
    // Authentication
    NSString *appId = @"f4ff75a969544ca5849aa2df016be775";
    NSString *sharedSecred = @"149b0a7c0b6b48499605a2df016be775";
    MOZUAppAuthInfo* appAuthInfo = [MOZUAppAuthInfo new];
    appAuthInfo.ApplicationId = appId;
    appAuthInfo.SharedSecret = sharedSecred;
    NSString *authenticationHost = @"home.mozu-si.volusion.com";
    
    // Refresh interval
    NSTimeInterval accessTokenInterval = 0.5 * 60.0;
    NSTimeInterval refreshTokenInterval = 2.0 * 60.0;
    NSTimeInterval loopInterval = 130.0;
    MOZURefreshInterval *refreshInterval = [[MOZURefreshInterval alloc] initWithAccessTokenExpirationInterval:accessTokenInterval refreshTokenTokenExpirationInterval:refreshTokenInterval];
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:appAuthInfo appHost:authenticationHost useSSL:NO refeshInterval:refreshInterval completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
        if (error) {
            XCTFail(@"%@",error);
            self.waitingForBlock = NO;
        } else {
            MOZUUserAuthInfo *userAuthInfo = [MOZUUserAuthInfo new];
            userAuthInfo.emailAddress = @"noel_artiles@volusion.com";
            userAuthInfo.password = @"vBdZEVW6EvFwPdR9CPBN";
            [[MOZUUserAuthenticator sharedUserAuthenticator] authenticateWithUserAuthInfo:userAuthInfo scope:MOZUDeveloperAuthenticationScope identifier:@(1334) completionHandler:^(MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error) {
                if (profile) {
                    profile.authTicket.accessTokenExpiration = [NSDate dateWithTimeIntervalSinceNow:5*60];
                    profile.authTicket.refreshTokenExpiration = [NSDate dateWithTimeIntervalSinceNow:2*60];
                    DDLogDebug(@"result = %@", profile);
                    XCTAssertNil(error, @"Result with error.");
//                    DDLogDebug(@"Initial refresh interval: %@", [MOZUAppAuthenticator sharedAppAuthenticator].refreshInterval);
                    NSUInteger loops = 10;
                    [self executeGetTenentWithUserAuthTicket:profile.authTicket interval:loopInterval loops:loops];
                } else {
                    DDLogError(@"%@", error.localizedDescription);
                    XCTAssertNotNil(error, @"Result nil but had no error.");
                    XCTFail(@"%@", error);
                    self.waitingForBlock = NO;
                }
            }];
        }
    }];
    
    [self waitForBlock];
}
*/
- (void)executeGetTenentWithUserAuthTicket:(MOZUUserAuthTicket *)userClaims interval:(NSTimeInterval)interval loops:(NSUInteger)loops
{
    DDLogDebug(@"loops: %lu", (unsigned long)loops);
    if (loops > 0) {
        __block NSUInteger loopsCopy = loops;

        NSInteger tenantId = 7290;
        
        MOZUTenantResource *tenantResource = [[MOZUTenantResource alloc] init];
        DDLogDebug(@"BEFORE: User access token expiration: %@", userClaims.accessTokenExpiration);
        [tenantResource tenantWithTenantId:tenantId userClaims:userClaims completionHandler:^(MOZUTenant *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
            DDLogDebug(@"After: User access token expiration: %@", userClaims.accessTokenExpiration);
            if (result) {
                DDLogDebug(@"result = %d", result.id);
                XCTAssertEqualObjects(@(result.id) , @(tenantId) , @"Tenent ids don't match.");
                loopsCopy--;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(interval * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    [self executeGetTenentWithUserAuthTicket:userClaims interval:interval loops:loopsCopy];
                });
            } else {
                DDLogError(@"%@", error.localizedDescription);
                XCTAssertNotNil(error, @"Result nil but had no error.");
                XCTFail(@"%@", error);
                self.waitingForBlock = NO;
            }
        }];
    } else {
        self.waitingForBlock = NO;
    }
}

@end
