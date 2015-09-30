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
#import "MOZULocationResource.h"
#import "MOZUAdminLocationResource.h"
#import "MOZURuntimeProductResource.h"
#import "MOZUAdminLocationInventoryResource.h"
#import "MOZURuntimeProductResource.h"
#import "MOZUCustomerAccountResource.h"
#import "MOZUOrderResource.h"
#import "MOZUAPILogger.h"
#import "MOZUConfig.h"

//Models
#import "MOZUTenant.h"
//Resources
#import "MOZURuntimeCategoryResource.h"

@interface MozuApiTests : XCTestCase

@property (nonatomic) BOOL waitingForBlock;
@property (nonatomic, readonly) NSNumber *siteID;
@property (nonatomic, assign)   NSUInteger tenantID;
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

//static NSString * const productCode = @"NPS-12";
static NSString * const productCode = @"MS-CMP-TNT-021";
//static const NSUInteger MOZUDeveloperIdentifier;
//static const BOOL useSSL = YES;


typedef void(^MOZUTenantSelectionCompletionBlock)(MOZUScope *scope, MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error);

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _masterCatalogID = @(1);
    _catalogID = @(1);
    
    [self loadSecureKeys];
    [self pointSharedAppAuthenticatorToDesiredEnv];
    
    self.waitingForBlock = YES;
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
}

- (void)loadSecureKeys
{
    // App authentication
    _appID = @"a83febc.InStoreSales_iOS.1.0.0.Release";//@"mzint.sdk.1.0.0.release";
    _sharedSecret = @"a60cabe75d304ff6bf806665baa6f8ef";//@"32223d1c8c694c9196e95a032bb100b5";
    _authenticationHost = AuthUrl;
    
    // User authentication
    _emailAddress = @"rabin_joshi@volusion.com";
    _password = @"R@bin1987";
    _tenantHost = @"home.mozu.com";
    
    // Other
    _tenantID = 12018; //Mobile Team - Ver 2
    _siteID = @(16629); //MysticSports.Com
}

- (void)testAppAuthentication
{
    MOZUAppAuthInfo *authInfo = [[MOZUAppAuthInfo alloc] init];
    authInfo.applicationId = self.appID;
    authInfo.sharedSecret = self.sharedSecret;
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:authInfo refeshInterval:nil completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
        
        XCTAssertNil(error, @"Result not nil but had error.");
        self.waitingForBlock = NO;
    }];
    
    [self waitForBlock];
}

- (void)testAppAndUserAuthentication
{
    MOZUAppAuthInfo *appAuthInfo = [self appAuthInfo];
    MOZUUserAuthInfo *userAuthInfo = [self userAuthInfo];
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:appAuthInfo
                                                             refeshInterval:nil
                                                          completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error)
     {
         XCTAssertNil(error, @"Result not nil but had error.");
         [[MOZUUserAuthenticator sharedUserAuthenticator] authenticateWithUserAuthInfo:userAuthInfo
                                                                                 scope:MOZUTenantAuthenticationScope
                                                                            identifier:nil
                                                                     completionHandler:^(MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error)
          {
              XCTAssertNil(error, @"Result not nil but had error.");
              self.waitingForBlock = NO;
          }];
     }];
    
    [self waitForBlock];
}

- (void)testFetchingSites
{
    MOZUAppAuthInfo *appAuthInfo = [self appAuthInfo];
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:appAuthInfo
                                                             refeshInterval:nil
                                                          completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error)
     {
         
         NSInteger tenantId = self.tenantID;
         MOZUTenantResource *tenantResource = [[MOZUTenantResource alloc] init];
         [tenantResource tenantWithTenantId:tenantId responseFields:nil
                          completionHandler:^(MOZUTenant *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
                              
                              XCTAssertNil(error, @"Result not nil but had error.");
                              self.waitingForBlock = NO;
                          }];
     }];
    
    [self waitForBlock];
}

