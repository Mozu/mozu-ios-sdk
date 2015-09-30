
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
#import "MOZUAdminCustomerSegment.h"
#import "MOZUCategoryDiscountCondition.h"
#import "MOZUProductDiscountCondition.h"



@protocol MOZUDiscountCondition
@end


/**
	Properties of the conditions that must be met for a discount to apply to an order.
*/
@interface MOZUDiscountCondition : JSONModel<MOZUDiscountCondition>

/**
Code of a discount coupon. This code can be used by a shopper when a coupon code is required to earn the associated discount on a purchase.
*/
@property(nonatomic) NSString * couponCode;

/**
Date and time in UTC format when a discount, credit, wish list, or cart expires. An expired discount no longer can be redeemed. An expired wish list is no longer available. An expired credit can no longer be redeemed for a purchase. Acart becomes inactive and expired based on a system-calculated interval. For example, if an anonymous shopper has 14 days of inactivity, the cart is considered abandoned after that period of inactivity. System-supplied and read-only.
*/
@property(nonatomic) NSDate * expirationDate;

/**
List of payment types that trigger this discount to be valid.
*/
@property(nonatomic) NSArray *includedPaymentWorkflows;

/**
The maximum number of times the discount can be redeemed.
*/
@property(nonatomic) NSNumber * maxRedemptionCount;

/**
This pecifies the minimum amount that must be purchased in the combined categories defined in IncludedCategories. This amount is calculated before discounting and it is not used if IncludedCategories is empty.
*/
@property(nonatomic) NSNumber * minimumCategorySubtotalBeforeDiscounts;

/**
The minimum customer lifetime value amount required to redeem this discount.
*/
@property(nonatomic) NSNumber * minimumLifetimeValueAmount;

/**
The minimum order amount required to redeem this discount.
*/
@property(nonatomic) NSNumber * minimumOrderAmount;

/**
This specifies the minimum quantity of products in the categories specified in IncludedCategories, which must be purchased to qualify for the associated discount. This defaults to 1 if  null, and IncludedCategories has values.
*/
@property(nonatomic) NSNumber * minimumQuantityProductsRequiredInCategories;

/**
This specifies the minimum quantity of products in the specified IncludedProducts that must be purchased to qualify for the associated discount. This defaults to 1 if  null, and IncludedProducts has values.
*/
@property(nonatomic) NSNumber * minimumQuantityRequiredProducts;

/**
If true, only authenticated users can redeem the discount. If false, anonymous users can redeem the discount.
*/
@property(nonatomic) BOOL requiresAuthenticatedUser;

/**
If true, redemption of this discount requires entry of a coupon code.
*/
@property(nonatomic) BOOL requiresCoupon;

/**
The earliest date and time this discount can be redeemed.
*/
@property(nonatomic) NSDate * startDate;

/**
List of customer segments associated with the discount. Shoppers who are members of an associated customer segment can redeem this discount.
*/
@property(nonatomic) NSArray<MOZUAdminCustomerSegment> *customerSegments;

/**
List of the product categories that are not eligible for the discount.
*/
@property(nonatomic) NSArray<MOZUCategoryDiscountCondition> *excludedCategories;

/**
List of products that are not eligible for the discount.
*/
@property(nonatomic) NSArray<MOZUProductDiscountCondition> *excludedProducts;

/**
List of product categories that are eligible for the discount.
*/
@property(nonatomic) NSArray<MOZUCategoryDiscountCondition> *includedCategories;

/**
List of products that are eligible for the discount.
*/
@property(nonatomic) NSArray<MOZUProductDiscountCondition> *includedProducts;

@end

