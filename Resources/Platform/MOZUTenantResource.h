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
// make completion handler like in client with errors, http response, etc.
// if operation method is a 'get', remove get from method name
// make all int to NSInteger
// make genned completionhandler like in client
+(void)tenantWithTenantId:(int)tenantId authTicket:(MOZUAuthTicket*)authTicket completionHandler:(void(^)(MOZUTenant*))resultHandler;
@end
