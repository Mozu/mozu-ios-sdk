
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "MOZUApplicationTransaction.h"



@protocol MOZUApplicationEntitlement
@end


/**
	Mozu.AppDev.Contracts.ApplicationEntitlement ApiType DOCUMENT_HERE 
*/
@interface MOZUApplicationEntitlement : JSONModel<MOZUApplicationEntitlement>

/**
Mozu.AppDev.Contracts.ApplicationEntitlement appKey ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSString * appKey;

/**
Mozu.AppDev.Contracts.ApplicationEntitlement applicationEntitlementId ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSInteger applicationEntitlementId;

/**
Mozu.AppDev.Contracts.ApplicationEntitlement applicationId ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSInteger applicationId;

/**
Mozu.AppDev.Contracts.ApplicationEntitlement applicationLicenseType ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSString * applicationLicenseType;

/**
Mozu.AppDev.Contracts.ApplicationEntitlement applicationName ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSString * applicationName;

/**
Mozu.AppDev.Contracts.ApplicationEntitlement applicationStatusId ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSString * applicationStatusId;

/**
Mozu.AppDev.Contracts.ApplicationEntitlement applicationVersion ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSString * applicationVersion;

/**
Mozu.AppDev.Contracts.ApplicationEntitlement effectiveEndDate ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSDate * effectiveEndDate;

/**
Mozu.AppDev.Contracts.ApplicationEntitlement effectiveStartDate ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSDate * effectiveStartDate;

/**
Mozu.AppDev.Contracts.ApplicationEntitlement entitlementStatus ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSString * entitlementStatus;

/**
Mozu.AppDev.Contracts.ApplicationEntitlement installedByFirstName ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSString * installedByFirstName;

/**
Mozu.AppDev.Contracts.ApplicationEntitlement installedByLastName ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSString * installedByLastName;

/**
Mozu.AppDev.Contracts.ApplicationEntitlement installedDate ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSDate * installedDate;

/**
Mozu.AppDev.Contracts.ApplicationEntitlement packageId ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSInteger packageId;

/**
Mozu.AppDev.Contracts.ApplicationEntitlement packageName ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSString * packageName;

/**
Unique identifier for the site. This ID is used at all levels of a store, catalog, and tenant to associate objects to a site.
*/
@property(nonatomic) NSNumber * siteId;

/**
Unique identifier of the Mozu tenant.
*/
@property(nonatomic) NSInteger tenantId;

/**
Mozu.AppDev.Contracts.ApplicationEntitlement tenantName ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSString * tenantName;

/**
Mozu.AppDev.Contracts.ApplicationEntitlement applicationTransactions ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSArray<MOZUApplicationTransaction> *applicationTransactions;

@end

