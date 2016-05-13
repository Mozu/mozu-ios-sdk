//
//  Authentication.m
//  Api
//
//  Created by Sanjay Mandadi on 10/3/13.
//  Copyright (c) 2013 Mozu. All rights reserved.
//

#import "JSONModel.h"

#import "MOZUAPIError.h"
#import "MOZUResponseHelper.h"
#import "MOZUAppAuthenticator.h"
#import "MOZUAppAuthInfo.h"
#import "MOZUAuthTicket.h"
#import "MOZUAuthTicketRequest.h"
#import "MOZURefreshInterval.h"
#import "MOZUHeaders.h"
#import "MOZUAPILogger.h"

@interface MOZUAppAuthenticator ()

@end

static NSString * const MOZUClientBackgroundSessionIdentifier = @"MOZUClientBackgroundSessionIdentifier";

@implementation MOZUAppAuthenticator

@dynamic host, useSSL;

+ (MOZUAppAuthenticator *)sharedAppAuthenticator
{
    static MOZUAppAuthenticator *_sharedAppAuthenticator = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        _sharedAppAuthenticator = [[self alloc] init];
    });
    
    return _sharedAppAuthenticator;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _backgroundSessionIdentifier = MOZUClientBackgroundSessionIdentifier;
        _sessionConfiguration = MOZUAppAuthenticatorDefaultSessionConfiguration;
        self.useSSL = YES;
        self.host = @"home.mozu.com";
    }
    return self;
}

- (void)authenticateWithAuthInfo:(MOZUAppAuthInfo *)appAuthInfo
                  refeshInterval:(MOZURefreshInterval *)refreshInterval
               completionHandler:(MOZUAppAuthenticationCompletionBlock)completion
{
    NSParameterAssert(appAuthInfo);
    NSParameterAssert(appAuthInfo.applicationId && appAuthInfo.sharedSecret);
    _appAuthInfo = appAuthInfo;
    _URLComponents = [NSURLComponents new];
    _URLComponents.host = @"home.staging.mozu.com"; //@"home.mozu.com"; //self.host;
    _URLComponents.scheme = @"https"; //self.useSSL ? @"https" : @"http”;
    _refreshInterval = refreshInterval;
    [self authenticateAppWithCompletionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
        completion(response, error);
    }];
}

- (void)setHost:(NSString *)host
{
    if (!self.URLComponents) {
        self.URLComponents = [NSURLComponents new];
    }
    self.URLComponents.host = self.host;
}

- (NSString *)host
{
    return self.URLComponents.host;
}

- (void)setUseSSL:(BOOL)useSSL
{
    if (!self.URLComponents) {
        self.URLComponents = [NSURLComponents new];
    }
    self.URLComponents.scheme = self.useSSL ? @"https" : @"http";
}

- (BOOL)useSSL
{
    return [self.URLComponents.scheme isEqualToString:@"https"] ? YES : NO;
}

- (NSString *)scheme
{
    return self.URLComponents.scheme;
}

- (void)addAuthHeaderToRequest:(NSMutableURLRequest *)request
             completionHandler:(MOZUAppAuthenticationCompletionBlock)completion {
    [self ensureAuthTicketWithCompletionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
        [request setValue:self.authTicket.accessToken forHTTPHeaderField:MOZU_X_VOL_APP_CLAIMS];
        completion(response, error);
    }];
}

- (void)authenticateAppWithCompletionHandler:(MOZUAppAuthenticationCompletionBlock)completion
{
    NSURLComponents *components = [NSURLComponents new];
    components.scheme = self.URLComponents.scheme;
    components.host = self.URLComponents.host;
    components.path = @"/api/platform/applications/authtickets/"; // todo : get this from authTicketUrl.authenticateAppUrl
   
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:components.URL];
    [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    [request setHTTPMethod:@"POST"];
    NSData *body = [[self.appAuthInfo toJSONString] dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:body];
    
    NSURLSessionConfiguration *sessionConfiguration = [self sessionConfigurationFromEnum:self.sessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                                    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                    MOZUAPIError *apiError = [MOZUResponseHelper ensureSuccessOfResponse:httpResponse JSONResult:json error:error];
                                                    if (!apiError) {
                                                        self.authTicket = [[MOZUAuthTicket alloc] initWithString:json error:nil];
                                                        [self refreshIntervalsIncludingRefreshTokenExpiration:YES];
                                                    }
                                                    completion(httpResponse, apiError);
                                                }];
    [dataTask resume];
}

