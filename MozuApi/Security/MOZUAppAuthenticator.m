//
//  Authentication.m
//  Api
//
//  Created by Sanjay Mandadi on 10/3/13.
//  Copyright (c) 2013 Mozu. All rights reserved.
//

#import "JSONModel.h"

#import "MOZUResponseHelper.h"
#import "MOZUAppAuthenticator.h"
#import "MOZUAppAuthInfo.h"
#import "MOZUAuthTicket.h"
#import "MOZUAuthTicketRequest.h"
#import "MOZURefreshInterval.h"
#import "MOZUHeaders.h"
#import "MOZUAPILogger.h"

@implementation MOZUAppAuthenticator

static MOZUAppAuthInfo* _authInfo = nil;
static NSString* _baseUrl = nil;
static MOZUAuthTicket* _authTicket = nil;
static BOOL _usesSSL = NO;
static MOZURefreshInterval* _refreshInterval = nil;

NSMutableData *_responseData;


+ (void)initializeWithAuthInfo:(MOZUAppAuthInfo*)appAuthInfo
                baseAppAuthURL:(NSString*)baseUrl
                refeshInterval:(MOZURefreshInterval*)refreshInterval
                    completionHandler:(MOZUAppAuthenticationCompletionBlock)completion {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _authInfo = appAuthInfo;
        _baseUrl = baseUrl;
        _refreshInterval = refreshInterval;
        NSURL* url = [NSURL URLWithString:_baseUrl];
        if ([[url scheme] caseInsensitiveCompare:@"https"]) {
            _usesSSL = YES;
        }
        
        [[self class] authenticateAppWithCompletionHandler:^(NSHTTPURLResponse *response, MOZUApiError *error) {
            completion(response, error);
        }];
    });
}

+(void)deleteAuth {
    if (_authTicket != nil) {
        // todo : logout here
    }
}

+ (void)addAuthHeaderToRequest:(NSMutableURLRequest*)request
                    completionHandler:(MOZUAppAuthenticationCompletionBlock)completion {
    [[self class] ensureAuthTicketWithCompletionHandler:^(NSHTTPURLResponse *response, MOZUApiError *error) {
        [request setValue:_authTicket.accessToken forHTTPHeaderField:MOZU_X_VOL_APP_CLAIMS];
        completion(response, error);
    }];
}

+ (void)authenticateAppWithCompletionHandler:(MOZUAppAuthenticationCompletionBlock)completion {
    NSString* resourceUrl = @"/api/platform/applications/authtickets/"; // todo : get this from authTicketUrl.authenticateAppUrl
    NSString* url = [_baseUrl stringByAppendingString:resourceUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    [request setHTTPMethod:@"POST"];
    NSData* body = [[_authInfo toJSONString] dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:body];
    
    //NSLog(@"%@",url);
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
                                                    NSString* json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                    MOZUApiError* apiError = [MOZUResponseHelper ensureSuccessOfResponse:httpResponse JSONResult:json];
                                                    if (apiError) {
                                                        DDLogError(@"%@", apiError);
                                                    }
                                                    
                                                    _authTicket = [[MOZUAuthTicket alloc] initWithString:json error:nil];
                                                    [[self class] setRefreshIntervalsIncludeRefreshTokenExpiration:YES];
                                                    completion(httpResponse, apiError);
                                                }];
    [dataTask resume];
}

+ (void)refreshAppAuthTicketWithCompletionHandler:(MOZUAppAuthenticationCompletionBlock)completion {
    NSString* resourceUrl = @"/api/platform/applications/authtickets/refresh-ticket"; // todo : get this from authTicketUrl.authenticateAppUrl
    NSString* url = [_baseUrl stringByAppendingString:resourceUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    [request setHTTPMethod:@"PUT"];
    MOZUAuthTicketRequest* authTicketRequest = [MOZUAuthTicketRequest new];
    authTicketRequest.refreshToken = _authTicket.refreshToken;
    NSData* body = [[authTicketRequest toJSONString] dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:body];
    
    //NSLog(@"%@",url);
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
                                                    NSString* json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                    MOZUApiError* apiError = [MOZUResponseHelper ensureSuccessOfResponse:httpResponse JSONResult:json];
                                                    if (apiError != nil) {
                                                        [NSException raise:@"refreshAppAuthTicket failed!" format:@"MOZUApiError = %@", apiError];
                                                    }
                                                    
                                                    _authTicket = [[MOZUAuthTicket alloc] initWithString:json error:nil];
                                                    [[self class] setRefreshIntervalsIncludeRefreshTokenExpiration:NO];
                                                    completion(httpResponse, apiError);
                                                }];
    [dataTask resume];
}

+ (void)ensureAuthTicketWithCompletionHandler:(MOZUAppAuthenticationCompletionBlock)completion {
    if (_authTicket == nil || [[NSDate date] compare:_refreshInterval.refreshTokenExpiration] == NSOrderedDescending) {
        [[self class] authenticateAppWithCompletionHandler:^(NSHTTPURLResponse *response, MOZUApiError *error) {
            completion(response, error);
        }];
    }
    else if ([[NSDate date] compare:_refreshInterval.accessTokenExpiration] == NSOrderedDescending) {
        [[self class] refreshAppAuthTicketWithCompletionHandler:^(NSHTTPURLResponse *response, MOZUApiError *error) {
            completion(response, error);
        }];
    }
}

+(MOZUAppAuthInfo*) authInfo {
    return _authInfo;
}

+(NSString*) baseUrl {
    return _baseUrl;
}

+(MOZUAuthTicket*) authTicket {
    return _authTicket;
}

+(BOOL)usesSSL {
    return _usesSSL;
}

+(void)setRefreshIntervalsIncludeRefreshTokenExpiration : (BOOL)isIncluded {
    if (_refreshInterval == nil) {
        long a = ((long)[_authTicket.accessTokenExpiration timeIntervalSinceNow]) - 180;
        long r = ((long)[_authTicket.refreshTokenExpiration timeIntervalSinceNow]) - 180;
        _refreshInterval = [[MOZURefreshInterval alloc] initWithAccessTokenExpirationInterval:a andRefreshTokenTokenExpirationInterval:r];
    }
        
}

@end
