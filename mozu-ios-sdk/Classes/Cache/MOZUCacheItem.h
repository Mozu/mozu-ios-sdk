//
//  MOZUCacheItem.h
//  MozuApi
//
//  Created by Kevin Wright on 11/19/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MOZUCacheItem : NSObject

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) id item;
@property (nonatomic, strong) NSString *eTag;
@property (nonatomic, strong) NSDate *createDate;

@end
