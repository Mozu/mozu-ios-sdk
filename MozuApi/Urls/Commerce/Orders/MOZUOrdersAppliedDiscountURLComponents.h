/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUURLComponents.h"

@interface MOZUOrdersAppliedDiscountURLComponents : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//


//
#pragma mark -
#pragma mark POST Operations
#pragma mark -
//


//
#pragma mark -
#pragma mark PUT Operations
#pragma mark -
//

/**
Resource Url Components for applyCoupon
@param orderId Unique identifier of the order to associate the coupon. System-supplied and read-only.
@param couponCode Alphanumeric code associated with the coupon or promotion that results in a discounted price.
@param updateMode Specifies whether to apply the coupon by updating the original order, updating the order in draft mode, or updating the order in draft mode and then commit the changes to the original. Draft mode enables users to make incremental order changes before committing the changes to the original order. Valid values are "ApplyToOriginal," "ApplyToDraft," or "ApplyAndCommit."
@param version System-supplied integer that represents the current version of the order, which prevents users from unintentionally overriding changes to the order. When a user performs an operation for a defined order, the system validates that the version of the updated order matches the version of the order on the server. After the operation completes successfully, the system increments the version number by one.
*/
+ (MOZUURLComponents *)URLComponentsForApplyCouponOperationWithOrderId:(NSString *)orderId couponCode:(NSString *)couponCode updateMode:(NSString *)updateMode version:(NSString *)version;


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Resource Url Components for removeCoupon
@param orderId Unique identifier of the order with the coupon to remove.
@param couponCode Alphanumeric code associated with the coupon or promotion that results in a discounted price.
@param updateMode Specifies whether to remove the coupon by updating the original order, updating the order in draft mode, or updating the order in draft mode and then committing the changes to the original. Draft mode enables users to make incremental order changes before committing the changes to the original order. Valid values are "ApplyToOriginal," "ApplyToDraft," or "ApplyAndCommit."
@param version System-supplied integer that represents the current version of the order, which prevents users from unintentionally overriding changes to the order. When a user performs an operation for a defined order, the system validates that the version of the updated order matches the version of the order on the server. After the operation completes successfully, the system increments the version number by one.
*/
+ (MOZUURLComponents *)URLComponentsForRemoveCouponOperationWithOrderId:(NSString *)orderId couponCode:(NSString *)couponCode updateMode:(NSString *)updateMode version:(NSString *)version;

/**
Resource Url Components for removeCoupons
@param orderId Unique identifier of the order with the coupons to remove.
@param updateMode Specifies whether to remove coupons by updating the original order, updating the order in draft mode, or updating the order in draft mode and then committing the changes to the original. Draft mode enables users to make incremental order changes before committing the changes to the original order. Valid values are "ApplyToOriginal," "ApplyToDraft," or "ApplyAndCommit."
@param version System-supplied integer that represents the current version of the order, which prevents users from unintentionally overriding changes to the order. When a user performs an operation for a defined order, the system validates that the version of the updated order matches the version of the order on the server. After the operation completes successfully, the system increments the version number by one.
*/
+ (MOZUURLComponents *)URLComponentsForRemoveCouponsOperationWithOrderId:(NSString *)orderId updateMode:(NSString *)updateMode version:(NSString *)version;



@end