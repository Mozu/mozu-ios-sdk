//
//  MOZURefreshInterval.h
//  MozuApi
//
//  Created by Kevin Wright on 11/20/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MOZURefreshInterval : NSObject
@property (nonatomic, readonly) NSTimeInterval accessTokenExpirationInterval;
@property (nonatomic, readonly) NSTimeInterval refreshTokenExpirationInterval;
@property (nonatomic, readonly) NSDate *accessTokenExpirationDate;
@property (nonatomic, readonly) NSDate *refreshTokenExpirationDate;

- (instancetype)initWithAccessTokenExpirationInterval:(NSTimeInterval)accessTokenExpirationInterval refreshTokenTokenExpirationInterval:(NSTimeInterval)refreshTokenExpiratonInterval;
- (void)updateTokenExpirationDatesIncludingRefreshToken:(BOOL)includeRefresh;

@end
