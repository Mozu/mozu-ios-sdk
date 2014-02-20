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

@property(nonatomic, readonly) NSInteger tenantId;
@property(nonatomic, readonly) NSNumber* siteId;
@property(nonatomic, readonly) NSString* tenantHost;
@property(nonatomic, readonly) NSString* siteHost;
@property(nonatomic, readonly) NSString* correlationId;
@property(nonatomic, readonly) NSString* hmacSHA256;
@property(nonatomic, readonly) NSString* appAuthClaim;
@property(nonatomic, readonly) NSNumber* masterCatalogId;
@property(nonatomic, readonly) NSNumber* catalogId;
@property(nonatomic, readonly) MOZUTenant* tenant;
@property(nonatomic, readonly) NSString* date;

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
- (NSURL *)getURLForHost:(NSString*)host;

@end
