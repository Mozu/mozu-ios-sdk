//
//  MOZUUserAuthenticator.m
//  MozuApi
//
//  Created by Kevin Wright on 11/21/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import "MOZUUserAuthenticator.h"
#import "MOZUAppAuthenticator.h"
#import "MOZUAPIError.h"
#import "MOZUResponseHelper.h"
#import "MOZUHeaders.h"
#import "MOZUAPILogger.h"
#import "MOZUTenantAdminUserAuthTicketURLComponents.h"
#import "MOZUDeveloperAdminUserAuthTicketURLComponents.h"
#import "MOZUUserAuthInfo.h"
#import "MOZUCustomerAuthTicket.h"
#import "MOZUTenantAdminUserAuthTicket.h"
#import "MOZUDeveloperAdminUserAuthTicket.h"
#import "MOZUCustomerAuthTicketURLComponents.h"

static NSString * const MOZUClientBackgroundSessionIdentifier = @"MOZUClientBackgroundSessionIdentifier";

@implementation MOZUScope

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        _id   = [coder decodeIntegerForKey:@"id"];
        _name = [coder decodeObjectForKey:@"name"];
    }
    return self;
}


- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeInteger:_id forKey:@"id"];
    [encoder encodeObject:_name forKey:@"name"];
}

- (BOOL)isEqual:(id)object
{
    BOOL sameID = self.id == [object id];
    BOOL sameName = [self string:self.name nilOrEqualToString:[object name]];
    return sameID && sameName;
}

- (NSUInteger)hash
{
    return self.id;
}

- (BOOL)string:(NSString *)a nilOrEqualToString:(NSString *)b
{
    return (a == nil && b == nil) || [a isEqualToString:b];
}

@end

@implementation MOZUUserAuthTicket

- (instancetype)initWithScope:(MOZUAuthenticationScope)scope
                     tenentId:(NSNumber *)tenentId
                  accessToken:(NSString *)accessToken
        accessTokenExpiration:(NSDate *)accessTokenExpirationDate
                 refreshToken:(NSString *)refreshToken
       refreshTokenExpiration:(NSDate *)refreshTokenExpirationDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ"];
    NSString *accessTokenExpiration = [dateFormatter stringFromDate:accessTokenExpirationDate];
    NSString *refreshTokenExpiration = [dateFormatter stringFromDate:refreshTokenExpirationDate];
    
    NSMutableDictionary *dictionary = [@{@"scope": @(scope),
                                 @"accessToken": accessToken,
                                         @"accessTokenExpiration": accessTokenExpiration,
                                 @"refreshToken": refreshToken,
                                 @"refreshTokenExpiration": refreshTokenExpiration,
                                 } mutableCopy];
    if (tenentId) {
        dictionary[@"tenentId"] = tenentId;
    }
    self = [super initWithDictionary:dictionary error:nil];
    if (self) {
        
    }
    return self;
}

@end

@implementation MOZUAuthenticationProfile

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        _authTicket       = [coder decodeObjectForKey:@"authTicket"];
        _authorizedScopes = [coder decodeObjectForKey:@"authorizedScopes"];
        _activeScope      = [coder decodeObjectForKey:@"activeScope"];
        _userProfile      = [coder decodeObjectForKey:@"userProfile"];
        _shopperAccount   = [coder decodeObjectForKey:@"shopperAccount"];
    }
    return self;
}


- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_authTicket forKey:@"authTicket"];
    [encoder encodeObject:_authorizedScopes forKey:@"authorizedScopes"];
    [encoder encodeObject:_activeScope forKey:@"activeScope"];
    [encoder encodeObject:_userProfile forKey:@"userProfile"];
    [encoder encodeObject:_shopperAccount forKey:@"shopperAccount"];
}

- (NSUInteger)hash
{
    return [self.userProfile.emailAddress hash];
}

/*
- (BOOL)isEqual:(id)object
{
    BOOL sameID = self.id == [object id];
    BOOL sameName = [self string:self.name nilOrEqualToString:[object name]];
    return sameID && sameName;
}

- (BOOL)string:(NSString *)a nilOrEqualToString:(NSString *)b
{
    return (a == nil && b == nil) || [a isEqualToString:b];
}
*/
@end

