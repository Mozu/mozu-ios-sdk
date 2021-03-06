/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUCartsAppliedDiscountURLComponents.h"

@implementation MOZUCartsAppliedDiscountURLComponents

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

+ (MOZUURLComponents *)URLComponentsForApplyCouponOperationWithCartId:(NSString *)cartId couponCode:(NSString *)couponCode responseFields:(NSString *)responseFields {
	NSString *template = @"/api/commerce/carts/{cartId}/coupons/{couponCode}?responseFields={responseFields}";
	NSDictionary *params = @{
		@"cartId" : cartId,
		@"couponCode" : couponCode,
		@"responseFields" : responseFields ? responseFields : @"",
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

+ (MOZUURLComponents *)URLComponentsForRemoveCouponsOperationWithCartId:(NSString *)cartId {
	NSString *template = @"/api/commerce/carts/{cartId}/coupons";
	NSDictionary *params = @{
		@"cartId" : cartId,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+ (MOZUURLComponents *)URLComponentsForRemoveCouponOperationWithCartId:(NSString *)cartId couponCode:(NSString *)couponCode {
	NSString *template = @"/api/commerce/carts/{cartId}/coupons/{couponcode}";
	NSDictionary *params = @{
		@"cartId" : cartId,
		@"couponCode" : couponCode,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}



@end