/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUURLComponents.h"

@interface MOZUAssignedDiscountURLComponents : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Resource Url Components for getAssignedDiscounts
@param couponSetCode The unique identifier of the coupon set.
*/
+ (MOZUURLComponents *)URLComponentsForGetAssignedDiscountsOperationWithCouponSetCode:(NSString *)couponSetCode;


//
#pragma mark -
#pragma mark POST Operations
#pragma mark -
//

/**
Resource Url Components for assignDiscount
@param couponSetCode The unique identifier of the coupon set.
*/
+ (MOZUURLComponents *)URLComponentsForAssignDiscountOperationWithCouponSetCode:(NSString *)couponSetCode;


//
#pragma mark -
#pragma mark PUT Operations
#pragma mark -
//


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Resource Url Components for unAssignDiscount
@param couponSetCode The unique identifier of the coupon set.
@param discountId discountId parameter description DOCUMENT_HERE 
*/
+ (MOZUURLComponents *)URLComponentsForUnAssignDiscountOperationWithCouponSetCode:(NSString *)couponSetCode discountId:(NSInteger)discountId;



@end