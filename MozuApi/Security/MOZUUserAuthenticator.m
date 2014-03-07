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

static NSString * const MOZUClientBackgroundSessionIdentifier = @"MOZUClientBackgroundSessionIdentifier";

@implementation MOZUUserAuthenticator

+ (void)setActiveScopeWithUserAuthTicket:(MOZUUserAuthTicket*)userAuthTicket scope:(MOZUScope*)scope completionHandler:(MOZUUserAuthenticationCompletionBlock)completion {
    return [MOZUUserAuthenticator refreshWithUserAuthTicket:userAuthTicket id:@(scope.id) completionHandler:^(MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error) {
        completion(profile, response, error);
    }];
}

+ (void)ensureUserAuthTicket:(MOZUUserAuthTicket*)userAuthTicket completionHandler:(MOZUUserAuthenticationCompletionBlock)completion {
    NSDate* refreshTime = [NSDate dateWithTimeInterval:-180 sinceDate:userAuthTicket.accessTokenExpiration];
    if ([[NSDate date] compare:refreshTime] == NSOrderedDescending) {
        return [MOZUUserAuthenticator refreshWithUserAuthTicket:userAuthTicket id:nil completionHandler:^(MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error) {
            completion(profile, response, error);
        }];
    }
}

+ (void)refreshWithUserAuthTicket:(MOZUUserAuthTicket*)userAuthTicket id:(NSNumber*)identifier completionHandler:(MOZUUserAuthenticationCompletionBlock)completion {
    __block MOZUAuthenticationProfile* authProfile = nil;
    NSString* resourceUrl = [[self class] getResourceRefreshUrlWithAuthTicket:userAuthTicket andId:identifier];
    NSString* url =  [NSString stringWithFormat:@"%@://%@%@", [MOZUAppAuthenticator sharedAppAuthenticator].scheme, [MOZUAppAuthenticator sharedAppAuthenticator].host, resourceUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    [request setHTTPMethod:@"PUT"];
    NSData* body = [[userAuthTicket toJSONString] dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:body];
    
    //NSLog(@"%@",url);
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
                                                    NSString* json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                    MOZUAPIError* apiError = [MOZUResponseHelper ensureSuccessOfResponse:httpResponse JSONResult:json error:error];
                                                    
                                                    authProfile = [[self class] setUserAuthWithJsonData:json andUserScope:userAuthTicket.scope];
                                                    completion(authProfile, httpResponse, apiError);
                                                }];
    [dataTask resume];
}

+(MOZUAuthenticationProfile*)authenticateWithUserAuthInfo:(MozuUserAuthInfo*)userAuthInfo scope:(MOZUAuthenticationScope)scope id:(NSNumber*)id {
/*
    __block MOZUAuthenticationProfile* authProfile = nil;
    NSString* resourceUrl = [[self class] getResourceUrlWithUserScope:scope andId:id];
    NSString* url = [[MOZUAppAuthenticator baseUrl] stringByAppendingString:resourceUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    [request setHTTPMethod:@"POST"];
    NSData* body = [[userAuthInfo toJSONString] dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:body];
    
    //NSLog(@"%@",url);
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
                                                    NSString* json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                    MOZUApiError* apiError = [MOZUResponseHelper ensureSuccessOfResponse:httpResponse andJsonResult:json];
                                                    if (apiError != nil) {
                                                        [NSException raise:@"authenticateApp failed!" format:@"MOZUApiError = %@", apiError];
                                                    }
                                                    
                                                    authProfile = [[self class] setUserAuthWithJsonData:json andUserScope:scope];
                                                }];
    [dataTask resume];
    return authProfile;
*/
    return nil; // todo : implement this
}

+(void)logoutWithUserAuthTicket:(MOZUUserAuthTicket*)userAuthTicket {
    // todo : implement this

}

+(MOZUAuthenticationProfile*)setUserAuthWithJsonData:(NSString*)jsonData andUserScope:(MOZUAuthenticationScope)scope {
    return nil; // todo : implement this
}

+(NSString*)getResourceRefreshUrlWithAuthTicket:(MOZUUserAuthTicket*)authTicket andId:(NSNumber*)identifier {
    return nil; // todo : implement this
}

+(NSString*)getResourceUrlWithUserScope:(MOZUAuthenticationScope)scope andId:(NSNumber*)identifier {
    return nil; // todo : implement this
}

+(NSString*)getLogoutUrlWithAuthTicket:(MOZUUserAuthTicket*)userAuthTicket {
    return nil; // todo : implement this
}


@end
