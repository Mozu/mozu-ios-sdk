//
//  AppAuthInfo.h
//  Api
//
//  Created by Sanjay Mandadi on 10/3/13.
//  Copyright (c) 2013 Mozu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@protocol MOZUAppAuthInfo
@end

@interface MOZUAppAuthInfo : JSONModel<MOZUAppAuthInfo>

@property NSString* applicationId;
@property NSString* sharedSecret;

@end
