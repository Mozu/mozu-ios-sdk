//
//  MOZUViewController.m
//  mozu-ios-sdk
//
//  Created by rabin-joshi-volusion on 04/18/2016.
//  Copyright (c) 2016 rabin-joshi-volusion. All rights reserved.
//

#import "MOZUViewController.h"

#import "MOZUAPIError.h"
#import "MOZUAPIVersion.h"
#import "MOZUAppAuthenticator.h"
#import "MOZUResponseHelper.h"
#import "MOZUAppAuthInfo.h"
#import "MOZUUserAuthInfo.h"
#import "MOZUUserAuthenticator.h"
#import "MOZUAuthTicket.h"
#import "MOZUAuthTicketRequest.h"
#import "MOZUCustomerAuthenticator.h"
#import "MOZUCustomerAuthTicket.h"
#import "MOZURefreshInterval.h"
#import "MOZUHeaders.h"
#import "MOZUAPILogger.h"
#import "MOZURuntimeCategoryResource.h"
#import "MOZUAuthenticatonManager.h"



@interface MOZUViewController ()

@property (nonatomic, copy) NSString *appID;
@property (nonatomic, copy) NSString *sharedSecret;
@property (nonatomic, copy) NSString *emailAddress;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *tenantHost;
@property (nonatomic, copy) NSString *tenantID;
@property (nonatomic, copy) NSString *siteID;
@property (nonatomic, copy) NSString *productCode;

@property (nonatomic, strong) MOZUAPIContext *context;

@end

@implementation MOZUViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadSecurityInfo];
    [self testAppAuth];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadSecurityInfo
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MOZUAPIKeys" ofType:@"json"];
    NSAssert(path.length, @"Invalid API Keys or file missing");
    
    NSError *error = nil;
    NSData *data = [[NSData alloc] initWithContentsOfFile:path options:0 error:&error];
    if (error) {
        NSAssert(path.length, @"Invalid API Keys or file missing");
    }
    
    NSDictionary *securityDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (error) {
        NSAssert(path.length, @"Invalid API Keys or file missing");
    }
    
    self.appID = securityDictionary[@"appID"];
    self.sharedSecret = securityDictionary[@"sharedSecret"];
    self.emailAddress = securityDictionary[@"emailAddress"];
    self.password = securityDictionary[@"password"];
    self.tenantHost = securityDictionary[@"tenantHost"];
    self.tenantID = securityDictionary[@"tenantID"];
    self.siteID = securityDictionary[@"siteID"];
    self.productCode = securityDictionary[@"productCode"];
}

#pragma mark - App Authentication 

- (void)testAppAuth
{
    
    MOZUAppAuthInfo *appAuthInfo = [[MOZUAppAuthInfo alloc] init];
    appAuthInfo.applicationId = self.appID;
    appAuthInfo.sharedSecret = self.sharedSecret;
    
    MOZUAPIContext *theContext = [[MOZUAPIContext alloc] init];
    theContext.appAuthInfo = appAuthInfo;
    theContext.tenantHost = self.tenantHost;
    theContext.tenantIdString = self.tenantID;
    theContext.siteIdString = self.siteID;
    self.context = theContext;
    
    MOZURuntimeCategoryResource *categoryResource = [[MOZURuntimeCategoryResource alloc] initWithAPIContext:self.context];
    [categoryResource categoryTreeWithResponseFields:nil completionHandler:^(MOZURuntimeCategoryCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
        
        if (error != nil ) {
            NSLog(@"Error: %@", error);
            return;
        }
        
        NSLog(@"Products fetched!");
    }];
}



#pragma mark - Old

- (void)testAppAuthentication
{
    MOZUAppAuthInfo *authInfo = [[MOZUAppAuthInfo alloc] init];
    authInfo.applicationId = self.appID;
    authInfo.sharedSecret = self.sharedSecret;
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:authInfo refeshInterval:nil completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {

        if (error != nil ) {
            NSLog(@"Error: %@", error);
            return;
        }
        
        NSLog(@"App Authenticated!");
        
        
        [self testCustomerAuthentication];

    }];
}