- (void)testFetchingLocations
{
    MOZUAppAuthInfo *appAuthInfo = [self appAuthInfo];
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:appAuthInfo
                                                             refeshInterval:nil
                                                          completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error)
     {
         
         XCTAssertNil(error, @"Result not nil but had error.");
         NSInteger tenantId = self.tenantID;
         NSNumber *siteId = self.siteID;
         MOZUAPIContext *context = [[MOZUAPIContext alloc] initWithTenantId:tenantId siteId:siteId masterCatalogId:nil catalogId:nil];
         MOZUAdminLocationResource *locationResource = [[MOZUAdminLocationResource alloc] initWithAPIContext:context];
         [locationResource locationsWithStartIndex:@(0) pageSize:@(20) sortBy:nil filter:nil responseFields:nil completionHandler:^(MOZULocationCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response)
          {
              XCTAssertNil(error, @"Result not nil but had error.");
              self.waitingForBlock = NO;
              
          }];
     }];
    
    [self waitForBlock];
}

#pragma mark - Products

- (void)testFetchingCategoryTree
{
    MOZUAppAuthInfo *appAuthInfo = [self appAuthInfo];
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:appAuthInfo
                                                             refeshInterval:nil
                                                          completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error)
     {
         XCTAssertNil(error, @"Result not nil but had error.");
         MOZUUserAuthInfo *userAuthInfo = [self userAuthInfo];
         [[MOZUUserAuthenticator sharedUserAuthenticator] authenticateWithUserAuthInfo:userAuthInfo
                                                                                 scope:MOZUTenantAuthenticationScope
                                                                            identifier:nil
                                                                     completionHandler:^(MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error)
          {
              XCTAssertNil(error, @"Result not nil but had error.");
              NSInteger tenantId = self.tenantID;
              NSNumber *siteId = self.siteID;
              MOZUAPIContext *context = [[MOZUAPIContext alloc] initWithTenantId:tenantId siteId:siteId masterCatalogId:nil catalogId:nil];
              MOZURuntimeCategoryResource *categoryResource = [[MOZURuntimeCategoryResource alloc] initWithAPIContext:context];
              [categoryResource categoryTreeWithResponseFields:nil completionHandler:^(MOZURuntimeCategoryCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
                  
                  XCTAssertNil(error, @"Result not nil but had error.");
                  self.waitingForBlock = NO;
              }];
          }];
     }];
    
    [self waitForBlock];
}


- (void)testFetchingProductsWithCategoryId
{
    MOZUAppAuthInfo *appAuthInfo = [self appAuthInfo];
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:appAuthInfo
                                                             refeshInterval:nil
                                                          completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error)
     {
         XCTAssertNil(error, @"Result not nil but had error.");
         MOZUUserAuthInfo *userAuthInfo = [self userAuthInfo];
         [[MOZUUserAuthenticator sharedUserAuthenticator] authenticateWithUserAuthInfo:userAuthInfo
                                                                                 scope:MOZUTenantAuthenticationScope
                                                                            identifier:nil
                                                                     completionHandler:^(MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error)
          {
              XCTAssertNil(error, @"Result not nil but had error.");
              NSInteger tenantId = self.tenantID;
              NSNumber *siteId = self.siteID;
              NSNumber *categoryId = @(1);
              MOZUAPIContext *context = [[MOZUAPIContext alloc] initWithTenantId:tenantId siteId:siteId masterCatalogId:nil catalogId:nil];
              
              
              NSString *filter = [NSString stringWithFormat:@"categoryId+eq+%@", categoryId];
              NSString *sort = @"productName";
              
              MOZURuntimeProductResource *productsResource = [[MOZURuntimeProductResource alloc] initWithAPIContext:context];
              [productsResource productsWithFilter:filter
                                        startIndex:@(0)
                                          pageSize:@(20)
                                            sortBy:sort
                                    responseFields:nil
                                 completionHandler:^(MOZURuntimeProductCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
                                     
                                     XCTAssertNil(error, @"Result not nil but had error.");
                                     self.waitingForBlock = NO;
                                 }];
          }];
     }];
    
    [self waitForBlock];
}

