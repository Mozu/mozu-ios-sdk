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

- (void)validateWithCompletion: (void(^)(MOZUAPIError *error))handler;

@end
