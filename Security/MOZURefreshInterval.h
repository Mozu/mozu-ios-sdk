//
//  MOZURefreshInterval.h
//  MozuApi
//
//  Created by Kevin Wright on 11/20/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MOZURefreshInterval : NSObject
@property (readonly) long accessTokenExpirationInterval;
@property (readonly) long refreshTokenExpirationInterval;
@property (readonly) NSDate* accessTokenExpiration;
@property (readonly) NSDate* refreshTokenExpiration;

-(id)initWithAccessTokenExpirationInterval : (long)accessTokenExpirationInterval andRefreshTokenTokenExpirationInterval: (long)refreshTokenExpiratonInterval;
-(void)updateIncludeRefreshTokenExpiration : (bool)isIncluded;

@end