- (void)testFetchingProductsInventory
{
    MOZUAppAuthInfo *appAuthInfo = [self appAuthInfo];
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:appAuthInfo
                                                             refeshInterval:nil
                                                          completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error)
     {
         XCTAssertNil(error, @"Result not nil but had error.");
         MOZUUserAuthInfo *userAuthInfo = [self userAuthInfo];
         [[MOZUUserAuthenticator sharedUserAuthenticator] authenticateWithUserAuthInfo:userAuthInfo
                                                                                 scope:MOZUTenantAuthenticationScope
                                                                            identifier:nil
                                                                     completionHandler:^(MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error)
          {
              XCTAssertNil(error, @"Result not nil but had error.");
              NSInteger tenantId = self.tenantID;
              NSNumber *siteId = self.siteID;
              NSString *productCode = @"MS-CYC-SDL-003";
              MOZUAPIContext *context = [[MOZUAPIContext alloc] initWithTenantId:tenantId siteId:siteId masterCatalogId:nil catalogId:nil];
              
              
              MOZUAdminProductResource *productResource = [[MOZUAdminProductResource alloc] initWithAPIContext:context];
              [productResource productWithProductCode:productCode responseFields:nil completionHandler:^(MOZUAdminProduct *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
                  XCTAssertNil(error, @"Result not nil but had error.");
                  self.waitingForBlock = NO;
              }];
          }];
     }];
    
    [self waitForBlock];
}

#pragma mark -

- (MOZUAppAuthInfo *)appAuthInfo;
{
    MOZUAppAuthInfo *authInfo = [MOZUAppAuthInfo new];
    authInfo.applicationId = self.appID;
    authInfo.sharedSecret = self.sharedSecret;
    
    return authInfo;
}

- (MOZUUserAuthInfo *)userAuthInfo
{
    MOZUUserAuthInfo *userAuthInfo = [MOZUUserAuthInfo new];
    userAuthInfo.emailAddress = self.emailAddress;
    userAuthInfo.password = self.password;
    
    return userAuthInfo;
}

- (void)pointSharedAppAuthenticatorToDesiredEnv
{
    // if you want to point to a different env, set it here
    // otherwise the default is prod
    // [MOZUAppAuthenticator sharedAppAuthenticator].host = <the host of the desired env>
    // [MOZUAppAuthenticator sharedAppAuthenticator].useSSL = <whether the host of the desired env uses SSL>
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
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:authInfo refeshInterval:nil completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
        if (error) {
            DDLogError(@"%@", error.localizedDescription);
            XCTAssertNil(response, @"Resource not nil but had error.");
            self.waitingForBlock = NO;
        } else {
            [tenantResource tenantWithTenantId:self.tenantID responseFields:nil completionHandler:^(MOZUTenant *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
                if (error) {
                    DDLogError(@"%@", error.localizedDescription);
                    XCTAssertNil(result, @"Result not nil but had error.");
                    XCTFail(@"%@", error);
                } else {
                    XCTAssertNotNil(result, @"Result nil with no error.");
                    //DDLogDebug(@"%@", result);
                }
                self.waitingForBlock = NO;
            }];
        }
    }];
    
    [self waitForBlock];
}

