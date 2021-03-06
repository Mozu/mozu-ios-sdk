
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUCouponClient.h"
#import "MOZUCouponResource.h"


@interface MOZUCouponResource()
@property(readwrite, nonatomic) MOZUAPIContext * apiContext;
@end

@implementation MOZUCouponResource

-(id)initWithAPIContext:(MOZUAPIContext *)apiContext {
	if (self = [super init]) {
		self.apiContext = apiContext;
		return self;
	}
	else {
		return nil;
	}
}


-(id)cloneWithAPIContextModification:(MOZUAPIContextModificationBlock)apiContextModification {
	MOZUAPIContext* cloned = [self.apiContext cloneWith:apiContextModification];
	return [self initWithAPIContext:cloned];
}

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

- (void)couponWithCouponSetCode:(NSString *)couponSetCode couponCode:(NSString *)couponCode includeCounts:(NSNumber *)includeCounts responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUCoupon *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCouponClient clientForGetCouponOperationWithCouponSetCode:couponSetCode couponCode:couponCode includeCounts:includeCounts responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

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

- (void)couponsWithCouponSetCode:(NSString *)couponSetCode startIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter includeCounts:(NSNumber *)includeCounts responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUCouponCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCouponClient clientForGetCouponsOperationWithCouponSetCode:couponSetCode startIndex:startIndex pageSize:pageSize sortBy:sortBy filter:filter includeCounts:includeCounts responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}


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

- (void)addCouponsWithBody:(NSArray<MOZUCoupon> *)body couponSetCode:(NSString *)couponSetCode completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCouponClient clientForAddCouponsOperationWithBody:body couponSetCode:couponSetCode];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}

/**
couponsets-coupons Post DeleteCoupons description DOCUMENT_HERE 
@param body 
@param couponSetCode 
*/

- (void)deleteCouponsWithBody:(NSArray *)body couponSetCode:(NSString *)couponSetCode completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCouponClient clientForDeleteCouponsOperationWithBody:body couponSetCode:couponSetCode];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}


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

- (void)deleteCouponWithCouponSetCode:(NSString *)couponSetCode couponCode:(NSString *)couponCode completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCouponClient clientForDeleteCouponOperationWithCouponSetCode:couponSetCode couponCode:couponCode];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}



@end