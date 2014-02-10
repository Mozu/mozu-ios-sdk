//
//  MOZUApiContext.m
//  MozuApi
//
//  Created by Kevin Wright on 11/20/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import "MOZUAPIContext.h"
#import "MOZUHeaders.h"

@interface MOZUAPIContext()

@property(readwrite) NSInteger tenantId;
@property(readwrite) NSNumber* siteId;
@property(readwrite) NSString* tenantUrl;
@property(readwrite) NSString* siteUrl;
@property(readwrite) NSString* correlationId;
@property(readwrite) NSString* hmacSHA256;
@property(readwrite) NSString* appAuthClaim;
@property(readwrite) NSNumber* masterCatalogId;
@property(readwrite) NSNumber* catalogId;

@end

@implementation MOZUAPIContext

-(id)init {
    if (self = [super init]) {
        return self;
    }
    else {
        return nil;
    }
}

- (id)initWithTenantId:(NSInteger)tenantId
                siteId:(NSNumber*)siteId
       masterCatalogId:(NSNumber*)masterCatalogId
             catalogId:(NSNumber*)catalogId
{
    if (self = [super init]) {
        self.tenantId = tenantId;
        self.siteId = siteId;
        self.masterCatalogId = masterCatalogId;
        self.catalogId = catalogId;
        
        return self;
    }
    else {
        return nil;
    }
}

//-(id)initWithTenant:(MOZUTenant*)tenant andSite:(MOZUSite*)site andMasterCatalogId:(NSNumber*)masterCatalogId andCatalogId:(NSNumber*)catalogId {
//
//}

//-(id)initWithSite:(MOZUSite*)site andMasterCatalogId:(NSNumber*)masterCatalogId andCatalogId:(NSNumber*)catalogId {
//
//}

-(id)initWithHeaders:(NSDictionary*)headers {
    if (self = [super init]) {
        self.tenantId = [headers[kX_VOL_TENANT] intValue];
        self.siteId = [NSNumber numberWithInt:[headers[kX_VOL_SITE] intValue]];
        self.tenantUrl = headers[kX_VOL_TENANT_DOMAIN];
        self.siteUrl = headers[kX_VOL_SITE_DOMAIN];
        self.correlationId = headers[kX_VOL_CORRELATION];
        self.hmacSHA256 = headers[kX_VOL_HMAC_SHA256];
        self.masterCatalogId = [NSNumber numberWithInt:[headers[kX_VOL_MASTER_CATALOG] intValue]];
        self.catalogId = [NSNumber numberWithInt:[headers[kX_VOL_CATALOG] intValue]];
        
        if ([self.tenantUrl length] != 0) {
            self.tenantUrl = [self getUrlForDomain:self.tenantUrl];
        }
        
        if ([self.siteUrl length] != 0) {
            self.siteUrl = [self getUrlForDomain:self.siteUrl];
        }
        
        return self;
    }
    else {
        return nil;
    }
}

-(NSString*)getUrlForDomain:(NSString*)domain {
    return [NSString stringWithFormat:@"http://%@", domain];
}


@end
