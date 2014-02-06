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

@interface MOZUUrl : NSObject
@property NSString *url;
@property MOZUUrlLocation location;
@property BOOL useSSL;

-(id)initWithUrl:(NSString*)url andLocation:(MOZUUrlLocation)location andUseSSL:(BOOL)useSSL;
+(void)formatUrl:(NSString**)url withParamName:(NSString*)paramName andValue:(id)value;
@end
