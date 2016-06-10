//
//  MOZUApiContext.h
//  MozuApi
//
//  Created by Kevin Wright on 11/20/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@class MOZUTenant;
@class MOZUSite;
@class MOZUAuthTicket;
@class MOZUUserAuthTicket;
@class MOZUAPIContext;
typedef void(^MOZUAPIContextModificationBlock)(MOZUAPIContext* apiContext);

#import "MOZUAppAuthInfo.h"
#import "MOZUAuthTicket.h"
#import "MOZUDeveloperAdminUserAuthTicket.h"
#import "MOZUTenantAdminUserAuthTicket.h"
#import "MOZUCustomerAuthTicket.h"

@interface MOZUAPIContext : JSONModel

@property(nonatomic) NSInteger tenantId;
@property(nonatomic) NSNumber *siteId;
@property(nonatomic) NSString *tenantHost;
@property(nonatomic) NSString *siteHost;
@property(nonatomic) NSString *correlationId;
@property(nonatomic) NSString *hmacSHA256;

@property(nonatomic, strong) MOZUAppAuthInfo *appAuthInfo;
@property(nonatomic, strong) MOZUAuthTicket *appAuthTicket;
@property(nonatomic, strong) MOZUDeveloperAdminUserAuthTicket *developerAdminUserAuthTicket;
@property(nonatomic, strong) MOZUTenantAdminUserAuthTicket *tenantAdminUserAuthTicket;
@property(nonatomic, strong) MOZUCustomerAuthTicket *customerAuthTicket;

@property(nonatomic) MOZUUserAuthTicket *userAuthTicket;
@property(nonatomic) NSNumber *masterCatalogId;
@property(nonatomic) NSNumber *catalogId;
@property(nonatomic) MOZUTenant *tenant;
@property(nonatomic) NSString *date;
@property(nonatomic) NSString *locale;
@property(nonatomic) NSString *currency;

/**
 Creates an instance of a MOZUAPIContext object.
 @param tenantId Required NSInteger represenging the tenent id.
 @param siteId The site id.
 @param masterCatalogId The master catalog id.
 @param catalogId The catalog id.
 @returns an instance of MOZUAPIContext object.
 */
- (id)initWithTenantId:(NSInteger)tenantId
                siteId:(NSNumber *)siteId
       masterCatalogId:(NSNumber *)masterCatalogId
             catalogId:(NSNumber *)catalogId;

/**
 Creates an instance of a MOZUAPIContext object.
 @param tenant Required MOZUTenant instance.
 @param site A MOZUSite instance.
 @param masterCatalogId The master catalog id.
 @param catalogId The catalog id.
 @returns an instance of MOZUAPIContext object.
 */
- (id)initWithTenant:(MOZUTenant *)tenant
                site:(MOZUSite *)site
     masterCatalogId:(NSNumber *)masterCatalogId
           catalogId:(NSNumber *)catalogId;

/**
 Creates an instance of a MOZUAPIContext object.
 @param site A MOZUSite instance.
 @param masterCatalogId The master catalog id.
 @param catalogId The catalog id.
 @returns an instance of MOZUAPIContext object.
 */
- (id)initWithSite:(MOZUSite *)site
   masterCatalogId:(NSNumber *)masterCatalogId
         catalogId:(NSNumber *)catalogId;

/**
 Creates an instance of a MOZUAPIContext.
 @param headers Dictionary containing keys from MozuHeaders.h
 @returns an instance of MOZUAPIContext object.
 */
- (id)initWithHeaders:(NSDictionary *)headers;

- (id)cloneWith:(MOZUAPIContextModificationBlock)apiContextModification;

@end




