//
//  MOZUCacheManager.m
//  MozuApi
//
//  Created by Kevin Wright on 11/19/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import "MOZUCacheManager.h"

static NSCache *cache = nil;

@implementation MOZUCacheManager

+(void)initialize {
    
    cache = [NSCache new];
}

+(void)setCache:(id)obj forKey:(NSString *)key {
    
    [cache setObject:obj forKey:key];
    
}

+(id)getCacheForKey:(NSString *)key {
    
    return [cache objectForKey:key];
    
}

@end