- (void)refreshAppAuthTicketWithCompletionHandler:(MOZUAppAuthenticationCompletionBlock)completion {
    NSURLComponents *components = [NSURLComponents new];
    components.scheme = self.URLComponents.scheme;
    components.host = self.URLComponents.host;
    components.path = @"/api/platform/applications/authtickets/refresh-ticket"; // todo : get this from authTicketUrl.authenticateAppUrl

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:components.URL];
    [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    [request setHTTPMethod:@"PUT"];
    MOZUAuthTicketRequest *authTicketRequest = [MOZUAuthTicketRequest new];
    authTicketRequest.refreshToken = self.authTicket.refreshToken;
    NSData *body = [[authTicketRequest toJSONString] dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:body];
    
    //NSLog(@"%@",url);
    NSURLSessionConfiguration *sessionConfiguration = [self sessionConfigurationFromEnum:self.sessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                                    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                    MOZUAPIError *apiError = [MOZUResponseHelper ensureSuccessOfResponse:httpResponse JSONResult:json error:error];
                                                    if (!apiError) {
                                                        self.authTicket = [[MOZUAuthTicket alloc] initWithString:json error:nil];
                                                        [self refreshIntervalsIncludingRefreshTokenExpiration:NO];
                                                    }
                                                    completion(httpResponse, apiError);
                                                }];
    [dataTask resume];
}

- (void)ensureAuthTicketWithCompletionHandler:(MOZUAppAuthenticationCompletionBlock)completion {
    if (!self.authTicket || [self.refreshInterval.refreshTokenExpirationDate timeIntervalSinceNow] < 0) {
        // No authTicket or refresh token expiration date is in the past.
        [self authenticateAppWithCompletionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
            completion(response, error);
        }];
    } else if ([self.refreshInterval.accessTokenExpirationDate timeIntervalSinceNow] < 0) {
        // Access token expiration date is in the past.
        [self refreshAppAuthTicketWithCompletionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
            completion(response, error);
        }];
    } else {
        completion(nil, nil);
    }
}

- (void)refreshIntervalsIncludingRefreshTokenExpiration: (BOOL)isIncluded {
    if (!self.refreshInterval) {
        DDLogInfo(@"Access token expiration: %@", self.authTicket.accessTokenExpiration);
        DDLogInfo(@"Refresh token expiration: %@", self.authTicket.refreshTokenExpiration);
        
        NSTimeInterval accessTokenInterval = [self.authTicket.accessTokenExpiration timeIntervalSinceNow] - 180;
        NSTimeInterval refreshTokenInterval = [self.authTicket.refreshTokenExpiration timeIntervalSinceNow] - 180;
        
        self.refreshInterval = [[MOZURefreshInterval alloc] initWithAccessTokenExpirationInterval:accessTokenInterval refreshTokenTokenExpirationInterval:refreshTokenInterval];
    }
    [self.refreshInterval updateTokenExpirationDatesIncludingRefreshToken:isIncluded];
}

- (NSURLSessionConfiguration *)sessionConfigurationFromEnum:(MOZUAppAuthenticatorSessionConfiguration)configuration
{
    NSURLSessionConfiguration *sessionConfiguration = nil;
    switch (configuration) {
        case MOZUAppAuthenticatorBackgroundSessionConfiguration:
            sessionConfiguration = [NSURLSessionConfiguration backgroundSessionConfiguration:self.backgroundSessionIdentifier];
            break;
        case MOZUAppAuthenticatorDefaultSessionConfiguration:
            sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
            break;
        case MOZUAppAuthenticatorEphemeralSessionConfiguration:
            sessionConfiguration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
            break;
        default:
            break;
    }
    return sessionConfiguration;
}

- (void)ensureAppAuthTicketWithCompletion:(void(^)(MOZUAuthTicket *result, MOZUAPIError *error))completion {
    
    [self ensureAuthTicketWithCompletionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error) {
        
        if (error != nil) {
            completion(nil, error);
            return;
        }
        
        MOZUAuthTicket *appAuthTicket = self.authTicket;
        completion(appAuthTicket, nil);
        
    }];
    
}

@end
