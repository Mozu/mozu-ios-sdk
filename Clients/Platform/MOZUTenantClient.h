//
//  MOZUTenantClient.h
//  MozuApi
//
//  Created by Kevin Wright on 11/25/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOZUClient.h"

@interface MOZUTenantClient : NSObject
+(MOZUClient*)getTenantClient:(int)tenantId andAuthTicket:(MOZUAuthTicket*)authTicket;
@end
