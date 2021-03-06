
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
#import "MOZUCoupon.h"
#import "MOZUCouponCollection.h"


@interface MOZUCouponClient : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
couponsets-coupons Get GetCoupon description DOCUMENT_HERE 
@param couponCode Code associated with the coupon to remove from the cart.
@param couponSetCode 
@param includeCounts 
@param responseFields A list or array of fields returned for a call. These fields may be customized and may be used for various types of data calls in Mozu. For example, responseFields are returned for retrieving or updating attributes, carts, and messages in Mozu.
*/

+ (MOZUClient *)clientForGetCouponOperationWithCouponSetCode:(NSString *)couponSetCode couponCode:(NSString *)couponCode includeCounts:(NSNumber *)includeCounts responseFields:(NSString *)responseFields;

/**
couponsets-coupons Get GetCoupons description DOCUMENT_HERE 
@param couponSetCode 
@param filter A set of filter expressions representing the search parameters for a query: eq=equals, ne=not equals, gt=greater than, lt = less than or equals, gt = greater than or equals, lt = less than or equals, sw = starts with, or cont = contains. Optional.
@param includeCounts 
@param pageSize The number of results to display on each page when creating paged results from a query. The amount is divided and displayed on the `pageCount `amount of pages. The default is 20 and maximum value is 200 per page.
@param responseFields A list or array of fields returned for a call. These fields may be customized and may be used for various types of data calls in Mozu. For example, responseFields are returned for retrieving or updating attributes, carts, and messages in Mozu.
@param sortBy The element to sort the results by and the channel in which the results appear. Either ascending (a-z) or descending (z-a) channel. Optional.
@param startIndex When creating paged results from a query, this value indicates the zero-based offset in the complete result set where the returned entities begin. For example, with a `pageSize `of 25, to get the 51st through the 75th items, use `startIndex=3`.
*/

+ (MOZUClient *)clientForGetCouponsOperationWithCouponSetCode:(NSString *)couponSetCode startIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter includeCounts:(NSNumber *)includeCounts responseFields:(NSString *)responseFields;


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

/**
couponsets-coupons Post AddCoupons description DOCUMENT_HERE 
@param body Mozu.ProductAdmin.Contracts.Coupon ApiType DOCUMENT_HERE 
@param couponSetCode 
*/

+ (MOZUClient *)clientForAddCouponsOperationWithBody:(NSArray<MOZUCoupon> *)body couponSetCode:(NSString *)couponSetCode;

/**
couponsets-coupons Post DeleteCoupons description DOCUMENT_HERE 
@param body 
@param couponSetCode 
*/

+ (MOZUClient *)clientForDeleteCouponsOperationWithBody:(NSArray *)body couponSetCode:(NSString *)couponSetCode;


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
couponsets-coupons Delete DeleteCoupon description DOCUMENT_HERE 
@param couponCode Code associated with the coupon to remove from the cart.
@param couponSetCode 
*/

+ (MOZUClient *)clientForDeleteCouponOperationWithCouponSetCode:(NSString *)couponSetCode couponCode:(NSString *)couponCode;



@end