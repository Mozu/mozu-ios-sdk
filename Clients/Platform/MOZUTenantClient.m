//
//  MOZUTenantClient.m
//  MozuApi
//
//  Created by Kevin Wright on 11/25/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import "MOZUTenantClient.h"
#import "MOZUTenantUrl.h"
#import "MOZUTenant.h"

@implementation MOZUTenantClient

+(MOZUClient*)getTenantClient:(int)tenantId andAuthTicket:(MOZUAuthTicket*)authTicket {
    id url = [MOZUTenantUrl getTenantUrl:tenantId];
    id verb = @"GET";
    MOZUClient* client = [[MOZUClient alloc] init];
    [client withVerb:verb];
    [client withResourceUrl:url];
    
    if (authTicket != nil) {
        [client withUserClaims:authTicket];
    }
    
    [client withJsonParser:^id(NSString *jsonResult) {
        return [[MOZUTenant alloc] initWithString:jsonResult error:nil];
    }];
    
    return client;
    
}

@end
