//
//  MOZUUserAuthenticator.m
//  MozuApi
//
//  Created by Kevin Wright on 11/21/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import "MOZUUserAuthenticator.h"
#import "MOZUAppAuthenticator.h"
#import "MOZUApiError.h"
#import "MOZUResponseHelper.h"

@implementation MOZUUserAuthenticator

+(MOZUAuthenticationProfile*)setActiveScopeWithUserAuthTicket:(MOZUUserAuthTicket*)userAuthTicket scope:(MOZUScope*)scope {
    return [[self class] refreshWithUserAuthTicket:userAuthTicket andId:@(scope.id)];
}

+(MOZUAuthenticationProfile*)ensureUserAuthTicket:(MOZUUserAuthTicket*)userAuthTicket {
    NSDate* refreshTime = [NSDate dateWithTimeInterval:-180 sinceDate:userAuthTicket.accessTokenExpiration];
    if ([[NSDate date] compare:refreshTime] == NSOrderedDescending) {
        return [[self class] refreshWithUserAuthTicket:userAuthTicket andId:nil];
    }
    
    return nil;
}

+(MOZUAuthenticationProfile*)refreshWithUserAuthTicket:(MOZUUserAuthTicket*)userAuthTicket id:(NSNumber*)id {
    __block MOZUAuthenticationProfile* authProfile = nil;
    NSString* resourceUrl = [[self class] getResourceRefreshUrlWithAuthTicket:userAuthTicket andId:id];
    NSString* url = [[MOZUAppAuthenticator baseUrl] stringByAppendingString:resourceUrl];
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
                                                    MOZUApiError* apiError = [MOZUResponseHelper ensureSuccessOfResponse:httpResponse JSONResult:json];
                                                    if (apiError != nil) {
                                                        [NSException raise:@"refreshAppAuthTicket failed!" format:@"MOZUApiError = %@", apiError];
                                                    }
                                                    
                                                    authProfile = [[self class] setUserAuthWithJsonData:json andUserScope:userAuthTicket.scope];
                                                }];
    [dataTask resume];
    return authProfile;
}

+(MOZUAuthenticationProfile*)authenticateWithUserAuthInfo:(MozuUserAuthInfo*)userAuthInfo scope:(MOZUUserScope)scope id:(NSNumber*)id {
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

+(MOZUAuthenticationProfile*)setUserAuthWithJsonData:(NSString*)jsonData andUserScope:(MOZUUserScope)scope {
    return nil; // todo : implement this
}

+(NSString*)getResourceRefreshUrlWithAuthTicket:(MOZUUserAuthTicket*)authTicket andId:(NSNumber*)id {
    return nil; // todo : implement this
}

+(NSString*)getResourceUrlWithUserScope:(MOZUUserScope)scope andId:(NSNumber*)id {
    return nil; // todo : implement this
}

+(NSString*)getLogoutUrlWithAuthTicket:(MOZUUserAuthTicket*)userAuthTicket {
    return nil; // todo : implement this
}


@end
