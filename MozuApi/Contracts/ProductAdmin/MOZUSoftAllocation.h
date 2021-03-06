
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
#import "MOZUAuditInfo.h"



@protocol MOZUSoftAllocation
@end


/**
	Mozu.ProductAdmin.Contracts.SoftAllocation ApiType DOCUMENT_HERE 
*/
@interface MOZUSoftAllocation : JSONModel<MOZUSoftAllocation>

/**
The UTC DateTime this allocation will expire
*/
@property(nonatomic) NSDate * expiresAt;

/**
Unique identifier of the source product property. For a product field it will be the name of the field. For a product attribute it will be the Attribute FQN. 
*/
@property(nonatomic) NSNumber * id;

/**
The unique, user-defined code that identifies a location. This location can be the location where the order was entered, location for newly in-stock products, and where products are returned.
*/
@property(nonatomic) NSString * locationCode;

/**
The unique, user-defined  product code of a product, used throughout Mozu to reference and associate to a product.
*/
@property(nonatomic) NSString * productCode;

/**
The specified quantity of objects and items. This property is used for numerous object types including products, options, components within a product bundle, cart and order items, returned items, shipping line items, items in a digital product. and items associated with types and reservations.
*/
@property(nonatomic) NSNumber * quantity;

/**
Entity RefrenceID this allocation is linked to.
*/
@property(nonatomic) NSString * referenceId;

/**
item Id of the RefrenceID.
*/
@property(nonatomic) NSString * referenceItemId;

/**
Basic audit info about the object, including date, time, and user account. Identifier and datetime stamp information recorded when a user or application creates, updates, or deletes a resource entity. This value is system-supplied and read-only.
*/
@property(nonatomic) MOZUAuditInfo *auditInfo;

@end

