//
//  MozuClient.m
//  Api
//
//  Created by Sanjay Mandadi on 10/15/13.
//  Copyright (c) 2013 Mozu. All rights reserved.
//

#import "MOZUAppAuthenticator.h"
#import "MOZUClient.h"
#import "MOZUHeaders.h"
#import "MOZUResponseHelper.h"
#import "MOZUUserAuthenticator.h"
#import "MOZUTenantResource.h"
#import "MOZUAPIVersion.h"
#import "MOZUAPILogger.h"
#import "MOZUConfig.h"

@interface MOZUClient()

@property(nonatomic, strong) NSString *JSONResult;
@property(nonatomic, strong) id result; // Is this needed?
@property(nonatomic, assign) NSInteger statusCode;
@property(nonatomic, strong) MOZUAPIError *error;

@property (nonatomic, strong) NSMutableDictionary *mutableHeaders;
@property (nonatomic, strong) NSString *host;
@property (nonatomic, strong) MOZUURLComponents *resourceURLComponents;
@property (nonatomic, strong) NSString *verb;
@property (nonatomic, strong) NSString *bodyString;
@property (nonatomic, strong) NSDictionary *dataViewModeMap;

@end

static NSString * const MOZUAPIClientErrorDomain = @"MOZUAPIClientErrorDomain";
static NSString * const MOZUClientBackgroundSessionIdentifier = @"MOZUClientBackgroundSessionIdentifier";

@implementation MOZUClient

- (instancetype)init
{
    if (self = [super init])
    {
        _mutableHeaders = [NSMutableDictionary new];
        _dataViewModeMap = @{ [@(MOZULive) stringValue]: @"Live",
                             [@(MOZUPending) stringValue]: @"Pending"};
        _backgroundSessionIdentifier = MOZUClientBackgroundSessionIdentifier;
        _sessionConfiguration = MOZUClientDefaultSessionConfiguration;
    }
    
    return self;
}

- (instancetype)initWithResourceURLComponents:(MOZUURLComponents *)resourceURLComponents
                                         verb:(NSString *)verb;
{
    if (self = [self init]) {
        NSParameterAssert(verb);
        NSParameterAssert(resourceURLComponents);
        _resourceURLComponents = resourceURLComponents;
        _verb = verb;
    }
    
    return self;
}

- (void)setContext:(MOZUAPIContext *)context
{    
    _context = context;
    
    if (context.tenantId > 0) {
        [self setHeader:MOZU_X_VOL_TENANT value:[@(context.tenantId) description]];
    }
    
    if (context.siteId != nil && [context.siteId integerValue] > 0) {
        [self setHeader:MOZU_X_VOL_SITE value:[context.siteId stringValue]];
    }
    
    if (context.masterCatalogId != nil && [context.masterCatalogId integerValue] > 0) {
        [self setHeader:MOZU_X_VOL_MASTER_CATALOG value:[context.masterCatalogId stringValue]];
    }
    
    if (context.catalogId != nil && [context.catalogId integerValue] > 0)
    {
        [self setHeader:MOZU_X_VOL_CATALOG value:[context.catalogId stringValue]];
    }
    
    if (context.locale != nil)
    {
        [self setHeader:MOZU_X_VOL_LOCALE value:context.locale];
    }
    
    if (context.currency != nil)
    {
        [self setHeader:MOZU_X_VOL_CURRENCY value:context.currency];
    }
    
}

- (void)validateUserClaims:(MOZUUserAuthTicket *)userClaims completionHandler:(void (^)(NSError *error))completion
{
    NSParameterAssert(userClaims);
    
    //if (userClaims.scope == MOZUCustomerAuthenticationScope) {
        // TODO: newAuthTicket = CustomerAuthenticator.EnsureAuthTicket(authTicket);
    //} else {
        [[MOZUUserAuthenticator sharedUserAuthenticator] ensureUserAuthTicket:userClaims completionHandler:^(MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error) {
            if (error) {
                DDLogError(@"%@", error);
                completion(error);
            } else if (profile) {
                DDLogDebug(@"Refreshed token.\nOld: %@\nNew:%@", userClaims.accessTokenExpiration, profile.authTicket.accessTokenExpiration);
                userClaims.accessToken = profile.authTicket.accessToken;
                userClaims.accessTokenExpiration = profile.authTicket.accessTokenExpiration;
                [self setHeader:MOZU_X_VOL_USER_CLAIMS value:userClaims.accessToken];
                completion(nil);
            } else if (userClaims.accessToken) {
                DDLogDebug(@"Using old token. %@", userClaims.accessTokenExpiration);
                [self setHeader:MOZU_X_VOL_USER_CLAIMS value:userClaims.accessToken];
                completion(nil);
            } else {
                DDLogWarn(@"Unexpected else. Header not set.");
            }
        }];
    //}
}

