//
//  AuthTicket.h
//  Api
//
//  Created by Sanjay Mandadi on 10/3/13.
//  Copyright (c) 2013 Mozu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@protocol MOZUAuthTicket
@end


@interface MOZUAuthTicket : JSONModel<MOZUAuthTicket>

@property NSString* accessToken;
@property NSDate* accessTokenExpiration;
@property NSString* refreshToken;
@property NSDate* refreshTokenExpiration;

@end