@implementation MOZUUserAuthenticator

+ (MOZUUserAuthenticator *)sharedUserAuthenticator {
    static MOZUUserAuthenticator *_sharedUserAuthenticator = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        _sharedUserAuthenticator = [[self alloc] init];
    });
    
    return _sharedUserAuthenticator;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _backgroundSessionIdentifier = MOZUClientBackgroundSessionIdentifier;
        _sessionConfiguration = MOZUUserAuthenticatorDefaultSessionConfiguration;
    }
    return self;
}

- (void)setActiveScopeWithUserAuthTicket:(MOZUUserAuthTicket *)userAuthTicket
                                   scope:(MOZUScope *)scope
                       completionHandler:(MOZUUserAuthenticationCompletionBlock)completion
{
    [self refreshWithUserAuthTicket:userAuthTicket
                         identifier:@(scope.id)
                  completionHandler:^(MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error) {
                      completion(profile, response, error);
                  }];
}

- (void)ensureUserAuthTicket:(MOZUUserAuthTicket *)userAuthTicket
           completionHandler:(MOZUUserAuthenticationCompletionBlock)completion
{
    NSDate *refreshTime = [NSDate dateWithTimeInterval:-180 sinceDate:self.userAuthTicket.accessTokenExpiration];
    if ([refreshTime timeIntervalSinceNow] < 0) {
        [self refreshWithUserAuthTicket:self.userAuthTicket
                             identifier:nil
                      completionHandler:^(MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error) {
                          completion(profile, response, error);
                      }];
    } else {
        completion(nil, nil, nil);
    }
}

- (void)addAuthHeaderToRequest:(NSMutableURLRequest *)request
             completionHandler:(MOZUAppAuthenticationCompletionBlock)completion {
    [[MOZUAppAuthenticator sharedAppAuthenticator] ensureAuthTicketWithCompletionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
        NSString *tenantId = self.tenant ? self.tenant : @"";
        NSString *siteId = self.site ? self.site : @"";
        
        [request setValue:[MOZUAppAuthenticator sharedAppAuthenticator].authTicket.accessToken forHTTPHeaderField:MOZU_X_VOL_APP_CLAIMS];
        [request setValue:tenantId forHTTPHeaderField:MOZU_X_VOL_TENANT];
        [request setValue:siteId forHTTPHeaderField:MOZU_X_VOL_SITE];
        
        completion(response, error);
    }];
}

- (void)refreshWithUserAuthTicket:(MOZUUserAuthTicket *)userAuthTicket
                       identifier:(NSNumber *)identifier
                completionHandler:(MOZUUserAuthenticationCompletionBlock)completion
{
    NSURL *url = [self resourceRefreshURLWithAuthTicket:userAuthTicket identifier:identifier];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    [request setHTTPMethod:@"PUT"];
    
    [[MOZUUserAuthenticator sharedUserAuthenticator] addAuthHeaderToRequest:request completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
        if (error) {
            DDLogError(@"%@", error.localizedDescription);
            completion(nil, response, error);
        } else {
            if (userAuthTicket.siteId) {
                [request setValue:[userAuthTicket.siteId stringValue] forHTTPHeaderField:MOZU_X_VOL_SITE];
            }
            NSURLSessionConfiguration *sessionConfiguration = [self sessionConfigurationFromEnum:self.sessionConfiguration];
            NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
            NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                                            NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                            MOZUAPIError *apiError = [MOZUResponseHelper ensureSuccessOfResponse:httpResponse JSONResult:json error:error];
                                                            if (apiError) {
                                                                completion(nil, httpResponse, apiError);
                                                            } else {
                                                                MOZUAuthenticationProfile *authProfile = [self authenticationProfileWithJSON:json scope:userAuthTicket.scope];
                                                                self.userAuthTicket = authProfile.authTicket;
                                                                completion(authProfile, httpResponse, nil);
                                                            }
                                                        }];
            [dataTask resume];
        }
    }];
}

