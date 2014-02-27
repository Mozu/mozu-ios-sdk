//
//  Authentication.h
//  Api
//
//  Created by Sanjay Mandadi on 10/3/13.
//  Copyright (c) 2013 Mozu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MOZUApiError;
@class MOZUAppAuthInfo;
@class MOZUAuthTicket;
@class MOZURefreshInterval;

typedef void(^MOZUAppAuthenticationCompletionBlock)(NSHTTPURLResponse* response, MOZUApiError* error);

@interface MOZUAppAuthenticator : NSObject

@property (nonatomic) MOZUAppAuthInfo *appAuthInfo;
@property (nonatomic) NSString *host;
@property (nonatomic) MOZUAuthTicket *authTicket;
@property (nonatomic) BOOL useSSL;
@property (nonatomic, readonly) NSString *scheme;
@property (nonatomic) MOZURefreshInterval *refreshInterval;


+ (MOZUAppAuthenticator *)sharedAppAuthenticator;
    
- (void)authenticateWithAuthInfo:(MOZUAppAuthInfo *)appAuthInfo
                         appHost:(NSString *)host
                          useSSL:(BOOL)useSSL
                  refeshInterval:(MOZURefreshInterval*)refreshInterval
               completionHandler:(MOZUAppAuthenticationCompletionBlock)completion;

- (void)deleteAuth;
- (void)addAuthHeaderToRequest:(NSMutableURLRequest*)request
             completionHandler:(MOZUAppAuthenticationCompletionBlock)completion;

- (void)authenticateAppWithCompletionHandler:(MOZUAppAuthenticationCompletionBlock)completion;
- (void)refreshAppAuthTicketWithCompletionHandler:(MOZUAppAuthenticationCompletionBlock)completion;
- (void)ensureAuthTicketWithCompletionHandler:(MOZUAppAuthenticationCompletionBlock)completion;

@end
