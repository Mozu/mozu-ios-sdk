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
@property (nonatomic, readonly) NSNumber *siteID;
@property (nonatomic, readonly) NSNumber *masterCatalogID;
@property (nonatomic, readonly) NSNumber *catalogID;
@property (nonatomic, readonly) NSString *emailAddress;
@property (nonatomic, readonly) NSString *password;
@property (nonatomic, readonly) NSString *appID;
@property (nonatomic, readonly) NSString *sharedSecret;
@property (nonatomic, readonly) NSString *authenticationHost;
@property (nonatomic, readonly) NSString *tenantHost;

@end

@implementation MozuApiTests

static const NSUInteger tenantID = 2442;
static const NSInteger productCode = 1001;
//static const NSUInteger MOZUDeveloperIdentifier;
static const BOOL useSSL = NO;

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _siteID = @(4593);
    _masterCatalogID = @(1);
    _catalogID = @(1);
    
    [self loadSecureKeys];
    
    self.waitingForBlock = YES;
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
}

- (void)loadSecureKeys
{

#ifdef DEBUG
    NSString *path = @"/Users/noel_artiles/Documents/MOZUiOSTestsKeys.json";
#else
    NSString *path = @"/Volumes/Scratch/work/MOZUiOSTestsKeys.json";
#endif
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSDictionary *securityDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        // App authentication
        _appID = securityDictionary[@"appID"];
        _sharedSecret = securityDictionary[@"sharedSecret"];
        _authenticationHost = securityDictionary[@"authenticationHost"];
        
        // User authentication
        _emailAddress = securityDictionary[@"emailAddress"];
        _password = securityDictionary[@"password"];
        
        _tenantHost = securityDictionary[@"tenantHost"];
    }

}

- (MOZUAppAuthInfo *)appAuthInfo;
{
    MOZUAppAuthInfo *authInfo = [MOZUAppAuthInfo new];
    authInfo.ApplicationId = self.appID;
    authInfo.SharedSecret = self.sharedSecret;
    
    return authInfo;
}

