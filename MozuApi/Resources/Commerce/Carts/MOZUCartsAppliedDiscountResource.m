
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUCartsAppliedDiscountClient.h"
#import "MOZUCartsAppliedDiscountResource.h"



@interface MOZUCartsAppliedDiscountResource()
@property(readwrite, nonatomic) MOZUAPIContext *apiContext;
@end


@implementation MOZUCartsAppliedDiscountResource


- (instancetype)initWithAPIContext:(MOZUAPIContext *)apiContext {
	if (self = [super init]) {
		self.apiContext = apiContext;
		return self;
	}
	else {
		return nil;
	}
}


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

@param cartId 
@param couponCode 
*/

- (void)applyCouponWithCartId:(NSString *)cartId couponCode:(NSString *)couponCode userClaims:(MOZUUserAuthTicket *)userClaims completionHandler:(void(^)(MOZUCart *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCartsAppliedDiscountClient clientForApplyCouponOperationWithCartId:cartId couponCode:couponCode userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**

@param cartId 
*/

- (void)removeCouponsWithCartId:(NSString *)cartId userClaims:(MOZUUserAuthTicket *)userClaims completionHandler:(void(^)(MOZUCart *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCartsAppliedDiscountClient clientForRemoveCouponsOperationWithCartId:cartId userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**

@param cartId 
@param couponCode 
*/

- (void)removeCouponWithCartId:(NSString *)cartId couponCode:(NSString *)couponCode userClaims:(MOZUUserAuthTicket *)userClaims completionHandler:(void(^)(MOZUCart *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCartsAppliedDiscountClient clientForRemoveCouponOperationWithCartId:cartId couponCode:couponCode userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}



@end