- (void)authenticateWithUserAuthInfo:(MOZUUserAuthInfo *)userAuthInfo
                               scope:(MOZUAuthenticationScope)scope
                          identifier:(NSNumber *)identifier
                   completionHandler:(MOZUUserAuthenticationCompletionBlock)completion
{
    NSURL *url = [self resourceURLWithUserScope:scope identifier:identifier];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    [request setHTTPMethod:@"POST"];
    NSData *body = [[userAuthInfo toJSONString] dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:body];
    
    [[MOZUUserAuthenticator sharedUserAuthenticator] addAuthHeaderToRequest:request completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
        if (error) {
            DDLogError(@"%@", error.localizedDescription);
            completion(nil, response, error);
        } else {
            NSURLSessionConfiguration *sessionConfiguration = [self sessionConfigurationFromEnum:self.sessionConfiguration];
            NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
            NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                                            NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                            MOZUAPIError *apiError = [MOZUResponseHelper ensureSuccessOfResponse:httpResponse JSONResult:json error:error];
                                                            if (apiError) {
                                                                completion(nil, httpResponse, apiError);
                                                            } else {
                                                                MOZUAuthenticationProfile *authProfile = [self authenticationProfileWithJSON:json scope:scope];
                                                                completion(authProfile, httpResponse, nil);
                                                            }
                                                        }];
            [dataTask resume];
        }
    }];
}

- (void)logoutWithUserAuthTicket:(MOZUUserAuthTicket *)userAuthTicket
               completionHandler:(void (^)(NSHTTPURLResponse *, MOZUAPIError *))completion;
{
    NSURL *url = [self logoutURLWithAuthTicket:userAuthTicket];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] addAuthHeaderToRequest:request completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
        if (error) {
            DDLogError(@"%@", error.localizedDescription);
            completion(response, error);
        } else {
            NSURLSessionConfiguration *sessionConfiguration = [self sessionConfigurationFromEnum:self.sessionConfiguration];
            NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
            NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                                            NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                            MOZUAPIError *apiError = [MOZUResponseHelper ensureSuccessOfResponse:httpResponse JSONResult:json error:error];
                                                            
                                                            completion(httpResponse, apiError);
                                                        }];
            [dataTask resume];
        }
    }];
}

