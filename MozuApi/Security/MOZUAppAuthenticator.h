//
//  Authentication.h
//  Api
//
//  Created by Sanjay Mandadi on 10/3/13.
//  Copyright (c) 2013 Mozu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOZUApiError.h"

@class MOZUAppAuthInfo;
@class MOZUAuthTicket;
@class MOZURefreshInterval;

typedef void(^MOZUAppAuthenticationCompletionBlock)(NSHTTPURLResponse* response, MOZUApiError* error);

@interface MOZUAppAuthenticator : NSObject
    
+ (void)initializeWithAuthInfo:(MOZUAppAuthInfo*)appAuthInfo
                baseAppAuthURL:(NSString*)baseUrl
                refeshInterval:(MOZURefreshInterval*)refreshInterval
             completionHandler:(MOZUAppAuthenticationCompletionBlock)completion;
+ (void)deleteAuth;
+ (void)addAuthHeaderToRequest:(NSMutableURLRequest*)request
             completionHandler:(MOZUAppAuthenticationCompletionBlock)completion;

+ (void)authenticateAppWithCompletionHandler:(MOZUAppAuthenticationCompletionBlock)completion;
+ (void)refreshAppAuthTicketWithCompletionHandler:(MOZUAppAuthenticationCompletionBlock)completion;
+ (void)ensureAuthTicketWithCompletionHandler:(MOZUAppAuthenticationCompletionBlock)completion;

+ (MOZUAppAuthInfo*)authInfo;
+ (NSString*)baseUrl;
+ (MOZUAuthTicket*)authTicket;
+ (BOOL)usesSSL;


@end
