//
//  MOZUApiContext.m
//  MozuApi
//
//  Created by Kevin Wright on 11/20/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import "MOZUAPIContext.h"
#import "MOZUHeaders.h"


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

- (id)initWithTenant:(MOZUTenant*)tenant
                site:(MOZUSite*)site
     masterCatalogId:(NSNumber*)masterCatalogId
           catalogId:(NSNumber*)catalogId {
    
    if (self = [super init]) {
        self.tenant= tenant;
        self.tenantId = tenant.id;
        self.tenantHost = tenant.domain;
        [self updateBySite:site];
        self.masterCatalogId = masterCatalogId;
        self.catalogId = catalogId;
        
        if (masterCatalogId == nil && [tenant.masterCatalogs count] == 1) {
            MOZUTenantMasterCatalog* masterCatalog = [tenant.masterCatalogs firstObject];
            self.masterCatalogId = @(masterCatalog.id);
            
            MOZUCatalog* catalog = [masterCatalog.catalogs firstObject];
            self.catalogId = @(catalog.id);
        }
        
        return self;
    }
    else {
        return nil;
    }
}

- (id)initWithSite:(MOZUSite*)site
   masterCatalogId:(NSNumber*)masterCatalogId
         catalogId:(NSNumber*)catalogId {

    if (self = [super init]) {
        self.tenantId = site.tenantId;
        [self updateBySite:site];
        self.masterCatalogId = masterCatalogId;
        self.catalogId = catalogId;
        
        return self;
    }
    else {
        return nil;
    }

}

-(id)initWithHeaders:(NSDictionary*)headers {
    if (self = [super init]) {
        self.tenantId = [headers[MOZU_X_VOL_TENANT] intValue];
        self.siteId = [NSNumber numberWithInt:[headers[MOZU_X_VOL_SITE] intValue]];
        self.tenantHost = headers[MOZU_X_VOL_TENANT_DOMAIN];
        self.siteHost = headers[MOZU_X_VOL_SITE_DOMAIN];
        self.correlationId = headers[MOZU_X_VOL_CORRELATION];
        self.hmacSHA256 = headers[MOZU_X_VOL_HMAC_SHA256];
        self.masterCatalogId = [NSNumber numberWithInt:[headers[MOZU_X_VOL_MASTER_CATALOG] intValue]];
        self.catalogId = [NSNumber numberWithInt:[headers[MOZU_X_VOL_CATALOG] intValue]];
        
        return self;
    }
    else {
        return nil;
    }
}

-(NSURL *)getURLForHost:(NSString*)host {
    NSURLComponents *URLComponents = [NSURLComponents new];
    URLComponents.host = host;
    URLComponents.scheme = @"http";
    return URLComponents.URL;
}

-(void)updateBySite:(MOZUSite*)site {
    if (site != nil && site.id >= 0) {
        self.siteId = @(site.id);
        self.siteHost = site.domain;
    }
}

+(JSONKeyMapper*)keyMapper {
    NSDictionary* dict = @{
        @"tenantUrl" : @"tenantHost",
        @"siteUrl" : @"siteHost",
        };
    
    return [[JSONKeyMapper alloc] initWithDictionary:dict];
}

@end
