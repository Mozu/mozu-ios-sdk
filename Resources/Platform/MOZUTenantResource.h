//
//  MOZUTenantResource.h
//  MozuApi
//
//  Created by Kevin Wright on 11/26/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOZUTenantClient.h"
#import "MOZUTenant.h"

@interface MOZUTenantResource : NSObject
+(void)getTenant:(int)tenantId withAuthTicket:(MOZUAuthTicket*)authTicket withResultHandler:(void(^)(MOZUTenant*))resultHandler;
@end
