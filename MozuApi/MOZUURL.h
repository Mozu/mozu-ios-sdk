//
//  MOZUUrl.h
//  MozuApi
//
//  Created by Kevin Wright on 11/20/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MOZUURLLocation) {
    MOZUHomePod,
    MOZUTenantPod
};

@interface MOZUURL : NSObject

@property(nonatomic,readonly) NSURL *URL;
@property(nonatomic,readonly) MOZUURLLocation location;
@property(nonatomic,readonly) BOOL useSSL;

- (instancetype)initWithTemplate:(NSString *)stringTemplate
                     parameters:(NSDictionary*)params
                       location:(MOZUURLLocation)location
                         useSSL:(BOOL)useSSL;

@end
