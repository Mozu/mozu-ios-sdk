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

@property(readonly, nonatomic) NSURL *url;
@property(readonly, nonatomic) MOZUUrlLocation location;
@property(readonly, nonatomic) BOOL useSSL;

-(instancetype)initWithTemplate:(NSString*)template
    parameters:(NSDictionary*)params
    location:(MOZUUrlLocation)location
    useSSL:(BOOL)useSSL;

@end
