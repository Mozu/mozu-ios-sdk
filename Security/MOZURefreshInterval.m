//
//  MOZURefreshInterval.m
//  MozuApi
//
//  Created by Kevin Wright on 11/20/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import "MOZURefreshInterval.h"

@interface MOZURefreshInterval()
@property (readwrite) long accessTokenExpirationInterval;
@property (readwrite) long refreshTokenExpirationInterval;
@property (readwrite) NSDate* accessTokenExpiration;
@property (readwrite) NSDate* refreshTokenExpiration;
@end

@implementation MOZURefreshInterval

-(id)initWithAccessTokenExpirationInterval : (long)accessTokenExpirationInterval andRefreshTokenTokenExpirationInterval: (long)refreshTokenExpiratonInterval {
    if (self = [super init]) {
        self.accessTokenExpirationInterval = accessTokenExpirationInterval;
        self.refreshTokenExpirationInterval = refreshTokenExpiratonInterval;
        [self updateIncludeRefreshTokenExpiration:true];
        return self;
    }
    else {
        return nil;
    }
}

-(void)updateIncludeRefreshTokenExpiration : (bool)isIncluded {
    self.accessTokenExpiration = [[NSDate alloc] initWithTimeIntervalSinceNow:(NSTimeInterval)self.accessTokenExpirationInterval];
    if (isIncluded) {
        self.refreshTokenExpiration = [[NSDate alloc] initWithTimeIntervalSinceNow:(NSTimeInterval)self.refreshTokenExpirationInterval];
        
    }
}

@end
