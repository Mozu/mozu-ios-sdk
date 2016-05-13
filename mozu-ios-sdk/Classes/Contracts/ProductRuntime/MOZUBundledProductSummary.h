
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
#import "MOZURuntimeProductInventoryInfo.h"
#import "MOZURuntimePackageMeasurements.h"



@protocol MOZUBundledProductSummary
@end


/**
	System-supplied and read only information for component products in a product bundle.
*/
@interface MOZUBundledProductSummary : JSONModel<MOZUBundledProductSummary>

/**
The credit value of the product or bundled product. When the `goodsType `is `DigitalCredit`, this value is populated to indicate the value of the credit. This is used to create store credit in the fulfillment of gift cards.
*/
@property(nonatomic) NSNumber * creditValue;

/**
The type of goods in a bundled product. A bundled product is composed of products associated to sell together. Possible values include “Physical” and “DigitalCredit”. This comes from the `productType `of the product. Products are defaulted to a Physical `goodsType`. Gift cards have a `goodsType `of DigitalCredit.
*/
@property(nonatomic) NSString * goodsType;

/**
Indicates if the product must be shipped alone in a container. This is used for products and products within a bundle. If true, this product cannot be shipped in a package with other items and must ship in a package by itself.
*/
@property(nonatomic) NSNumber * isPackagedStandAlone;

/**
Fully qualified name of the selected option's attribute. Bundledproducts result from a static bundle or are dynamically added as a result of the shopper selecting products as extras. When the bundled item is dynamic, it includes the attribute's fully qualified name of the extra that it came from. When `optionAttributeFQN `is null, the bundled item was statically defined. When not null, the item came from an extra selection.
*/
@property(nonatomic) NSString * optionAttributeFQN;

/**
The value of the option attribute. These values are associated and used by product bundles and options.
*/
@property(nonatomic) NSObject * optionValue;

/**
Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
*/
@property(nonatomic) NSString * productCode;

/**
The name of the product that represents a line item in a taxable order or product bundle.
*/
@property(nonatomic) NSString * productName;

/**
Brief text description of the product or component in a product bundle, typically used when the product is displayed in a list or in search results.
*/
@property(nonatomic) NSString * productShortDescription;

/**
The product type template associated with the product on the storefront.
*/
@property(nonatomic) NSString * productType;

/**
The specified quantity of objects and items. This property is used for numerous object types including products, options, components within a product bundle, cart and order items, returned items, shipping line items, items in a digital product. and items associated with types and reservations.
*/
@property(nonatomic) NSInteger quantity;

/**
Properties and data of inventory information for configured and bundled products. If product stock is managed, the data specifies out of stock behavior.
*/
@property(nonatomic) MOZURuntimeProductInventoryInfo *inventoryInfo;

/**
Dimensions of the packaged product.
*/
@property(nonatomic) MOZURuntimePackageMeasurements *measurements;

@end
