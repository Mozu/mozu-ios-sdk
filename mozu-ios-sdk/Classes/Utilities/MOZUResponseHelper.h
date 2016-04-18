//
//  MOZUResponseHelper.h
//  MozuApi
//
//  Created by Kevin Wright on 11/22/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOZUAPIError.h"

@interface MOZUResponseHelper : NSObject
+ (MOZUAPIError *)ensureSuccessOfResponse:(NSHTTPURLResponse *)response JSONResult:(NSString *)JSON error:(NSError *)error;
@end