/*
 - (void)testMozuClient
 {
 MOZUURLComponents *components = [[MOZUURLComponents alloc] initWithTemplate:@"/api/commerce/catalog/admin/products/{productCode}"
 parameters:@{@"productCode": productCode}
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
 
 client.context = [[MOZUAPIContext alloc] initWithTenantId:self.tenantID siteId:self.siteID masterCatalogId:self.masterCatalogID catalogId:self.catalogID];
 client.context.tenantHost = self.tenantHost;
 NSString *dataViewModeString = [@(MOZULive) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];
 
 [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:authInfo refeshInterval:nil completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
 [client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
 if (result) {
 //DDLogDebug(@"result = %@", [result productCode]);
 XCTAssertEqualObjects([result productCode] , productCode, @"Product codes don't match.");
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
 
 MOZUAPIContext *context = [[MOZUAPIContext alloc] initWithTenantId:self.tenantID siteId:self.siteID masterCatalogId:self.masterCatalogID catalogId:self.catalogID];
 context.tenantHost = self.tenantHost;
 
 MOZUAdminProductResource *adminProductResource = [[MOZUAdminProductResource alloc] initWithAPIContext:context dataViewMode:MOZULive];
 [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:authInfo refeshInterval:nil completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
 [adminProductResource productWithProductCode:productCode responseFields:nil completionHandler:^(MOZUAdminProduct *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
 if (result) {
 //DDLogDebug(@"result = %@", result);
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
 
 MOZUAPIContext *context = [[MOZUAPIContext alloc] initWithTenantId:self.tenantID siteId:self.siteID masterCatalogId:self.masterCatalogID catalogId:self.catalogID];
 context.tenantHost = self.tenantHost;
 
 MOZUAdminProductResource *adminProductResource = [[MOZUAdminProductResource alloc] initWithAPIContext:context dataViewMode:MOZULive];
 
 [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:authInfo refeshInterval:nil completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
 [adminProductResource productsWithStartIndex:@(0)
 pageSize:@(20)
 sortBy:@"productCode+asc"
 filter:@"isRecurring+eq+false"
 q:nil
 qLimit:@(10)
 noCount:@(NO)
 responseFields:nil
 
 completionHandler:^(MOZUAdminProductCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
 if (result) {
 //DDLogDebug(@"result = %@", result);
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
 MOZUAPIContext *context = [[MOZUAPIContext alloc] initWithTenantId:self.tenantID siteId:self.siteID masterCatalogId:self.masterCatalogID catalogId:self.catalogID];
 context.tenantHost = self.tenantHost;
 
 // Resource
 MOZUAdminProductResource *adminProductResource = [[MOZUAdminProductResource alloc] initWithAPIContext:context dataViewMode:MOZULive];
 
 [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:authInfo refeshInterval:nil completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
 [adminProductResource productInCatalogsWithProductCode:productCode
 completionHandler:^(NSArray<MOZUProductInCatalogInfo> *result, MOZUAPIError *error, NSHTTPURLResponse *response)
 {
 if (result) {
 //DDLogDebug(@"result = %@", result);
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
 //DDLogDebug(@"Initial refresh interval: %@", [MOZUAppAuthenticator sharedAppAuthenticator].refreshInterval);
 NSUInteger loops = 10;
 [self executeClientWithUserAuthTicket:nil interval:loopInterval loops:loops];
 }];
 
 
 [self waitForBlock];
 
 }
 
 - (void)executeClientWithUserAuthTicket:(MOZUUserAuthTicket *)userClaims interval:(NSTimeInterval)interval loops:(NSUInteger)loops
 {
 //DDLogDebug(@"loops: %lu", (unsigned long)loops);
 if (loops > 0) {
 __block NSUInteger loopsCopy = loops;
 
 MOZUURLComponents *components = [[MOZUURLComponents alloc] initWithTemplate:@"/api/commerce/catalog/admin/products/{productCode}"
 parameters:@{@"productCode": productCode}
 location:MOZUTenantPod useSSL:useSSL];
 MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:components verb:@"GET"];
 client.JSONParser = ^(NSString *JSONResult) {
 JSONModelError *JSONError = nil;
 JSONModel *model = [[MOZUAdminProduct alloc] initWithString:JSONResult error:&JSONError];
 if (!model) {
 DDLogError(@"%@", JSONError.localizedDescription);
 }
 return model;
 };
 
 client.context = [[MOZUAPIContext alloc] initWithTenantId:self.tenantID siteId:self.siteID masterCatalogId:self.masterCatalogID catalogId:self.catalogID];
 client.context.userAuthTicket = userClaims;
 client.context.tenantHost = self.tenantHost;
 NSString *dataViewModeString = [@(MOZULive) stringValue];
 [client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];
 
 //DDLogDebug(@"BEFORE: Refresh interval: %@", [MOZUAppAuthenticator sharedAppAuthenticator].refreshInterval);
 [client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
 //DDLogDebug(@"AFTER: Refresh interval: %@", [MOZUAppAuthenticator sharedAppAuthenticator].refreshInterval);
 if (result) {
 //DDLogDebug(@"result = %@", [result productCode]);
 XCTAssertEqualObjects([result productCode] , productCode , @"Product codes don't match.");
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
 MOZUAPIContext *context = [[MOZUAPIContext alloc] initWithTenantId:self.tenantID siteId:self.siteID masterCatalogId:self.masterCatalogID catalogId:self.catalogID];
 context.tenantHost = self.tenantHost;
 
 [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:authInfo refeshInterval:nil completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
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
 
 [addressValidationResource validateAddressWithBody:validationRequest responseFields:nil completionHandler:^(MOZUAddressValidationResponse *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
 if (result) {
 //DDLogDebug(@"result = %@", result);
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
 //DDLogDebug(@"result = %@", profile);
 XCTAssertNil(error, @"Result with error.");
 //                    //DDLogDebug(@"Initial refresh interval: %@", [MOZUAppAuthenticator sharedAppAuthenticator].refreshInterval);
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
 
 
 - (void)executeGetTenentWithUserAuthTicket:(MOZUUserAuthTicket *)userClaims interval:(NSTimeInterval)interval loops:(NSUInteger)loops
 {
 //DDLogDebug(@"loops: %lu", (unsigned long)loops);
 if (loops > 0) {
 __block NSUInteger loopsCopy = loops;
 
 MOZUTenantResource *tenantResource = [[MOZUTenantResource alloc] init];
 //DDLogDebug(@"BEFORE: User access token expiration: %@", userClaims.accessTokenExpiration);
 [tenantResource tenantWithTenantId:self.tenantID responseFields:nil completionHandler:^(MOZUTenant *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
 //DDLogDebug(@"After: User access token expiration: %@", userClaims.accessTokenExpiration);
 if (result) {
 //DDLogDebug(@"result = %@", [@(result.id) stringValue]);
 XCTAssertEqualObjects(@(result.id) , @(self.tenantID) , @"Tenent ids don't match.");
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
 */
