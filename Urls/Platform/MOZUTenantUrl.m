//
//  MOZUTenantUrl.m
//  MozuApi
//
//  Created by Kevin Wright on 11/24/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import "MOZUTenantUrl.h"

@implementation MOZUTenantUrl
+(MOZUUrl*)getTenantUrl:(int)tenantId {
    NSString* url = @"/api/platform/tenants/{tenantId}";
    [MOZUUrl formatUrl:&url withParamName:@"tenantId" andValue:@(tenantId)];
    return [[MOZUUrl alloc] initWithUrl:url andLocation:kHomePod andUseSSL:YES];
}

@end