- (void)setHeader:(NSString *)header value:(NSString *)value
{
    NSParameterAssert(header);
    NSParameterAssert(value);
    if ([header isEqualToString:MOZU_X_VOL_DATAVIEW_MODE]) {
        value = self.dataViewModeMap[value];
    }
    self.mutableHeaders[header] = value;
}

- (NSDictionary *)headers
{
    return [self.mutableHeaders copy];
}

- (void)setBody:(JSONModel *)body
{
    _body = body;
    self.bodyString = [body toJSONString];
}

- (void)setBodyStream:(NSInputStream *)bodyStream
{
    self.bodyStream = bodyStream;
}

- (void)validateContext:(MOZUAPIContext *)APIContext completionHandler:(void (^)(NSString *host, NSError *error))completion
{
    if (self.resourceURLComponents.location == MOZUTenantPod) {
        NSParameterAssert(APIContext);
        NSParameterAssert(APIContext.tenantId >=0);
        
        if (APIContext.tenantHost.length == 0) {
            id tenantRes = [[MOZUTenantResource alloc] init];
            [tenantRes tenantWithTenantId:APIContext.tenantId responseFields:nil completionHandler:^void(MOZUTenant *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
                if (result) {
                    completion(result.domain, nil);
                } else {
                    DDLogError(@"%@", error.localizedDescription);
                    completion(nil, error);
                }
            }];
        } else {
            completion(APIContext.tenantHost, nil);
        }
    }
    else if (self.resourceURLComponents.location == MOZUPCIPod){
        NSParameterAssert(APIContext);
        NSParameterAssert(APIContext.tenantId >=0);
        completion(PCIUrl, nil);

    }
    else {
        NSString *host = [MOZUAppAuthenticator sharedAppAuthenticator].host;
        if (!host || [host isEqualToString:@""]) {
            NSError *error = [NSError errorWithDomain:MOZUAPIClientErrorDomain code:MOZUClientErrorMissingHost userInfo:@{NSLocalizedDescriptionKey: @"MOZUAppAuthenticator host is missing"}];
            DDLogError(@"%@", error.localizedDescription);
            completion(nil, error);
        } else {
            completion(host, nil);
        }
    }
}

- (void)validateHeaders:(NSMutableDictionary *)headers request:(NSMutableURLRequest *)request completionHandler:(void (^)(NSError *error))completion
{
    // Add MOZU_X_VOL_VERSION
    [self setHeader:MOZU_X_VOL_VERSION value:[MOZUAPIVersion version]];

    // MOZU_X_VOL_CORRELATION
    if (self.context.correlationId && ![self.context.correlationId isEqualToString:@""]) {
        [self setHeader:MOZU_X_VOL_CORRELATION value:self.context.correlationId];
    } else {
        DDLogInfo(@"CorrelationId not set on API Context.");
    }
    
    if (![[headers allKeys] containsObject:MOZU_X_VOL_APP_CLAIMS]) {
        // Add MOZU_X_VOL_APP_CLAIMS to headers
        if (!self.context || !self.context.appAuthTicket || [self.context.appAuthTicket.accessToken isEqualToString:@""]) {
            [[MOZUAppAuthenticator sharedAppAuthenticator] addAuthHeaderToRequest:request completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
                if (error) {
                    DDLogError(@"%@", error.localizedDescription);
                    completion(error);
                } else {
                    completion(nil);
                }
            }];
        } else {
            [self setHeader:MOZU_X_VOL_APP_CLAIMS value:self.context.appAuthTicket.accessToken];
            completion(nil);
        }
    } else {
        completion(nil);
    }
}

