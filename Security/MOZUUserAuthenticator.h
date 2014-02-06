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

@protocol MOZUScope
@end

@interface MOZUScope : NSObject<MOZUScope>
@property int id;
@property NSString* name;
@end

typedef NS_ENUM(NSUInteger, MOZUUserScope) {
    kTenant,
    kShopper,
    kDeveloper
};

@interface MOZUAuthenticationProfile : NSObject
@property MOZUAuthTicket* authTicket;
@property NSArray<MOZUScope>* authorizedScopes;
@property MOZUScope* activeScope;
@property MOZUUserProfile* userProfile;
//@property MOZUCustomerAccount* shopperAccount;
@end

@interface MOZUUserAuthTicket : MOZUAuthTicket
@property MOZUUserScope scope;
@end


@interface MOZUUserAuthenticator : NSObject
+(MOZUAuthenticationProfile*)setActiveScopeWithUserAuthTicket:(MOZUUserAuthTicket*)userAuthTicket andScope:(MOZUScope*)scope;
+(MOZUAuthenticationProfile*)ensureUserAuthTicket:(MOZUUserAuthTicket*)userAuthTicket;
+(MOZUAuthenticationProfile*)refreshWithUserAuthTicket:(MOZUUserAuthTicket*)userAuthTicket andId:(NSNumber*)id;
+(MOZUAuthenticationProfile*)authenticateWithUserAuthInfo:(MozuUserAuthInfo*)userAuthInfo andScope:(MOZUUserScope)scope andId:(NSNumber*)id;
+(void)logoutWithUserAuthTicket:(MOZUUserAuthTicket*)userAuthTicket;


@end