- (MOZUAuthenticationProfile *)authenticationProfileWithJSON:(NSString *)JSONData scope:(MOZUAuthenticationScope)scope
{
    MOZUAuthenticationProfile *authProfile = [MOZUAuthenticationProfile new];
    
    MOZUUserAuthTicket *userAuthTicket = nil;
    switch (scope) {
        case MOZUTenantAuthenticationScope: {
            JSONModelError *JSONError = nil;
            MOZUTenantAdminUserAuthTicket *tenentAdminUserAuthTicket = [[MOZUTenantAdminUserAuthTicket alloc] initWithString:JSONData error:&JSONError];
            if (!tenentAdminUserAuthTicket) {
                DDLogError(@"%@", JSONError.localizedDescription);
            } else {
                userAuthTicket = [[MOZUUserAuthTicket alloc] initWithScope:scope
                                                                  tenentId:@(tenentAdminUserAuthTicket.tenant.id)
                                                               accessToken:tenentAdminUserAuthTicket.accessToken
                                                     accessTokenExpiration:tenentAdminUserAuthTicket.accessTokenExpiration
                                                              refreshToken:tenentAdminUserAuthTicket.refreshToken
                                                    refreshTokenExpiration:tenentAdminUserAuthTicket.refreshTokenExpiration];

                authProfile.userProfile = tenentAdminUserAuthTicket.user;
                
                NSMutableArray *authorizedScopes = [[NSMutableArray alloc] initWithCapacity:tenentAdminUserAuthTicket.availableTenants.count];
                [tenentAdminUserAuthTicket.availableTenants enumerateObjectsUsingBlock:^(MOZUTenant *obj, NSUInteger idx, BOOL *stop) {
                    MOZUScope *scope = [MOZUScope new];
                    scope.id = obj.id;
                    scope.name = obj.name;
                    [authorizedScopes addObject:scope];
                }];
                authProfile.authorizedScopes = [authorizedScopes copy];
                
                if (tenentAdminUserAuthTicket.tenant) {
                    MOZUScope *scope = [MOZUScope new];
                    scope.id = tenentAdminUserAuthTicket.tenant.id;
                    scope.name = tenentAdminUserAuthTicket.tenant.name;
                    authProfile.activeScope = scope;
                }
            }
        }
            break;
        case MOZUDeveloperAuthenticationScope: {
            JSONModelError *JSONError = nil;
            MOZUDeveloperAdminUserAuthTicket *developerAdminUserAuthTicket = [[MOZUDeveloperAdminUserAuthTicket alloc] initWithString:JSONData error:&JSONError];
            if (!developerAdminUserAuthTicket) {
                DDLogError(@"%@", JSONError.localizedDescription);
            } else {
                userAuthTicket = [[MOZUUserAuthTicket alloc] initWithScope:scope
                                                                  tenentId:nil
                                                               accessToken:developerAdminUserAuthTicket.accessToken
                                                     accessTokenExpiration:developerAdminUserAuthTicket.accessTokenExpiration
                                                              refreshToken:developerAdminUserAuthTicket.refreshToken
                                                    refreshTokenExpiration:developerAdminUserAuthTicket.refreshTokenExpiration];

                authProfile.userProfile = developerAdminUserAuthTicket.user;
                
                NSMutableArray *authorizedScopes = [[NSMutableArray alloc] initWithCapacity:developerAdminUserAuthTicket.availableAccounts.count];
                [developerAdminUserAuthTicket.availableAccounts enumerateObjectsUsingBlock:^(MOZUDeveloperAccount *obj, NSUInteger idx, BOOL *stop) {
                    MOZUScope *scope = [MOZUScope new];
                    scope.id = obj.id;
                    scope.name = obj.name;
                    [authorizedScopes addObject:scope];
                }];
                authProfile.authorizedScopes = [authorizedScopes copy];
                
                if (developerAdminUserAuthTicket.account) {
                    MOZUScope *scope = [MOZUScope new];
                    scope.id = developerAdminUserAuthTicket.account.id;
                    scope.name = developerAdminUserAuthTicket.account.name;
                    authProfile.activeScope = scope;
                }
            }
        }
            break;
        case MOZUCustomerAuthenticationScope: {
            JSONModelError *JSONError = nil;
            
            MOZUCustomerAuthTicket *customerAuthTicket = [[MOZUCustomerAuthTicket alloc] initWithString:JSONData error:&JSONError];
            if (!customerAuthTicket) {
                DDLogError(@"%@", JSONError.localizedDescription);
            }else{
                
                userAuthTicket = [[MOZUUserAuthTicket alloc] initWithScope:scope
                                                                  tenentId:nil
                                                               accessToken:customerAuthTicket.accessToken
                                                     accessTokenExpiration:customerAuthTicket.accessTokenExpiration
                                                              refreshToken:customerAuthTicket.refreshToken
                                                    refreshTokenExpiration:customerAuthTicket.refreshTokenExpiration];
                
                authProfile.shopperAccount = customerAuthTicket.customerAccount;
                
                if (customerAuthTicket.customerAccount) {
                    MOZUScope *scope = [MOZUScope new];
                    scope.id = customerAuthTicket.customerAccount.id;
                    scope.name = customerAuthTicket.customerAccount.userId;
                    authProfile.activeScope = scope;
                }
                
            }
        }
            break;
        default:
            DDLogError(@"Not implemented: %@", [@(scope) stringValue]);
            break;
    }
    
    authProfile.authTicket = userAuthTicket;

    return authProfile;
}

