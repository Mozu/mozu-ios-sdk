
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
#import "MOZUAttributeInProductType.h"



@protocol MOZUProductType
@end


/**
	A product type is like a product template.
*/
@interface MOZUProductType : JSONModel<MOZUProductType>

/**
The type of goods in a bundled product. A bundled product is composed of products associated to sell together. Possible values include “Physical” and “DigitalCredit”. This comes from the `productType `of the product. Products are defaulted to a Physical `goodsType`. Gift cards have a `goodsType `of DigitalCredit.
*/
@property(nonatomic) NSString * goodsType;

/**
Unique identifier of the source product property. For a product field it will be the name of the field. For a product attribute it will be the Attribute FQN. 
*/
@property(nonatomic) NSNumber * id;

/**
If true, this product is associated with the overall product type. There is only one BaseProductType per site group. System-supplied and read-only.
*/
@property(nonatomic) BOOL isBaseProductType;

/**
The unique identifier of the master catalog associated with the entity.
*/
@property(nonatomic) NSNumber * masterCatalogId;

/**
The display name of the source product property. For a product field it will be the display name of the field. For a product attribute it will be the Attribute Name.
*/
@property(nonatomic) NSString * name;

/**
The total number of products. This total may indicate the total products associate with a product type or number of products in a list.
*/
@property(nonatomic) NSNumber * productCount;

/**
List of product usages that describe how products of this type are used. Products of this type can be Standard (a single product without configurable options), Configurable (a product that includes configurable option attributes), Bundle (a collection of products sold as a single entity), or Component (an invididual product that represents a component in a bundle). Product type usages cannot be both Bundle and Configurable.
*/
@property(nonatomic) NSArray *productUsages;

/**
Identifier and datetime stamp information recorded when a user or application creates, updates, or deletes a resource entity. This value is system-supplied and read-only.
*/
@property(nonatomic) MOZUAuditInfo *auditInfo;

/**
List of extra product attributes defined for this product. For example, monogram could be a possible extra for a shirt product.
*/
@property(nonatomic) NSArray<MOZUAttributeInProductType> *extras;

/**
List of option attributes configured for an object. These values are associated and used by products, product bundles, and product types.
*/
@property(nonatomic) NSArray<MOZUAttributeInProductType> *options;

/**
Collection of property attributes defined for the object. Properties are associated to all objects within Mozu, including documents, products, and product types.
*/
@property(nonatomic) NSArray<MOZUAttributeInProductType> *properties;

@end
