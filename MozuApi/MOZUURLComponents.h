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

@interface MOZUURLComponents : NSObject

@property (nonatomic, strong, readonly) NSURL *URL;
@property (nonatomic, assign, readonly) MOZUURLLocation location;
@property (nonatomic, assign, readonly) BOOL useSSL;
@property (nonatomic, strong, readonly) NSString *scheme; // Attempting to set the scheme with an invalid scheme string will cause an exception.
@property (nonatomic, copy) NSString *host;
@property (nonatomic, strong, readonly) NSNumber *port; // Attempting to set a negative port number will cause an exception.
@property (nonatomic, strong, readonly) NSString *path;
@property (nonatomic, strong, readonly) NSString *query;
@property (nonatomic, strong, readonly) NSString *fragment;

- (instancetype)initWithTemplate:(NSString *)stringTemplate
                     parameters:(NSDictionary*)params
                       location:(MOZUURLLocation)location
                         useSSL:(BOOL)useSSL;

@end
