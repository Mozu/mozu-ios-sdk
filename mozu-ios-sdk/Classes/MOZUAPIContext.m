//
//  MOZUApiContext.m
//  MozuApi
//
//  Created by Kevin Wright on 11/20/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import "MOZUAPIContext.h"
#import "MOZUHeaders.h"
#import "MOZUTenant.h"
#import "MOZUUserAuthenticator.h"

@implementation MOZUAPIContext

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithTenantId:(NSInteger)tenantId
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

- (instancetype)initWithTenant:(MOZUTenant *)tenant
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
        
        if (!masterCatalogId && tenant.masterCatalogs.count == 1) {
            MOZUTenantMasterCatalog *masterCatalog = [tenant.masterCatalogs firstObject];
            _masterCatalogId = @(masterCatalog.id);
            
            MOZUCatalog *catalog = [masterCatalog.catalogs firstObject];
            _catalogId = @(catalog.id);
        }
    }
    return self;
}

- (instancetype)initWithSite:(MOZUSite *)site
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

- (instancetype)initWithHeaders:(NSDictionary *)headers
{
    self = [super init];
    if (self) {
        _tenantId = [headers[MOZU_X_VOL_TENANT] integerValue];
        _siteId = @([headers[MOZU_X_VOL_SITE] integerValue]); // Converts string value to int value.
        _tenantHost = headers[MOZU_X_VOL_TENANT_DOMAIN];
        _siteHost = headers[MOZU_X_VOL_SITE_DOMAIN];
        _correlationId = headers[MOZU_X_VOL_CORRELATION];
        _hmacSHA256 = headers[MOZU_X_VOL_HMAC_SHA256];
        _date = headers[MOZU_DATE];
        
        if ([[headers allKeys] containsObject:MOZU_X_VOL_MASTER_CATALOG] && headers[MOZU_X_VOL_MASTER_CATALOG]) {
            _masterCatalogId = @([headers[MOZU_X_VOL_MASTER_CATALOG] integerValue]);
        }

        if ([[headers allKeys] containsObject:MOZU_X_VOL_CATALOG] && headers[MOZU_X_VOL_CATALOG]) {
            _catalogId = @([headers[MOZU_X_VOL_CATALOG] integerValue]);
        }
    }
    return self;
}

- (void)updateBySite:(MOZUSite *)site {
    if (site && site.id >= 0) {
        self.siteId = @(site.id);
        self.siteHost = site.domain;
    }
}

+ (JSONKeyMapper *)keyMapper {
    NSDictionary *dict = @{
        @"tenantUrl" : @"tenantHost",
        @"siteUrl" : @"siteHost",
        };
    
    return [[JSONKeyMapper alloc] initWithDictionary:dict];
}

- (id)cloneWith:(MOZUAPIContextModificationBlock)apiContextModification
{
    MOZUAPIContext* cloned = [self init];
    
    cloned.appAuthTicket = self.appAuthTicket;
    cloned.catalogId = self.catalogId;
    cloned.correlationId = self.correlationId;
    cloned.currency = [NSString stringWithString:self.currency];
    cloned.date = [NSString stringWithString:self.date];
    cloned.hmacSHA256 = [NSString stringWithString:self.hmacSHA256];
    cloned.locale = [NSString stringWithString:self.locale];
    cloned.masterCatalogId = self.masterCatalogId;
    cloned.siteId = self.siteId;
    cloned.siteHost = [NSString stringWithString:self.siteHost];
    cloned.tenant = self.tenant;
    cloned.tenantId = self.tenantId;
    cloned.tenantHost = [NSString stringWithString:self.tenantHost];
    cloned.userAuthTicket = self.userAuthTicket;
    
    apiContextModification(cloned);
    return cloned;
}

@end