- (MOZUUserAuthInfo *)userAuthInfo
{
    MOZUUserAuthInfo *userAuthInfo = [MOZUUserAuthInfo new];
    userAuthInfo.emailAddress = self.emailAddress;
    userAuthInfo.password = self.password;
    
    return userAuthInfo;
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
    MOZUAppAuthInfo *authInfo = [self appAuthInfo];
    
    MOZUTenantResource *tenantResource = [[MOZUTenantResource alloc] init];
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:authInfo appHost:self.authenticationHost useSSL:useSSL refeshInterval:nil completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
        if (error) {
            DDLogError(@"%@", error.localizedDescription);
            XCTAssertNil(response, @"Resource not nil but had error.");
            self.waitingForBlock = NO;
        } else {
            [tenantResource tenantWithTenantId:tenantID userClaims:nil completionHandler:^(MOZUTenant *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
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
    MOZUURLComponents *components = [[MOZUURLComponents alloc] initWithTemplate:@"/api/commerce/catalog/admin/products/{productCode}"
                                                                     parameters:@{@"productCode": @(productCode)}
                                                                       location:MOZUTenantPod useSSL:useSSL];
    
    MOZUAppAuthInfo *authInfo = [self appAuthInfo];
    
    MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:components verb:@"GET"];
    client.JSONParser = ^(NSString *JSONResult) {
        JSONModelError *JSONError = nil;
        JSONModel *model = [[MOZUAdminProduct alloc] initWithString:JSONResult error:&JSONError];
        if (!model) {
            DDLogError(@"%@", JSONError.localizedDescription);
        }
        return model;
    };

    client.context = [[MOZUAPIContext alloc] initWithTenantId:tenantID siteId:self.siteID masterCatalogId:self.masterCatalogID catalogId:self.catalogID];
    client.context.tenantHost = self.tenantHost;
    NSString *dataViewModeString = [@(MOZULive) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:authInfo appHost:self.authenticationHost useSSL:useSSL refeshInterval:nil completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
        [client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
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
    MOZUAppAuthInfo *authInfo = [self appAuthInfo];
    
    MOZUAPIContext *context = [[MOZUAPIContext alloc] initWithTenantId:tenantID siteId:self.siteID masterCatalogId:self.masterCatalogID catalogId:self.catalogID];
    context.tenantHost = self.tenantHost;
    
    MOZUAdminProductResource *adminProductResource = [[MOZUAdminProductResource alloc] initWithAPIContext:context];
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:authInfo appHost:self.authenticationHost useSSL:useSSL refeshInterval:nil completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
        [adminProductResource productWithDataViewMode:MOZULive productCode:[@(productCode) stringValue] userClaims:nil completionHandler:^(MOZUAdminProduct *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
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
    MOZUAppAuthInfo *authInfo = [self appAuthInfo];
    
    MOZUAPIContext *context = [[MOZUAPIContext alloc] initWithTenantId:tenantID siteId:self.siteID masterCatalogId:self.masterCatalogID catalogId:self.catalogID];
    context.tenantHost = self.tenantHost;
    
    MOZUAdminProductResource *adminProductResource = [[MOZUAdminProductResource alloc] initWithAPIContext:context];
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:authInfo appHost:self.authenticationHost useSSL:useSSL refeshInterval:nil completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
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
    MOZUAppAuthInfo *authInfo = [self appAuthInfo];
    
    // Context
    MOZUAPIContext *context = [[MOZUAPIContext alloc] initWithTenantId:tenantID siteId:self.siteID masterCatalogId:self.masterCatalogID catalogId:self.catalogID];
    context.tenantHost = self.tenantHost;

    // Resource
    MOZUAdminProductResource *adminProductResource = [[MOZUAdminProductResource alloc] initWithAPIContext:context];
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:authInfo appHost:self.authenticationHost useSSL:useSSL refeshInterval:nil completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
        [adminProductResource productInCatalogsWithDataViewMode:MOZULive productCode:[@(productCode) stringValue] userClaims:nil completionHandler:^(NSArray<MOZUProductInCatalogInfo> *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
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
    MOZUAppAuthInfo *appAuthInfo = [self appAuthInfo];
    
    // Refresh interval
    NSTimeInterval accessTokenInterval = 0.5 * 60.0;
    NSTimeInterval refreshTokenInterval = 2.0 * 60.0;
    NSTimeInterval loopInterval = 20.0;
    MOZURefreshInterval *refreshInterval = [[MOZURefreshInterval alloc] initWithAccessTokenExpirationInterval:accessTokenInterval refreshTokenTokenExpirationInterval:refreshTokenInterval];
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:appAuthInfo appHost:MOZUAuthenticationHost useSSL:MOZUUseSSL refeshInterval:refreshInterval completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
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
        
        MOZUURLComponents *components = [[MOZUURLComponents alloc] initWithTemplate:@"/api/commerce/catalog/admin/products/{productCode}"
                                                                         parameters:@{@"productCode": @(productCode)}
                                                                           location:MOZUTenantPod useSSL:useSSL];
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

        client.context = [[MOZUAPIContext alloc] initWithTenantId:tenantID siteId:self.siteID masterCatalogId:self.masterCatalogID catalogId:self.catalogID];
        client.context.tenantHost = self.tenantHost;
        NSString *dataViewModeString = [@(MOZULive) stringValue];
        [client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];

        DDLogDebug(@"BEFORE: Refresh interval: %@", [MOZUAppAuthenticator sharedAppAuthenticator].refreshInterval);
        [client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
            DDLogDebug(@"AFTER: Refresh interval: %@", [MOZUAppAuthenticator sharedAppAuthenticator].refreshInterval);
            if (result) {
                DDLogDebug(@"result = %@", [result productCode]);
                XCTAssertEqualObjects([result productCode] , [@(productCode) stringValue] , @"Product codes don't match.");
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
    // Authentication
    MOZUAppAuthInfo *authInfo = [self appAuthInfo];
    
    // Context
    MOZUAPIContext *context = [[MOZUAPIContext alloc] initWithTenantId:tenantID siteId:self.siteID masterCatalogId:self.masterCatalogID catalogId:self.catalogID];
    context.tenantHost = self.tenantHost;
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:authInfo appHost:self.authenticationHost useSSL:useSSL refeshInterval:nil completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
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
    MOZUAppAuthInfo *appAuthInfo = [self appAuthInfo];
    
    // Refresh interval
    NSTimeInterval accessTokenInterval = 0.5 * 60.0;
    NSTimeInterval refreshTokenInterval = 2.0 * 60.0;
    NSTimeInterval loopInterval = 130.0;
    MOZURefreshInterval *refreshInterval = [[MOZURefreshInterval alloc] initWithAccessTokenExpirationInterval:accessTokenInterval refreshTokenTokenExpirationInterval:refreshTokenInterval];
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:appAuthInfo appHost:MOZUAuthenticationHost useSSL:MOZUUseSSL refeshInterval:refreshInterval completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
        if (error) {
            XCTFail(@"%@",error);
            self.waitingForBlock = NO;
        } else {
            MOZUUserAuthInfo *userAuthInfo = [MOZUUserAuthInfo new];
            userAuthInfo.emailAddress = @"";
            userAuthInfo.password = @"";
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
        
        MOZUTenantResource *tenantResource = [[MOZUTenantResource alloc] init];
        DDLogDebug(@"BEFORE: User access token expiration: %@", userClaims.accessTokenExpiration);
        [tenantResource tenantWithTenantId:tenantID userClaims:userClaims completionHandler:^(MOZUTenant *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
            DDLogDebug(@"After: User access token expiration: %@", userClaims.accessTokenExpiration);
            if (result) {
                DDLogDebug(@"result = %@", [@(result.id) stringValue]);
                XCTAssertEqualObjects(@(result.id) , @(tenantID) , @"Tenent ids don't match.");
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

#pragma mark - Tests for app API calls.

- (void)authenticateAppAndUserWithAppAuthInfo:(MOZUAppAuthInfo *)appAuthInfo userAuthInfo:(MOZUUserAuthInfo *)userAuthInfo completionHandler:(MOZUUserAuthenticationCompletionBlock)completion
{
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:appAuthInfo
                                                                    appHost:self.authenticationHost
                                                                     useSSL:useSSL
                                                             refeshInterval:nil
                                                          completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error)
     {
         if (error) {
             completion(nil, response, error);
         } else {
             [[MOZUUserAuthenticator sharedUserAuthenticator] authenticateWithUserAuthInfo:userAuthInfo
                                                                                     scope:MOZUTenantAuthenticationScope
                                                                                identifier:nil
                                                                         completionHandler:^(MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error)
              {
                  if (profile) {
                      DDLogDebug(@"profile = %@", profile);
                  } else {
                      DDLogError(@"%@", error);
                  }
                  completion(profile, response, error);
              }];
         }
     }];
}

- (void)testGettingTenentList
{
    MOZUAppAuthInfo *appAuthInfo = [self appAuthInfo];
    MOZUUserAuthInfo *userAuthInfo = [self userAuthInfo];
    [self authenticateAppAndUserWithAppAuthInfo:appAuthInfo
                                   userAuthInfo:userAuthInfo
                              completionHandler:^(MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error)
     {
         if (profile) {
             XCTAssertNil(error, @"Result with error.");
             if (profile.authorizedScopes && profile.authorizedScopes.count > 0) {
                 self.waitingForBlock = NO;
             } else {
                 XCTFail(@"No authorized scopes");
                 self.waitingForBlock = NO;
             }
         } else {
             DDLogError(@"%@", error);
             XCTAssertNotNil(error, @"Result nil but had no error.");
             XCTFail(@"%@", error);
             self.waitingForBlock = NO;
         }
     }];
    [self waitForBlock];
}

@end
