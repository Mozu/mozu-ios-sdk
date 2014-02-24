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

@interface MOZUAppAuthenticator : NSObject
    
+ (void)initializeWithAuthInfo:(MOZUAppAuthInfo*)appAuthInfo
                baseAppAuthUrl:(NSString*)baseUrl
                refeshInterval:(MOZURefreshInterval*)refreshInterval
                    completion:(void (^)(NSURLResponse *response, MOZUApiError *error))completion;
+(void)deleteAuth;
+ (void)addAuthHeaderToRequest:(NSMutableURLRequest*)request
                    completion:(void (^)(NSURLResponse *response, MOZUApiError *error))completion;

+ (void)authenticateAppWithCompletion:(void (^)(NSURLResponse *response, MOZUApiError *error))completion;
+ (void)refreshAppAuthTicketWithCompletion:(void (^)(NSURLResponse *response, MOZUApiError *error))completion;
+ (void)ensureAuthTicketWithCompletion:(void (^)(NSURLResponse *response, MOZUApiError *error))completion;

+(MOZUAppAuthInfo*)authInfo;
+(NSString*)baseUrl;
+(MOZUAuthTicket*)authTicket;
+(BOOL)usesSSL;


@end
