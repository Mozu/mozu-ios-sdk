//
//  Authentication.h
//  Api
//
//  Created by Sanjay Mandadi on 10/3/13.
//  Copyright (c) 2013 Mozu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MOZUAppAuthInfo;
@class MOZUAuthTicket;
@class MOZURefreshInterval;

@interface MOZUAppAuthenticator : NSObject
    
+(void)initializeWithAuthInfo:(MOZUAppAuthInfo*)appAuthInfo andBaseAppAuthUrl:(NSString*)baseUrl andRefeshInterval:(MOZURefreshInterval*)refreshInterval;
+(void)deleteAuth;
+(void)addAuthHeaderToRequest:(NSMutableURLRequest*)request;

+(void)authenticateApp;
+(void)refreshAppAuthTicket;
+(void)ensureAuthTicket;

+(MOZUAppAuthInfo*)authInfo;
+(NSString*)baseUrl;
+(MOZUAuthTicket*)authTicket;
+(BOOL)usesSSL;


@end
