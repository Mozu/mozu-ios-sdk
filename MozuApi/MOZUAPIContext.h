//
//  MOZUApiContext.h
//  MozuApi
//
//  Created by Kevin Wright on 11/20/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "MOZUTenant.h"

@interface MOZUAPIContext : JSONModel

@property(nonatomic) NSInteger tenantId;
@property(nonatomic) NSNumber* siteId;
@property(nonatomic) NSString* tenantHost;
@property(nonatomic) NSString* siteHost;
@property(nonatomic) NSString* correlationId;
@property(nonatomic) NSString* hmacSHA256;
@property(nonatomic) NSString* appAuthClaim;
@property(nonatomic) NSNumber* masterCatalogId;
@property(nonatomic) NSNumber* catalogId;
@property(nonatomic) MOZUTenant* tenant;
@property(nonatomic) NSString* date;

- (id)initWithTenantId:(NSInteger)tenantId
                siteId:(NSNumber*)siteId
       masterCatalogId:(NSNumber*)masterCatalogId
             catalogId:(NSNumber*)catalogId;
- (id)initWithTenant:(MOZUTenant*)tenant
                site:(MOZUSite*)site
     masterCatalogId:(NSNumber*)masterCatalogId
           catalogId:(NSNumber*)catalogId;
- (id)initWithSite:(MOZUSite*)site
     masterCatalogId:(NSNumber*)masterCatalogId
           catalogId:(NSNumber*)catalogId;
- (id)initWithHeaders:(NSDictionary*)headers;

@end
