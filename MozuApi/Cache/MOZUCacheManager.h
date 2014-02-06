//
//  MOZUCacheManager.h
//  MozuApi
//
//  Created by Kevin Wright on 11/19/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MOZUCacheManager : NSObject

+(void)setCache:(id)obj forKey:(NSString *)key;
+(id)getCacheForKey:(NSString *)key;

@end
