//
//  MOZUCacheItem.h
//  MozuApi
//
//  Created by Kevin Wright on 11/19/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MOZUCacheItem : NSObject
@property NSString* id;
@property id item;
@property NSString* eTag;
@property NSDate* createDate;
// @property MOZUApiContext* apiContext;
@end
