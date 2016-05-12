//
//  MOZUAuthenticatonManager.m
//  Pods
//
//  Created by Rabin Joshi on 5/12/16.
//
//

#import "MOZUAuthenticatonManager.h"

#import "MOZUAPIVersion.h"
#import "MOZUAppAuthenticator.h"
#import "MOZUAuthTicket.h"
#import "MOZUCustomerAuthenticator.h"

@interface MOZUAuthenticatonManager()
@property (nonatomic, strong) MOZUCustomerAuthTicket *customerAuthTicket;
@end


@implementation MOZUAuthenticatonManager

+ (MOZUAuthenticatonManager *)sharedManager {
    static MOZUAuthenticatonManager *_sharedManager = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
    });
    
    return _sharedManager;
}

- (void)ensureCustomerAuthTicketWithCompletionHandler:(void(^)(MOZUCustomerAuthTicket *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler {
    
    // handle if customerAuthTicket is nil
    if (self.customerAuthTicket == nil) {
        return;
    }
    
    // handle if refreshToken expired
    if ([self isRefreshTokenExpired]) {
        return;
    }
    
    // handle if accessToken expired
    if ([self isAccessTokenExpired]) {
        
        MOZUCustomerAuthenticator *authenticator = [[MOZUCustomerAuthenticator alloc] init];
        authenticator.apiVersion = [MOZUAPIVersion version];
        authenticator.appToken = [MOZUAppAuthenticator sharedAppAuthenticator].authTicket.accessToken;
        authenticator.host =  self.host;
        authenticator.tenant = self.tenant;
        authenticator.site = self.site;
        
        [authenticator refreshCustomerAuthTicket:self.customerAuthTicket
                               completionHandler:^(MOZUCustomerAuthTicket *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
                                   
                                   if (error == nil) {
                                       self.customerAuthTicket = result;
                                   }
                                   handler(result, error, response);
                               }];
    }
    
    // handle if accessToken not expired
    handler(self.customerAuthTicket, nil, nil);
}

- (BOOL)isAccessTokenExpired {
    return YES;
//    NSDate *expiryTime = [NSDate dateWithTimeInterval:-180 sinceDate:self.customerAuthTicket.accessTokenExpiration];
//    return ([expiryTime timeIntervalSinceNow] > 0);
}

- (BOOL)isRefreshTokenExpired {
    return NO;
//    NSDate *refreshTime = [NSDate dateWithTimeInterval:(-24*12*60) sinceDate:self.customerAuthTicket.refreshTokenExpiration];
//    return ([refreshTime timeIntervalSinceNow] > 0);
}

@end