- (NSURL *)resourceRefreshURLWithAuthTicket:(MOZUUserAuthTicket *)authTicket identifier:(NSNumber *)identifier
{
    MOZUURLComponents *components = nil;
    
    switch (authTicket.scope) {
        case MOZUTenantAuthenticationScope:
            components = [MOZUTenantAdminUserAuthTicketURLComponents URLComponentsForRefreshAuthTicketOperationWithTenantId:identifier responseFields:nil];
            break;
        case MOZUDeveloperAuthenticationScope:
            components = [MOZUDeveloperAdminUserAuthTicketURLComponents URLComponentsForRefreshDeveloperAuthTicketOperationWithDeveloperAccountId:identifier responseFields:nil];
            break;
        case MOZUCustomerAuthenticationScope:
            components = [MOZUCustomerAuthTicketURLComponents URLComponentsForRefreshUserAuthTicketOperationWithRefreshToken:authTicket.refreshToken responseFields:nil];
            break;
        default:
            DDLogError(@"Not implemented: %@", [@(authTicket.scope) stringValue]);
            break;
    }
    
    components.host = [MOZUUserAuthenticator sharedUserAuthenticator].host;
    components.useSSL = [MOZUAppAuthenticator sharedAppAuthenticator].useSSL; // TODO: Remove this when ssl bug is fixed.
    return components.URL;
}

- (NSURL *)resourceURLWithUserScope:(MOZUAuthenticationScope)scope identifier:(NSNumber *)identifier
{
    MOZUURLComponents *components = nil;
    
    switch (scope) {
        case MOZUTenantAuthenticationScope:
            components = [MOZUTenantAdminUserAuthTicketURLComponents URLComponentsForCreateUserAuthTicketOperationWithTenantId:identifier responseFields:nil];
            break;
        case MOZUDeveloperAuthenticationScope:
            components = [MOZUDeveloperAdminUserAuthTicketURLComponents URLComponentsForCreateDeveloperUserAuthTicketOperationWithDeveloperAccountId:identifier responseFields:nil];
            break;
        case MOZUCustomerAuthenticationScope:
            components = [MOZUCustomerAuthTicketURLComponents URLComponentsForCreateUserAuthTicketOperationWithResponseFields:nil];
            break;
        default:
            DDLogError(@"Not implemented: %@", [@(scope) stringValue]);
            break;
    }
    
    components.host = [MOZUUserAuthenticator sharedUserAuthenticator].host;
    components.useSSL = [MOZUAppAuthenticator sharedAppAuthenticator].useSSL; // TODO: Remove this when ssl bug is fixed.
    return components.URL;
}

- (NSURL *)logoutURLWithAuthTicket:(MOZUUserAuthTicket *)userAuthTicket
{
    MOZUURLComponents *components = nil;
    
    switch (userAuthTicket.scope) {
        case MOZUTenantAuthenticationScope:
            components = [MOZUTenantAdminUserAuthTicketURLComponents URLComponentsForDeleteUserAuthTicketOperationWithRefreshToken:userAuthTicket.refreshToken];
            break;
        case MOZUDeveloperAuthenticationScope:
            components = [MOZUDeveloperAdminUserAuthTicketURLComponents URLComponentsForDeleteUserAuthTicketOperationWithRefreshToken:userAuthTicket.refreshToken];
            break;
        default:
            DDLogError(@"Not implemented: %@", [@(userAuthTicket.scope) stringValue]);
            break;
    }
    
    components.host = [MOZUAppAuthenticator sharedAppAuthenticator].host;
    components.useSSL = [MOZUAppAuthenticator sharedAppAuthenticator].useSSL; // TODO: Remove this when ssl bug is fixed.
    return components.URL;
}

- (NSURLSessionConfiguration *)sessionConfigurationFromEnum:(MOZUUserAuthenticatorSessionConfiguration)configuration
{
    NSURLSessionConfiguration *sessionConfiguration = nil;
    switch (configuration) {
        case MOZUUserAuthenticatorBackgroundSessionConfiguration:
            sessionConfiguration = [NSURLSessionConfiguration backgroundSessionConfiguration:self.backgroundSessionIdentifier];
            break;
        case MOZUUserAuthenticatorDefaultSessionConfiguration:
            sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
            break;
        case MOZUUserAuthenticatorEphemeralSessionConfiguration:
            sessionConfiguration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
            break;
        default:
            break;
    }
    return sessionConfiguration;
}


@end
