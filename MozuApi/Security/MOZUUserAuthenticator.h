//
//  MOZUUserAuthenticator.h
//  MozuApi
//
//  Created by Kevin Wright on 11/21/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOZUAuthTicket.h"
#import "MOZUAPIError.h"

@class MOZUUserAuthInfo;
@class MOZUUserProfile;
@class MOZUAuthenticationProfile;
@class MOZUCustomerAccount;

typedef void(^MOZUUserAuthenticationCompletionBlock)(MOZUAuthenticationProfile *profile, NSHTTPURLResponse* response, MOZUAPIError* error);

typedef NS_ENUM(NSUInteger, MOZUAuthenticationScope) {
    MOZUTenantAuthenticationScope,
    MOZUCustomerAuthenticationScope,
    MOZUDeveloperAuthenticationScope
};

typedef NS_ENUM(NSUInteger, MOZUUserAuthenticatorSessionConfiguration)
{
    MOZUUserAuthenticatorBackgroundSessionConfiguration,
    MOZUUserAuthenticatorDefaultSessionConfiguration,
    MOZUUserAuthenticatorEphemeralSessionConfiguration
};


@interface MOZUScope : NSObject

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, strong) NSString * name;

@end

@interface MOZUUserAuthTicket : MOZUAuthTicket

@property (nonatomic, assign) MOZUAuthenticationScope scope;
@property (nonatomic, strong) NSNumber * siteId;
@property (nonatomic, strong) NSNumber * tenentId;

@end

@interface MOZUAuthenticationProfile : NSObject

@property (nonatomic, strong) MOZUUserAuthTicket * authTicket;
@property (nonatomic, strong) NSArray * authorizedScopes; // MOZUScope objects
@property (nonatomic, strong) MOZUScope * activeScope;
@property (nonatomic, strong) MOZUUserProfile * userProfile;
@property (nonatomic, strong) MOZUCustomerAccount * shopperAccount;

@end

@interface MOZUUserAuthenticator : NSObject

@property (nonatomic, assign) MOZUUserAuthenticatorSessionConfiguration sessionConfiguration; // Default is MOZUUserAuthenticatorDefaultSessionConfiguration
@property (nonatomic, strong) NSString *backgroundSessionIdentifier; // Default is MOZUUserAuthenticatorBackgroundSessionIdentifier

+ (MOZUUserAuthenticator *)sharedUserAuthenticator;

- (void)setActiveScopeWithUserAuthTicket:(MOZUUserAuthTicket *)userAuthTicket
                                   scope:(MOZUScope *)scope
                       completionHandler:(MOZUUserAuthenticationCompletionBlock)completion;
- (void)ensureUserAuthTicket:(MOZUUserAuthTicket *)userAuthTicket
           completionHandler:(MOZUUserAuthenticationCompletionBlock)completion;
- (void)refreshWithUserAuthTicket:(MOZUUserAuthTicket *)userAuthTicket
                               id:(NSNumber *)identifier
                completionHandler:(MOZUUserAuthenticationCompletionBlock)completion;
- (void)authenticateWithUserAuthInfo:(MOZUUserAuthInfo *)userAuthInfo
                               scope:(MOZUAuthenticationScope)scope
                                  id:(NSNumber *)identifier
                   completionHandler:(MOZUUserAuthenticationCompletionBlock)completion;
- (void)logoutWithUserAuthTicket:(MOZUUserAuthTicket *)userAuthTicket
               completionHandler:(void (^)(NSHTTPURLResponse *response, MOZUAPIError *error))completion;


@end
