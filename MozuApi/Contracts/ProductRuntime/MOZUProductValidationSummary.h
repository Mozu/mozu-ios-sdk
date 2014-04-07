
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
#import "MOZUBundledProductSummary.h"
#import "MOZURuntimeCategory.h"
#import "MOZUProductImage.h"
#import "MOZURuntimeProductInventoryInfo.h"
#import "MOZURuntimePackageMeasurements.h"
#import "MOZURuntimeProductPrice.h"
#import "MOZURuntimeProductPricingBehaviorInfo.h"
#import "MOZURuntimeProductProperty.h"
#import "MOZUProductPurchasableState.h"



@protocol MOZUProductValidationSummary
@end


/**
	Summary list of the product validation in a storefront, including options selected by the shopper.
*/
@interface MOZUProductValidationSummary : JSONModel<MOZUProductValidationSummary>

/**
The descriptive brief product name.
*/
@property(nonatomic) NSString * productName;

/**
Brief description of the product typically used when the product is displayed in a list or in search results.
*/
@property(nonatomic) NSString * productShortDescription;

@property(nonatomic) NSString * productUsage;

@property(nonatomic) NSString * upc;

/**
Merchant-created code associated with a specific product variation. Variation product codes maintain an association with the base product code.
*/
@property(nonatomic) NSString * variationProductCode;

@property(nonatomic) NSArray *fulfillmentTypesSupported;

@property(nonatomic) NSNumber * isPackagedStandAlone;

/**
If true, the entity is subject to tax based on the relevant tax rate.
*/
@property(nonatomic) BOOL isTaxable;

@property(nonatomic) NSString * mfgPartNumber;

/**
Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
*/
@property(nonatomic) NSString * productCode;

@property(nonatomic) NSArray<MOZUBundledProductSummary> *bundledProducts;

/**
The list of product categories for the storefront.
*/
@property(nonatomic) NSArray<MOZURuntimeCategory> *categories;

/**
The image configured for the product on the storefront.
*/
@property(nonatomic) MOZUProductImage *image;

/**
Properties of the active inventory level of the associated product.
*/
@property(nonatomic) MOZURuntimeProductInventoryInfo *inventoryInfo;

/**
Dimensions of the packaged product.
*/
@property(nonatomic) MOZURuntimePackageMeasurements *measurements;

/**
Price that the merchant intends to sell the product which is not necessarily the list price. This is the price the merchant intends to sell the product if no sale price is present.
*/
@property(nonatomic) MOZURuntimeProductPrice *price;

@property(nonatomic) MOZURuntimeProductPricingBehaviorInfo *pricingBehavior;

/**
The list of product properties configured in product admin.
*/
@property(nonatomic) NSArray<MOZURuntimeProductProperty> *properties;

/**
The current state of the product and whether or not it is available for purchasing. If the product is not eligible for purchase, the validation message is included.
*/
@property(nonatomic) MOZUProductPurchasableState *purchasableState;

@end

