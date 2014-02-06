//
//  MOZUResponseHelper.h
//  MozuApi
//
//  Created by Kevin Wright on 11/22/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOZUApiError.h"

@interface MOZUResponseHelper : NSObject
+(MOZUApiError*)ensureSuccessOfResponse:(NSHTTPURLResponse*)response andJsonResult:(NSString*)json;
@end
