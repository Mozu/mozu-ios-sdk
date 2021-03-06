
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



@protocol MOZUCatalog
@end


/**
	Properties of an individual product catalog.
*/
@interface MOZUCatalog : JSONModel<MOZUCatalog>

/**
The date time in UTC format set when the object was created. 
*/
@property(nonatomic) NSDate * createDate;

/**
The default three-letter ISO currency code for monetary amounts. Currently, only "USD" is supported for U.S. Dollar.
*/
@property(nonatomic) NSString * defaultCurrencyCode;

/**
The two-letter default locale code for setting the localized text content. Currently, only "en-US" is supported for U.S. English.
*/
@property(nonatomic) NSString * defaultLocaleCode;

/**
The date and time the object was deleted. 
*/
@property(nonatomic) NSDate * deleteDate;

/**
Unique identifier of the source product property. For a product field it will be the name of the field. For a product attribute it will be the Attribute FQN. 
*/
@property(nonatomic) NSInteger id;

/**
Indicates if the object is deleted. If true, the object has been deleted. This may affect associated child members and objects. For example, a deleted master catalog affects all associated catalogs. 
*/
@property(nonatomic) BOOL isDeleted;

/**
Unique identifier for the master catalog. 
*/
@property(nonatomic) NSInteger masterCatalogId;

/**
The display name of the source product property. For a product field it will be the display name of the field. For a product attribute it will be the Attribute Name.
*/
@property(nonatomic) NSString * name;

/**
The current status of an object. This status is specific to the object including payment (New, Authorized, Captured, Declined, Failed, Voided, Credited, CheckRequested, or RolledBack), discount (Active, Scheduled, or Expired), returns (ReturnAuthorized), tenant, package (Fulfilled or NotFulfilled), application, master and product catalogs, orders (Pending, Submitted, Processing, Pending Review, Closed, or Canceled), and order validation results (Pass, Fail, Error, or Review).
*/
@property(nonatomic) NSString * status;

/**
Unique identifier of the Mozu tenant.
*/
@property(nonatomic) NSInteger tenantId;

/**
The date and time the object was updated most recently. The date is in UTC format.
*/
@property(nonatomic) NSDate * updateDate;

@end

