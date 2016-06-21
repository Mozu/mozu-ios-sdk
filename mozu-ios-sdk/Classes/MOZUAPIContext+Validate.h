//
//  MOZUAPIContext+Auth.h
//  Pods
//
//  Created by Rabin Joshi on 6/9/16.
//
//

#import "MOZUAPIContext.h"
#import "MOZUApiError.h"

@interface MOZUAPIContext (Validate)

/**
 The context is the single source of truth for the authentication state.
 
 A side-effect of calling the validateWithCompletion: method is that it might 
 refresh and update any auth ticket that might have expired.
 */


- (void)validateWithCompletion: (void(^)(MOZUAPIError *error))handler;
- (void)ensureAppAuthTicketWithCompletionHandler: (void(^)(MOZUAPIError *error))handler;

@end
