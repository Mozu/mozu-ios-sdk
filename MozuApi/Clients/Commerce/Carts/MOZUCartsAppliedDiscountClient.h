
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import <Foundation/Foundation.h>
#import "MOZUClient.h"
#import "MOZUCart.h"


@interface MOZUCartsAppliedDiscountClient : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

/**
Applies a defined coupon to the cart specified in the request.
@param cartId Identifier of the cart to delete.
@param couponCode Code associated with the coupon to remove from the cart.
@param responseFields Use this field to include those fields which are not included by default.
*/

+ (MOZUClient *)clientForApplyCouponOperationWithCartId:(NSString *)cartId couponCode:(NSString *)couponCode responseFields:(NSString *)responseFields;


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Removes one or more applied coupons from the cart specified in the request.
@param cartId Identifier of the cart to delete.
*/

+ (MOZUClient *)clientForRemoveCouponsOperationWithCartId:(NSString *)cartId;

/**
Removes an applied coupon from the cart specified in the request.
@param cartId Identifier of the cart to delete.
@param couponCode Code associated with the coupon to remove from the cart.
*/

+ (MOZUClient *)clientForRemoveCouponOperationWithCartId:(NSString *)cartId couponCode:(NSString *)couponCode;



@end