#pragma mark - Tests for app API calls.

#pragma mark - Log in

- (void)authenticateAppAndUserWithCompletionHandler:(MOZUUserAuthenticationCompletionBlock)completion
{
    MOZUAppAuthInfo *appAuthInfo = [self appAuthInfo];
    MOZUUserAuthInfo *userAuthInfo = [self userAuthInfo];
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:appAuthInfo
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
                      //DDLogDebug(@"profile = %@", profile);
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
    
    [self authenticateAppAndUserWithCompletionHandler:^(MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error)
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

- (void)authenticateAndSelectTenantWithCompletionHandler:(MOZUTenantSelectionCompletionBlock)completion
{
    [self authenticateAppAndUserWithCompletionHandler:^(MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error) {
        if (profile) {
            if (profile.authTicket) {
                // Setup authTicket for selected tenant/scope.
                //                MOZUScope *scope = profile.authorizedScopes[1]; //2442
                MOZUScope *scope = [MOZUScope new];
                scope.id = self.tenantID;//2442;
                scope.name = @"NoelTenant";
                [[MOZUUserAuthenticator sharedUserAuthenticator] setActiveScopeWithUserAuthTicket:profile.authTicket scope:scope completionHandler:^(MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error) {
                    completion(scope, profile, response, error);
                }];
            } else {
                DDLogError(@"No user auth ticket.");
                completion(nil, nil, response, error);
            }
        } else {
            DDLogError(@"%@", error);
            completion(nil, nil, response, error);
        }
    }];
}

- (void)testGettingStorefrontLocations
{
    [self authenticateAndSelectTenantWithCompletionHandler:^(MOZUScope *scope, MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error) {
        if (profile) {
            XCTAssertNil(error, @"Result with error.");
            if (profile.authTicket) {
                MOZUAPIContext *context = [[MOZUAPIContext alloc] initWithTenantId:scope.id siteId:self.siteID masterCatalogId:nil catalogId:nil];
                context.userAuthTicket = profile.authTicket;
                
                MOZULocationResource *locationResource = [[MOZULocationResource alloc] initWithAPIContext:context];
                [locationResource locationsInUsageTypeWithLocationUsageType:@"SP" startIndex:nil pageSize:nil sortBy:nil filter:nil responseFields:nil completionHandler:^(MOZULocationCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
                    if (result) {
                        XCTAssertNil(error, @"Result with error.");
                        //DDLogDebug(@"%@", result);
                        self.waitingForBlock = NO;
                    } else {
                        DDLogError(@"%@", error);
                        XCTAssertNotNil(error, @"Result nil but had no error.");
                        XCTFail(@"%@", error);
                        self.waitingForBlock = NO;
                    }
                }];
            } else {
                XCTFail(@"No user auth ticket.");
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

// Gets location codes from tenant and site.
- (void)testGettingAdminLocations
{
    [self authenticateAndSelectTenantWithCompletionHandler:^(MOZUScope *scope, MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error) {
        if (profile) {
            XCTAssertNil(error, @"Result with error.");
            if (profile.authTicket) {
                MOZUAPIContext *context = [[MOZUAPIContext alloc] initWithTenantId:scope.id siteId:self.siteID masterCatalogId:nil catalogId:nil];
                context.userAuthTicket = profile.authTicket;
                
                MOZUAdminLocationResource *locationResource = [[MOZUAdminLocationResource alloc] initWithAPIContext:context];
                [locationResource locationsWithStartIndex:nil pageSize:nil sortBy:nil filter:nil responseFields:nil completionHandler:^(MOZULocationCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
                    if (result) {
                        XCTAssertNil(error, @"Result with error.");
                        //DDLogDebug(@"%@", result);
                        self.waitingForBlock = NO;
                    } else {
                        DDLogError(@"%@", error);
                        XCTAssertNotNil(error, @"Result nil but had no error.");
                        XCTFail(@"%@", error);
                        self.waitingForBlock = NO;
                    }
                }];
            } else {
                XCTFail(@"No user auth ticket.");
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

#pragma mark - Catalog

- (void)testGettingRuntimeProducts
{
    [self authenticateAndSelectTenantWithCompletionHandler:^(MOZUScope *scope, MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error) {
        if (profile.authTicket) {
            MOZUAPIContext *context = [[MOZUAPIContext alloc] initWithTenantId:scope.id siteId:self.siteID masterCatalogId:@1 catalogId:@1];
            //context.userAuthTicket = profile.authTicket;
            
            MOZURuntimeProductResource *runtimeProductResource = [[MOZURuntimeProductResource alloc] initWithAPIContext:context];
            [runtimeProductResource productsWithFilter:nil startIndex:@0 pageSize:@20 sortBy:nil responseFields:nil completionHandler:^(MOZURuntimeProductCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
                if (result) {
                    XCTAssertNil(error, @"Result with error.");
                    //DDLogDebug(@"%@", result);
                    XCTAssert(result.items && result.items.count > 0, @"No items");
                    self.waitingForBlock = NO;
                } else {
                    DDLogError(@"%@", error);
                    XCTAssertNotNil(error, @"Result nil but had no error.");
                    XCTFail(@"%@", error);
                    self.waitingForBlock = NO;
                }
            }];
        } else {
            XCTFail(@"No user auth ticket.");
            self.waitingForBlock = NO;
        }
    }];
    [self waitForBlock];
}

// Gets inventory (including product code) at a certain location (code).
- (void)testGettingLocationInventory
{
    [self authenticateAndSelectTenantWithCompletionHandler:^(MOZUScope *scope, MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error) {
        if (profile.authTicket) {
            MOZUAPIContext *context = [[MOZUAPIContext alloc] initWithTenantId:scope.id siteId:self.siteID masterCatalogId:@1 catalogId:@1];
            //context.userAuthTicket = profile.authTicket;
            
            MOZUAdminLocationInventoryResource *locationInventoryResource = [[MOZUAdminLocationInventoryResource alloc] initWithAPIContext:context dataViewMode:MOZULive];
            [locationInventoryResource locationInventoriesWithLocationCode:@"homebase" startIndex:@0 pageSize:@20 sortBy:nil filter:nil responseFields:nil completionHandler:^(MOZUAdminLocationInventoryCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
                if (result) {
                    XCTAssertNil(error, @"Result with error.");
                    //DDLogDebug(@"%@", result);
                    //XCTAssert(result.items && result.items.count > 0, @"No items");
                    self.waitingForBlock = NO;
                } else {
                    DDLogError(@"%@", error);
                    XCTAssertNotNil(error, @"Result nil but had no error.");
                    XCTFail(@"%@", error);
                    self.waitingForBlock = NO;
                }
            }];
        } else {
            XCTFail(@"No user auth ticket.");
            self.waitingForBlock = NO;
        }
    }];
    [self waitForBlock];
}

//
- (void)testGettingProductDetails
{
    [self authenticateAndSelectTenantWithCompletionHandler:^(MOZUScope *scope, MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error) {
        if (profile.authTicket) {
            MOZUAPIContext *context = [[MOZUAPIContext alloc] initWithTenantId:scope.id siteId:self.siteID masterCatalogId:@1 catalogId:@1];
            //context.userAuthTicket = profile.authTicket;
            
            MOZURuntimeProductResource *runtimeProductResource = [[MOZURuntimeProductResource alloc] initWithAPIContext:context];
            [runtimeProductResource productWithProductCode:productCode variationProductCode:nil allowInactive:@NO skipInventoryCheck:@YES supressOutOfStock404:@YES responseFields:nil completionHandler:^(MOZURuntimeProduct *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
                if (result) {
                    XCTAssertNil(error, @"Result with error.");
                    //DDLogDebug(@"%@", result);
                    self.waitingForBlock = NO;
                } else {
                    DDLogError(@"%@", error);
                    XCTAssertNotNil(error, @"Result nil but had no error.");
                    XCTFail(@"%@", error);
                    self.waitingForBlock = NO;
                }
            }];
        } else {
            XCTFail(@"No user auth ticket.");
            self.waitingForBlock = NO;
        }
    }];
    [self waitForBlock];
}

#pragma mark - Customers

- (void)testGettingCustomerAccounts
{
    [self authenticateAndSelectTenantWithCompletionHandler:^(MOZUScope *scope, MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error) {
        if (profile.authTicket) {
            MOZUAPIContext *context = [[MOZUAPIContext alloc] initWithTenantId:self.tenantID siteId:self.siteID masterCatalogId:@1 catalogId:@1];
            context.userAuthTicket = profile.authTicket;
            
            MOZUCustomerAccountResource *customerAccountResource = [[MOZUCustomerAccountResource alloc] initWithAPIContext:context];
            [customerAccountResource accountsWithStartIndex:@0 pageSize:@20 sortBy:nil filter:nil fields:nil q:nil qLimit:@10 isAnonymous:@NO responseFields:nil completionHandler:^(MOZUCustomerAccountCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
                if (result) {
                    XCTAssertNil(error, @"Result with error.");
                    //DDLogDebug(@"%@", result);
                    XCTAssert(result.items && result.items.count > 0, @"No items");
                    self.waitingForBlock = NO;
                } else {
                    DDLogError(@"%@", error);
                    XCTAssertNotNil(error, @"Result nil but had no error.");
                    XCTFail(@"%@", error);
                    self.waitingForBlock = NO;
                }
            }];
        } else {
            XCTFail(@"No user auth ticket.");
            self.waitingForBlock = NO;
        }
    }];
    [self waitForBlock];
}

- (void)testGettingCustomerOrders
{
    [self authenticateAndSelectTenantWithCompletionHandler:^(MOZUScope *scope, MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error) {
        if (profile.authTicket) {
            MOZUAPIContext *context = [[MOZUAPIContext alloc] initWithTenantId:scope.id siteId:self.siteID masterCatalogId:@1 catalogId:@1];
            context.userAuthTicket = profile.authTicket;
            
            MOZUOrderResource *orderResource = [[MOZUOrderResource alloc] initWithAPIContext:context];
            [orderResource ordersWithStartIndex:@0 pageSize:@20 sortBy:nil filter:@"customerAccountId+eq+1001" q:nil qLimit:@10 responseFields:nil completionHandler:^(MOZUOrderCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
                if (result) {
                    XCTAssertNil(error, @"Result with error.");
                    //DDLogDebug(@"%@", result);
                    XCTAssert(result.items && result.items.count > 0, @"No items");
                    self.waitingForBlock = NO;
                } else {
                    DDLogError(@"%@", error);
                    XCTAssertNotNil(error, @"Result nil but had no error.");
                    XCTFail(@"%@", error);
                    self.waitingForBlock = NO;
                }
            }];
        } else {
            XCTFail(@"No user auth ticket.");
            self.waitingForBlock = NO;
        }
    }];
    [self waitForBlock];
}

#pragma mark - Orders

- (void)testGettingOrderSummary
{
    MOZUAppAuthInfo *appAuthInfo = [self appAuthInfo];
    MOZUUserAuthInfo *userAuthInfo = [self userAuthInfo];
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:appAuthInfo
                                                             refeshInterval:nil
                                                          completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
                                                              
                                                              XCTAssertNil(error, @"Result with error.");
                                                              
                                                          }];
    
    
}


- (void)testGettingOrders
{
    [self authenticateAndSelectTenantWithCompletionHandler:^(MOZUScope *scope, MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error) {
        if (profile.authTicket) {
            MOZUAPIContext *context = [[MOZUAPIContext alloc] initWithTenantId:scope.id siteId:self.siteID masterCatalogId:@1 catalogId:@1];
            context.userAuthTicket = profile.authTicket;
            
            MOZUOrderResource *orderResource = [[MOZUOrderResource alloc] initWithAPIContext:context];
            [orderResource ordersWithStartIndex:@0 pageSize:@20 sortBy:nil filter:nil q:nil qLimit:@10 responseFields:nil completionHandler:^(MOZUOrderCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
                if (result) {
                    XCTAssertNil(error, @"Result with error.");
                    //DDLogDebug(@"%@", result);
                    XCTAssert(result.items && result.items.count > 0, @"No items");
                    self.waitingForBlock = NO;
                } else {
                    DDLogError(@"%@", error);
                    XCTAssertNotNil(error, @"Result nil but had no error.");
                    XCTFail(@"%@", error);
                    self.waitingForBlock = NO;
                }
            }];
        } else {
            XCTFail(@"No user auth ticket.");
            self.waitingForBlock = NO;
        }
    }];
    [self waitForBlock];
}

- (void)testGettingOrderDetails
{
    [self authenticateAndSelectTenantWithCompletionHandler:^(MOZUScope *scope, MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error) {
        if (profile.authTicket) {
            MOZUAPIContext *context = [[MOZUAPIContext alloc] initWithTenantId:scope.id siteId:self.siteID masterCatalogId:@1 catalogId:@1];
            context.userAuthTicket = profile.authTicket;
            
            MOZUOrderResource *orderResource = [[MOZUOrderResource alloc] initWithAPIContext:context];
            [orderResource orderWithOrderId:@"046d01a921f66341ccf2312400001911" draft:@(NO) responseFields:nil completionHandler:^(MOZUOrder *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
                if (result) {
                    XCTAssertNil(error, @"Result with error.");
                    //DDLogDebug(@"%@", result);
                    self.waitingForBlock = NO;
                } else {
                    DDLogError(@"%@", error);
                    XCTAssertNotNil(error, @"Result nil but had no error.");
                    XCTFail(@"%@", error);
                    self.waitingForBlock = NO;
                }
            }];
        } else {
            XCTFail(@"No user auth ticket.");
            self.waitingForBlock = NO;
        }
    }];
    [self waitForBlock];
}

@end
