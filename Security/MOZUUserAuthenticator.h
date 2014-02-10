//
//  MOZUUserAuthenticator.h
//  MozuApi
//
//  Created by Kevin Wright on 11/21/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOZUAuthTicket.h"

@class MozuUserAuthInfo;
@class MOZUUserProfile;

@interface MOZUScope : NSObject

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, strong) NSString* name;

@end

typedef NS_ENUM(NSUInteger, MOZUUserScope) {
    kTenant,
    kShopper,
    kDeveloper
};

@interface MOZUAuthenticationProfile : NSObject

@property (nonatomic, strong) MOZUAuthTicket* authTicket;
@property (nonatomic, strong) NSArray* authorizedScopes;
@property (nonatomic, strong) MOZUScope* activeScope;
@property (nonatomic, strong) MOZUUserProfile* userProfile;

@end

@interface MOZUUserAuthTicket : MOZUAuthTicket

@property (nonatomic, assign) MOZUUserScope scope;

@end


@interface MOZUUserAuthenticator : NSObject
+(MOZUAuthenticationProfile*)setActiveScopeWithUserAuthTicket:(MOZUUserAuthTicket*)userAuthTicket scope:(MOZUScope*)scope;
+(MOZUAuthenticationProfile*)ensureUserAuthTicket:(MOZUUserAuthTicket*)userAuthTicket;
+(MOZUAuthenticationProfile*)refreshWithUserAuthTicket:(MOZUUserAuthTicket*)userAuthTicket id:(NSNumber*)id;
+(MOZUAuthenticationProfile*)authenticateWithUserAuthInfo:(MozuUserAuthInfo*)userAuthInfo scope:(MOZUUserScope)scope id:(NSNumber*)id;
+(void)logoutWithUserAuthTicket:(MOZUUserAuthTicket*)userAuthTicket;


@end