- (void)testUserAuthentication
{
    MOZUUserAuthInfo *userAuthInfo = [MOZUUserAuthInfo new];
    userAuthInfo.emailAddress = self.emailAddress;
    userAuthInfo.password = self.password;

    MOZUUserAuthenticator *authenticator = [MOZUUserAuthenticator sharedUserAuthenticator];
    authenticator.host =  self.tenantHost;
    authenticator.tenant = self.tenantID;
    authenticator.site = self.siteID;
    
    [authenticator authenticateWithUserAuthInfo:userAuthInfo
                                          scope:MOZUCustomerAuthenticationScope
                                     identifier:nil
                            guestUserAuthTicket:nil
                              completionHandler:^(MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error) {
                                  
                                  if (error != nil ) {
                                      NSLog(@"Error: %@", error);
                                      return;
                                  }
                                  
                                  NSLog(@"User Authenticated!");
                                  [self testFetchingCategoryTree];
                              }];
}

#pragma mark - Customer Authentication

- (void)testCustomerAuthentication
{
    MOZUCustomerUserAuthInfo *customerUserAuthInfo = [[MOZUCustomerUserAuthInfo alloc] init];
    customerUserAuthInfo.username = self.emailAddress;
    customerUserAuthInfo.password = self.password;
    
    MOZUAuthenticatonManager *authenticator = [MOZUAuthenticatonManager sharedManager];
    authenticator.apiVersion = [MOZUAPIVersion version];
    authenticator.appToken = [MOZUAppAuthenticator sharedAppAuthenticator].authTicket.accessToken;
    authenticator.host =  self.tenantHost;
    authenticator.tenant = self.tenantID;
    authenticator.site = self.siteID;

    [authenticator createCustomerAuthTicketWithCustomerUserAuthInfo:customerUserAuthInfo
                                                  completionHandler:^(MOZUCustomerAuthTicket *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
                                                      
                                                      if (error != nil ) {
                                                          NSLog(@"Error: %@", error);
                                                          return;
                                                      }
                                                      
                                                      NSLog(@"Customer Authenticated!");
                                                      [self testCustomerAuthenticationRefresh:result];
                                                  }];
    
}

- (void)testCustomerAuthenticationRefresh:(MOZUCustomerAuthTicket *)customerAuthTicket
{
    MOZUAuthenticatonManager *authenticator = [MOZUAuthenticatonManager sharedManager];
    authenticator.apiVersion = [MOZUAPIVersion version];
    authenticator.appToken = [MOZUAppAuthenticator sharedAppAuthenticator].authTicket.accessToken;
    authenticator.host =  self.tenantHost;
    authenticator.tenant = self.tenantID;
    authenticator.site = self.siteID;
    
    authenticator.customerAuthTicket = customerAuthTicket;
    
    [authenticator ensureCustomerAuthTicketWithCompletionHandler:^(MOZUCustomerAuthTicket *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
        
                if (error != nil ) {
                    NSLog(@"Error: %@", error);
                    return;
                }
        
                NSLog(@"Customer Auth Token Refreshed!");
        [self testFetchingCategoryTree];
    }
     
     ];    
}

#pragma mark - Products

- (void)testFetchingCategoryTree
{
    NSInteger tenantIdInteger = self.tenantID.integerValue;
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = kCFNumberFormatterNoStyle;
    NSNumber *siteIDNumber = [f numberFromString:self.siteID];
    
    MOZUAPIContext *context = [[MOZUAPIContext alloc] initWithTenantId:tenantIdInteger siteId:siteIDNumber masterCatalogId:nil catalogId:nil];
    context.tenantHost = self.tenantHost;
    
    MOZURuntimeCategoryResource *categoryResource = [[MOZURuntimeCategoryResource alloc] initWithAPIContext:context];
    [categoryResource categoryTreeWithResponseFields:nil completionHandler:^(MOZURuntimeCategoryCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
        
        if (error != nil ) {
            NSLog(@"Error: %@", error);
            return;
        }
        
        NSLog(@"Products fetched!");
    }];
}

@end
