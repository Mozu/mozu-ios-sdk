//
//  MOZUCustomerAuthenticator.h
//  Pods
//
//  Created by Rabin Joshi on 5/11/16.
//
//

#import <Foundation/Foundation.h>

#import "MOZUCustomerUserAuthInfo.h"
#import "MOZUCustomerAuthTicket.h"
#import "MOZUAPIError.h"

@interface MOZUCustomerAuthenticator : NSObject

@property (nonatomic, copy) NSString *appToken;
@property (nonatomic, copy) NSString *apiVersion;
@property (nonatomic, copy) NSString *tenant;
@property (nonatomic, copy) NSString *site;

@property (nonatomic, copy) NSString *host;


+ (MOZUCustomerAuthenticator *)sharedCustomerAuthenticator;

- (void)refreshCustomerAuthTicket:(MOZUCustomerAuthTicket *)customerAuthTicket
                completionHandler:(void(^)(MOZUCustomerAuthTicket *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler;

- (void)createCustomerAuthTicketWithCustomerUserAuthInfo:(MOZUCustomerUserAuthInfo *)customerUserAuthInfo
                                       completionHandler:(void(^)(MOZUCustomerAuthTicket *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler;
@end
