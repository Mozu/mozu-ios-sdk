//
//  MOZUApiContext.h
//  MozuApi
//
//  Created by Kevin Wright on 11/20/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MOZUApiContext <NSObject>

@property(readonly) int tenantId;
@property(readonly) NSNumber* siteId;
@property(readonly) NSString* tenantUrl;
@property(readonly) NSString* siteUrl;
@property(readonly) NSString* correlationId;
@property(readonly) NSString* hmacSHA256;
@property(readonly) NSString* appAuthClaim;
@property(readonly) NSNumber* masterCatalogId;
@property(readonly) NSNumber* catalogId;
//@property(readonly) MOZUTenant* tenant;
-(NSString*)getUrlForDomain:(NSString*)domain;

@end


@interface MOZUApiContextImpl : NSObject <MOZUApiContext>

@property(readonly) int tenantId;
@property(readonly) NSNumber* siteId;
@property(readonly) NSString* tenantUrl;
@property(readonly) NSString* siteUrl;
@property(readonly) NSString* correlationId;
@property(readonly) NSString* hmacSHA256;
@property(readonly) NSString* appAuthClaim;
@property(readonly) NSNumber* masterCatalogId;
@property(readonly) NSNumber* catalogId;
//@property(readonly) MOZUTenant* tenant;
-(id)init;
-(id)initWithTenantId:(int)tenantId andSiteId:(NSNumber*)siteId andMasterCatalogId:(NSNumber*)masterCatalogId andCatalogId:(NSNumber*)catalogId;
//-(id)initWithTenant:(MOZUTenant*)tenant andSite:(MOZUSite*)site andMasterCatalogId:(NSNumber*)masterCatalogId andCatalogId:(NSNumber*)catalogId;
//-(id)initWithSite:(MOZUSite*)site andMasterCatalogId:(NSNumber*)masterCatalogId andCatalogId:(NSNumber*)catalogId;
-(id)initWithHeaders:(NSDictionary*)headers;
-(NSString*)getUrlForDomain:(NSString*)domain;

@end
