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
#import "MOZUTenantAdminUserAuthTicket.h"
#import "MOZUDeveloperAdminUserAuthTicket.h"

static NSString * const MOZUClientBackgroundSessionIdentifier = @"MOZUClientBackgroundSessionIdentifier";

@implementation MOZUScope
@end

@implementation MOZUUserAuthTicket
@end

@implementation MOZUAuthenticationProfile
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
    NSDate *refreshTime = [NSDate dateWithTimeInterval:-180 sinceDate:userAuthTicket.accessTokenExpiration];
    if ([refreshTime timeIntervalSinceNow] < 0) {
        [self refreshWithUserAuthTicket:userAuthTicket
                             identifier:nil
                      completionHandler:^(MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error) {
                          completion(profile, response, error);
                      }];
    } else {
        completion(nil, nil, nil);
    }
}

- (void)refreshWithUserAuthTicket:(MOZUUserAuthTicket *)userAuthTicket
                       identifier:(NSNumber *)identifier
                completionHandler:(MOZUUserAuthenticationCompletionBlock)completion
{
    NSURL *url = [self resourceRefreshURLWithAuthTicket:userAuthTicket identifier:identifier];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    [request setHTTPMethod:@"PUT"];
    NSData* body = [[userAuthTicket toJSONString] dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:body];
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] addAuthHeaderToRequest:request completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
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
                                                            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
                                                            NSString* json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                            MOZUAPIError* apiError = [MOZUResponseHelper ensureSuccessOfResponse:httpResponse JSONResult:json error:error];
                                                            
                                                            MOZUAuthenticationProfile *authProfile = [self authenticationProfileWithJSON:json scope:userAuthTicket.scope];
                                                            completion(authProfile, httpResponse, apiError);
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
    NSData* body = [[userAuthInfo toJSONString] dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:body];
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] addAuthHeaderToRequest:request completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
        if (error) {
            DDLogError(@"%@", error.localizedDescription);
            completion(nil, response, error);
        } else {
            NSURLSessionConfiguration *sessionConfiguration = [self sessionConfigurationFromEnum:self.sessionConfiguration];
            NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
            NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
                                                            NSString* json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                            MOZUAPIError* apiError = [MOZUResponseHelper ensureSuccessOfResponse:httpResponse JSONResult:json error:error];
                                                            
                                                            MOZUAuthenticationProfile *authProfile = [self authenticationProfileWithJSON:json scope:scope];
                                                            completion(authProfile, httpResponse, apiError);
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
                                                            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
                                                            NSString* json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                            MOZUAPIError* apiError = [MOZUResponseHelper ensureSuccessOfResponse:httpResponse JSONResult:json error:error];
                                                            
                                                            completion(httpResponse, apiError);
                                                        }];
            [dataTask resume];
        }
    }];
}

- (MOZUAuthenticationProfile *)authenticationProfileWithJSON:(NSString *)JSONData scope:(MOZUAuthenticationScope)scope
{
    MOZUAuthenticationProfile *authProfile = [MOZUAuthenticationProfile new];
    JSONModelError *JSONError = nil;
    MOZUUserAuthTicket *userAuthTicket = [[MOZUUserAuthTicket alloc] initWithString:JSONData error:&JSONError];
    if (!userAuthTicket) {
        DDLogError(@"%@", JSONError.localizedDescription);
    } else {
        authProfile.authTicket = userAuthTicket;
        authProfile.authTicket.scope = scope;
    }
    
    switch (scope) {
        case MOZUTenantAuthenticationScope: {
            JSONModelError *JSONError = nil;
            MOZUTenantAdminUserAuthTicket *tenentAdminUserAuthTicket = [[MOZUTenantAdminUserAuthTicket alloc] initWithString:JSONData error:&JSONError];
            if (!tenentAdminUserAuthTicket) {
                DDLogError(@"%@", JSONError.localizedDescription);
            } else {
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
        default:
            DDLogError(@"Not implemented: %@", [@(scope) stringValue]);
            break;
    }
    return authProfile;
}

- (NSURL *)resourceRefreshURLWithAuthTicket:(MOZUUserAuthTicket *)authTicket identifier:(NSNumber*)identifier
{
    MOZUURLComponents *components = nil;
    
    switch (authTicket.scope) {
        case MOZUTenantAuthenticationScope:
            components = [MOZUTenantAdminUserAuthTicketURLComponents URLComponentsForRefreshAuthTicketOperationWithTenantId:identifier];
            break;
        case MOZUDeveloperAuthenticationScope:
            components = [MOZUDeveloperAdminUserAuthTicketURLComponents URLComponentsForRefreshDeveloperAuthTicketOperationWithDeveloperAccountId:identifier];
            break;
        default:
            DDLogError(@"Not implemented: %@", [@(authTicket.scope) stringValue]);
            break;
    }
    
    components.host = [MOZUAppAuthenticator sharedAppAuthenticator].host;
    return components.URL;
}

- (NSURL *)resourceURLWithUserScope:(MOZUAuthenticationScope)scope identifier:(NSNumber*)identifier
{
    MOZUURLComponents *components = nil;
    
    switch (scope) {
        case MOZUTenantAuthenticationScope:
            components = [MOZUTenantAdminUserAuthTicketURLComponents URLComponentsForCreateUserAuthTicketOperationWithTenantId:identifier];
            break;
        case MOZUDeveloperAuthenticationScope:
            components = [MOZUDeveloperAdminUserAuthTicketURLComponents URLComponentsForCreateDeveloperUserAuthTicketOperationWithDeveloperAccountId:identifier];
            break;
        default:
            DDLogError(@"Not implemented: %@", [@(scope) stringValue]);
            break;
    }
    
    components.host = [MOZUAppAuthenticator sharedAppAuthenticator].host;
    return components.URL;
}

- (NSURL *)logoutURLWithAuthTicket:(MOZUUserAuthTicket*)userAuthTicket
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
