//
//  MOZUAuthTicketRequest.h
//  MozuApi
//
//  Created by Kevin Wright on 11/22/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@protocol MOZUAuthTicketRequest
@end

@interface MOZUAuthTicketRequest : JSONModel<MOZUAuthTicketRequest>
@property NSString* refreshToken;
@end