- (void)executeWithCompletionHandler:(MOZUClientCompletionBlock)completionHandler {
    
    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateIfNecessaryWithCompletion:^(MOZUAuthTicket *appAuthTicket, MOZUAPIError *error) {
        
        if (error != nil) {
            completionHandler(nil, nil, error);
            return;
        }
        self.context.appAuthTicket = appAuthTicket;
        
        [[MOZUUserAuthenticator sharedUserAuthenticator] authenticateIfNecessaryWithCompletion:^(MOZUUserAuthTicket *userAuthTicket, MOZUAPIError *error) {
            
            if (error != nil) {
                completionHandler(nil, nil, error);
                return;
            }
            self.context.userAuthTicket = userAuthTicket;
            
            [self continueExecutionWithCompletionHandler:completionHandler];
        }];
    }];
}

- (void)continueExecutionWithCompletionHandler:(MOZUClientCompletionBlock)completionHandler
{
    __block NSMutableURLRequest *request = [NSMutableURLRequest new];
    
    // Create dispatch group that waits for three validations before submitting client request.
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    [self validateContext:self.context completionHandler:^(NSString *host, NSError *error) {
        if (error) {
            DDLogError(@"%@", error.localizedDescription);
            dispatch_group_leave(group);
        } else {
            // TODO: Remove next line when useSSL bug is fixed.
            self.resourceURLComponents.useSSL = [MOZUAppAuthenticator sharedAppAuthenticator].useSSL;
            self.resourceURLComponents.host = host;
            request.URL = self.resourceURLComponents.URL;
            [self validateHeaders:self.mutableHeaders request:request completionHandler:^(NSError *error) {
                if (error) {
                    DDLogError(@"%@", error.localizedDescription);
                }
                dispatch_group_leave(group);
            }];
        }
    }];
    
    if (self.context.userAuthTicket) {
        dispatch_group_enter(group);
        [self validateUserClaims:self.context.userAuthTicket completionHandler:^(NSError *error) {
            if (error) {
                DDLogError(@"%@", error.localizedDescription);
            }
            dispatch_group_leave(group);
        }];
    }
    
    // Wait until all dispatch groups leave.
    dispatch_group_wait(group, 30.0);
    
    [self.mutableHeaders addEntriesFromDictionary:request.allHTTPHeaderFields];
    [request setAllHTTPHeaderFields:[self.mutableHeaders copy]];
    [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    [request setHTTPMethod:self.verb];
    
    if (![self.verb isEqualToString:@"GET"]) {
        NSData *body = [self.bodyString dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:body];
    }
    
    NSLog(@"%@", request.URL.description);
    DDLogDebug(@"%@", request.allHTTPHeaderFields);
    NSURLSessionConfiguration *sessionConfiguration = [self sessionConfigurationFromEnum:self.sessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                                    self.statusCode = [httpResponse statusCode];
                                                    self.JSONResult = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                    self.error = [MOZUResponseHelper ensureSuccessOfResponse:httpResponse JSONResult:self.JSONResult error:error];
                                                    if (self.error) {
                                                        
                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                            completionHandler(nil, httpResponse, self.error);
                                                        });
                                                        
                                                    } else {
                                                        
                                                        if (self.JSONParser) {
                                                            self.result = self.JSONResult ? self.JSONParser(self.JSONResult) : nil;
                                                        }
                                                        
                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                            completionHandler(self.result, httpResponse, nil);
                                                        });
                                                    }
                                                }];
    [dataTask resume];
    
}



- (NSURLSessionConfiguration *)sessionConfigurationFromEnum:(MOZUClientSessionConfiguration)configuration
{
    NSURLSessionConfiguration *sessionConfiguration = nil;
    switch (configuration) {
        case MOZUClientBackgroundSessionConfiguration:
            sessionConfiguration = [NSURLSessionConfiguration backgroundSessionConfiguration:self.backgroundSessionIdentifier];
            break;
        case MOZUClientDefaultSessionConfiguration:
            sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
            break;
        case MOZUClientEphemeralSessionConfiguration:
            sessionConfiguration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
            break;
        default:
            break;
    }
    return sessionConfiguration;
}


@end
