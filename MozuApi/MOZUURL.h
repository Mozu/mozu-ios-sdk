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

@interface MOZUURL : NSURLComponents

@property (nonatomic, assign, readonly) MOZUURLLocation location;
@property (nonatomic, assign, readonly) BOOL useSSL;

- (instancetype)initWithTemplate:(NSString *)stringTemplate
                     parameters:(NSDictionary*)params
                       location:(MOZUURLLocation)location
                         useSSL:(BOOL)useSSL;

@end
