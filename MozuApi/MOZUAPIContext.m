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

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (id)initWithTenantId:(NSInteger)tenantId
                siteId:(NSNumber *)siteId
       masterCatalogId:(NSNumber *)masterCatalogId
             catalogId:(NSNumber *)catalogId
{
    self = [super init];
    if (self) {
        _tenantId = tenantId;
        _siteId = siteId;
        _masterCatalogId = masterCatalogId;
        _catalogId = catalogId;;
    }
    return self;
}

- (id)initWithTenant:(MOZUTenant *)tenant
                site:(MOZUSite *)site
     masterCatalogId:(NSNumber *)masterCatalogId
           catalogId:(NSNumber *)catalogId
{
    self = [super init];
    if (self) {
        _tenant= tenant;
        _tenantId = tenant.id;
        _tenantHost = tenant.domain;
        [self updateBySite:site];
        _masterCatalogId = masterCatalogId;
        _catalogId = catalogId;
        
        if (masterCatalogId == nil && [tenant.masterCatalogs count] == 1) {
            MOZUTenantMasterCatalog* masterCatalog = [tenant.masterCatalogs firstObject];
            _masterCatalogId = @(masterCatalog.id);
            
            MOZUCatalog* catalog = [masterCatalog.catalogs firstObject];
            _catalogId = @(catalog.id);
        }
    }
    return self;
}

- (id)initWithSite:(MOZUSite *)site
   masterCatalogId:(NSNumber *)masterCatalogId
         catalogId:(NSNumber *)catalogId
{
    self = [super init];
    if (self) {
        _tenantId = site.tenantId;
        [self updateBySite:site];
        _masterCatalogId = masterCatalogId;
        _catalogId = catalogId;
    }
    return self;
}

-(id)initWithHeaders:(NSDictionary *)headers
{
    self = [super init];
    if (self) {
        _tenantId = [headers[MOZU_X_VOL_TENANT] intValue];
        _siteId = [NSNumber numberWithInt:[headers[MOZU_X_VOL_SITE] intValue]];
        _tenantHost = headers[MOZU_X_VOL_TENANT_DOMAIN];
        _siteHost = headers[MOZU_X_VOL_SITE_DOMAIN];
        _correlationId = headers[MOZU_X_VOL_CORRELATION];
        _hmacSHA256 = headers[MOZU_X_VOL_HMAC_SHA256];
        _masterCatalogId = [NSNumber numberWithInt:[headers[MOZU_X_VOL_MASTER_CATALOG] intValue]];
        _catalogId = [NSNumber numberWithInt:[headers[MOZU_X_VOL_CATALOG] intValue]];
    }
    return self;
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
