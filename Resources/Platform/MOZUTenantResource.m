//
//  MOZUTenantResource.m
//  MozuApi
//
//  Created by Kevin Wright on 11/26/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import "MOZUTenantResource.h"
#import "MOZUCacheManager.h"

@implementation MOZUTenantResource
+(void)getTenant:(int)tenantId withAuthTicket:(MOZUAuthTicket*)authTicket withResultHandler:(void(^)(MOZUTenant*))resultHandler {
    NSString* cacheKey = [@(tenantId) stringValue];
    id tenant = [MOZUCacheManager getCacheForKey:cacheKey];
    if (tenant != nil) {
        resultHandler(tenant);
        return;
    }
    
    MOZUClient* client = [MOZUTenantClient getTenantClient:tenantId andAuthTicket:authTicket];
    [client withHandler:^(id result, MOZUApiError *error, NSDictionary *headers) {
        if (result != nil) {
            [MOZUCacheManager setCache:result forKey:cacheKey];
        }
        
        resultHandler(result);
    }];
    
    [client execute];
    
}

@end
