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

@class MozuUserAuthInfo;
@class MOZUUserProfile;

@interface MOZUScope : NSObject

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, strong) NSString* name;

@end

typedef NS_ENUM(NSUInteger, MOZUAuthenticationScope) {
    MOZUTenantAuthenticationScope,
    MOZUShopperAuthenticationScope,
    MOZUDeveloperAuthenticationScope
};

@interface MOZUAuthenticationProfile : NSObject

@property (nonatomic, strong) MOZUAuthTicket* authTicket;
@property (nonatomic, strong) NSArray* authorizedScopes;
@property (nonatomic, strong) MOZUScope* activeScope;
@property (nonatomic, strong) MOZUUserProfile* userProfile;

@end

typedef void(^MOZUUserAuthenticationCompletionBlock)(MOZUAuthenticationProfile *profile, NSHTTPURLResponse* response, MOZUAPIError* error);

@interface MOZUUserAuthTicket : MOZUAuthTicket

@property (nonatomic, assign) MOZUAuthenticationScope scope;

@end


@interface MOZUUserAuthenticator : NSObject
+ (void)setActiveScopeWithUserAuthTicket:(MOZUUserAuthTicket*)userAuthTicket scope:(MOZUScope*)scope completionHandler:(MOZUUserAuthenticationCompletionBlock)completion;
+ (void)ensureUserAuthTicket:(MOZUUserAuthTicket*)userAuthTicket completionHandler:(MOZUUserAuthenticationCompletionBlock)completion;
+ (void)refreshWithUserAuthTicket:(MOZUUserAuthTicket*)userAuthTicket
                                                     id:(NSNumber*)identifier
                                             completionHandler:(MOZUUserAuthenticationCompletionBlock)completion;
+(MOZUAuthenticationProfile*)authenticateWithUserAuthInfo:(MozuUserAuthInfo*)userAuthInfo
                                                    scope:(MOZUAuthenticationScope)scope
                                                       id:(NSNumber*)id;
+(void)logoutWithUserAuthTicket:(MOZUUserAuthTicket*)userAuthTicket;


@end
