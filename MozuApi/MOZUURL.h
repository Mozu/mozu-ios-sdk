//
//  MOZUUrl.h
//  MozuApi
//
//  Created by Kevin Wright on 11/20/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MOZUUrlLocation) {
    kHomePod,
    kTenantPod
};

@interface MOZUURL : NSObject

@property(nonatomic,readonly) NSURL *URL;
@property(nonatomic,readonly) MOZUUrlLocation location;
@property(nonatomic,readonly) BOOL useSSL;

-(instancetype)initWithTemplate:(NSString *)stringTemplate
                     parameters:(NSDictionary*)params
                       location:(MOZUUrlLocation)location
                         useSSL:(BOOL)useSSL;

@end
