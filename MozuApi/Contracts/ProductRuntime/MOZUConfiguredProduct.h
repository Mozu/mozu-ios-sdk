
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
#import "MOZURuntimeDiscount.h"
#import "MOZURuntimeProductInventoryInfo.h"
#import "MOZURuntimePackageMeasurements.h"
#import "MOZURuntimeProductOption.h"
#import "MOZURuntimeProductPrice.h"
#import "MOZUProductPriceRange.h"
#import "MOZUProductPurchasableState.h"



@protocol MOZUConfiguredProduct
@end


/**
	Properties of a product configuration with shopper-selected options.
*/
@interface MOZUConfiguredProduct : JSONModel<MOZUConfiguredProduct>

/**
List of supported types of fulfillment  for the product or variation. The types include direct ship, in-store pickup, or both. 
*/
@property(nonatomic) NSArray *fulfillmentTypesSupported;

/**
The manufacturer's part number for the product.
*/
@property(nonatomic) NSString * mfgPartNumber;

/**
Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
*/
@property(nonatomic) NSString * productCode;

/**
The universal product code (UPC) is the barcode defined for the product. The UPC is unique across all sales channels. 
*/
@property(nonatomic) NSString * upc;

/**
Merchant-created code associated with a specific product variation. Variation product codes maintain an association with the base product code.
*/
@property(nonatomic) NSString * variationProductCode;

/**
List of shipping discounts that can be applied to the configured product. These discounts are calculated and updated as shoppers add content to their cart and continue checkout steps to order submission.
*/
@property(nonatomic) NSArray<MOZURuntimeDiscount> *availableShippingDiscounts;

/**
Properties and data of inventory information for configured and bundled products. If product stock is managed, the data specifies out of stock behavior.
*/
@property(nonatomic) MOZURuntimeProductInventoryInfo *inventoryInfo;

/**
Dimensions of the packaged product.
*/
@property(nonatomic) MOZURuntimePackageMeasurements *measurements;

/**
List of option attributes configured for an object. These values are associated and used by products, product bundles, and product types.
*/
@property(nonatomic) NSArray<MOZURuntimeProductOption> *options;

/**
Unit price that the tenant intends to sell the product if no sale price is set.
*/
@property(nonatomic) MOZURuntimeProductPrice *price;

/**
For products with options that vary the cost of the product, the range between lowest and highest possible price of the product based on the current selection of options.
*/
@property(nonatomic) MOZUProductPriceRange *priceRange;

/**
The current state of the configured product determines whether or not the product is eligible for purchase. Products with options are only purchasable if the shopper has selected all required options. If the product is not ready for purchase, a message lists missing options that are required.
*/
@property(nonatomic) MOZUProductPurchasableState *purchasableState;

@end

