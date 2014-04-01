
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



@protocol MOZUCommerceUnitPrice
@end


/**
	Pricing details for a product in a cart or an order, including the original price, discount amount, and final price.
*/
@interface MOZUCommerceUnitPrice : JSONModel<MOZUCommerceUnitPrice>

/**
The calculated amount of the discount to apply.
*/
@property(nonatomic) NSNumber * discountAmount;

/**
Represents the total price of the line item extended to the shopper. This begins with the Unit Price, then uses any of the following prices if they are defined, in the following order: Override Amount, Sale Amount, List Amount.
*/
@property(nonatomic) NSNumber * extendedAmount;

/**
The price the item is listed for in the storefront.
*/
@property(nonatomic) NSNumber * listAmount;

/**
The override price of the item set by the merchant for a given order.
*/
@property(nonatomic) NSNumber * overrideAmount;

/**
The sale price set for the item.
*/
@property(nonatomic) NSNumber * saleAmount;

@end

