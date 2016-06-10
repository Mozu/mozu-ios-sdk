//
//  MOZUAPIContext+Auth.m
//  Pods
//
//  Created by Rabin Joshi on 6/9/16.
//
//

#import "MOZUAPIContext+Validate.h"

#import "MOZUAPIError.h"

#import "MOZUAuthTicketResource.h"
#import "MOZUAppAuthInfo.h"
#import "MOZUAuthTicket.h"

#import "MOZUTenantAdminUserAuthTicketResource.h"
#import "MOZUUserAuthInfo.h"
#import "MOZUTenantAdminUserAuthTicket.h"


@implementation MOZUAPIContext (Validate)

- (void)validateWithCompletion: (void(^)(MOZUAPIError *error))handler {
    
    [self ensureAppAuthTicketWithCompletionHandler:^(MOZUAPIError *error) {
        
        if (error != nil) {
            handler(error);
            return;
        }
        
        [self ensureTenantAdminUserAuthTicketWithCompletionHandler:^(MOZUAPIError *error) {

            if (error != nil) {
                handler(error);
                return;
            }
            
            handler(nil);
            
        }];
        
    }];
    
}

- (void)ensureAppAuthTicketWithCompletionHandler: (void(^)(MOZUAPIError *error))handler {
    
    // No appAuthTicket or refresh token expiration date is in the past.
    if (!self.appAuthTicket || ([self.appAuthTicket.refreshTokenExpiration timeIntervalSinceNow] < 0)) {
        [self authenticateAppWithCompletionHandler:handler];
        return;
    }
    
    // AppAuthTicket token expiration date is in the past.
    if ([self.appAuthTicket.accessTokenExpiration timeIntervalSinceNow] < 0) {
        [self refreshAppWithCompletionHandler:handler];
        return;
    }
    
    // AppAuthTicket exists & valid
    handler(nil);
}

- (void)authenticateAppWithCompletionHandler: (void(^)(MOZUAPIError *error))handler {
    
    NSAssert(self.appAuthInfo, @"appAuthInfo is nil");
    
    MOZUAuthTicketResource *res = [[MOZUAuthTicketResource alloc] init];
    [res authenticateAppWithBody:self.appAuthInfo
                  responseFields:nil
               completionHandler:^(MOZUAuthTicket *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
                   
                   if (error != nil) {
                       handler(error);
                       return;
                   }
                   
                   self.appAuthTicket = result;
                   handler(nil);
                   
               }];
}

- (void)refreshAppWithCompletionHandler: (void(^)(MOZUAPIError *error))handler {
    
    MOZUAuthTicketResource *res = [[MOZUAuthTicketResource alloc] init];
    [res refreshAppAuthTicketWithBody:self.appAuthTicket
                       responseFields:nil
                    completionHandler:^(MOZUAuthTicket *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
                      
                        if (error != nil) {
                            handler(error);
                            return;
                        }
                        
                        self.appAuthTicket = result;
                        handler(nil);
                        
                    }];
    
}

#pragma mark: - MOZUTenantAdminUser

- (void)ensureTenantAdminUserAuthTicketWithCompletionHandler: (void(^)(MOZUAPIError *error))handler {
    
    // AppAuthTicket token expiration date is in the past.
    if ([self.tenantAdminUserAuthTicket.accessTokenExpiration timeIntervalSinceNow] < 0) {
        [self refreshTenantAdminUserWithCompletionHandler:handler];
        return;
    }
    
    handler(nil);
    
}

- (void)refreshTenantAdminUserWithCompletionHandler: (void(^)(MOZUAPIError *error))handler {
    
    MOZUTenantAdminUserAuthTicketResource *res = [[MOZUTenantAdminUserAuthTicketResource alloc] init];
    [res refreshAuthTicketWithBody:self.tenantAdminUserAuthTicket
                          tenantId:@(self.tenantId)
                    responseFields:nil
                 completionHandler:^(MOZUTenantAdminUserAuthTicket *result, MOZUAPIError *error, NSHTTPURLResponse *response) {
                     
                     if (error != nil) {
                         handler(error);
                         return;
                     }
                     
                     self.tenantAdminUserAuthTicket = result;
                     handler(nil);
                 }];
}


@end
