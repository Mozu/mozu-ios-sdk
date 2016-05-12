//
//  MOZUAuthenticatonManager.h
//  Pods
//
//  Created by Rabin Joshi on 5/12/16.
//
//

#import <Foundation/Foundation.h>

#import "MOZUCustomerAuthTicket.h"
#import "MOZUCustomerUserAuthInfo.h"
#import "MOZUAPIError.h"

@interface MOZUAuthenticatonManager : NSObject

@property (nonatomic, copy) NSString *appToken;
@property (nonatomic, copy) NSString *apiVersion;
@property (nonatomic, copy) NSString *tenant;
@property (nonatomic, copy) NSString *site;

@property (nonatomic, copy) NSString *host;

+ (MOZUAuthenticatonManager *)sharedManager;

- (void)ensureCustomerAuthTicketWithCompletionHandler:(void(^)(MOZUCustomerAuthTicket *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler;

@end

#pragma mark - Helper Categories

//@interface MOZUCustomerAuthTicket (Expiry)
//- (BOOL)isAccessTokenExpired;
//@end