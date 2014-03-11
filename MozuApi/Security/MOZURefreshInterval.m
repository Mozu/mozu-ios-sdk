//
//  MOZURefreshInterval.m
//  MozuApi
//
//  Created by Kevin Wright on 11/20/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import "MOZURefreshInterval.h"

@interface MOZURefreshInterval()

@property (nonatomic, readwrite) NSTimeInterval accessTokenExpirationInterval;
@property (nonatomic, readwrite) NSTimeInterval refreshTokenExpirationInterval;
@property (nonatomic, readwrite) NSDate* accessTokenExpirationDate;
@property (nonatomic, readwrite) NSDate* refreshTokenExpirationDate;

@end

@implementation MOZURefreshInterval

- (instancetype)initWithAccessTokenExpirationInterval:(NSTimeInterval)accessTokenExpirationInterval refreshTokenTokenExpirationInterval:(NSTimeInterval)refreshTokenExpiratonInterval
{
    self = [super init];
    if (self) {
        self.accessTokenExpirationInterval = accessTokenExpirationInterval;
        self.refreshTokenExpirationInterval = refreshTokenExpiratonInterval;
        [self updateTokenExpirationDatesIncludingRefreshToken:YES];
    }
    return self;
}

- (void)updateTokenExpirationDatesIncludingRefreshToken:(BOOL)includeRefresh
{
    self.accessTokenExpirationDate = [[NSDate alloc] initWithTimeIntervalSinceNow:self.accessTokenExpirationInterval];
    if (includeRefresh) {
        self.refreshTokenExpirationDate = [[NSDate alloc] initWithTimeIntervalSinceNow:self.refreshTokenExpirationInterval];
    }
}

- (NSString *)description
{
    NSString *string = [NSString stringWithFormat:@"\nAccess token expiration date:  %@\nRefresh token expiration date: %@", self.accessTokenExpirationDate, self.refreshTokenExpirationDate];
    return string;
}

@end
