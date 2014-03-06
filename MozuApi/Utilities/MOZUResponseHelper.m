//
//  MOZUResponseHelper.m
//  MozuApi
//
//  Created by Kevin Wright on 11/22/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import "MOZUResponseHelper.h"
#import "MOZUAPILogger.h"

@implementation MOZUResponseHelper

static NSString * const MOZUInvalidResponseException = @"MOZUInvalidResponseException";

+ (MOZUAPIError *)ensureSuccessOfResponse:(NSHTTPURLResponse *)response JSONResult:(NSString *)JSON error:(NSError *)error; {
    if (response) {
        if (response.statusCode < 200 || response.statusCode > 299) {
            MOZUAPIError *apiError = [[MOZUAPIError alloc] initWithString:JSON statusCode:response.statusCode];
            DDLogError(@"%@", error);
            return apiError;
        } else {
            return nil;
        }
    } else if (error) {
        DDLogError(@"%@", error.localizedDescription);
        return (MOZUAPIError *)error;
    } else {
        DDLogError(@"%@", MOZUInvalidResponseException);
        [NSException raise:MOZUInvalidResponseException format:@"Response and error are nil."];
        return nil;
    }
}

@end
