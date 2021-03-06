
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUOrderClient.h"
#import "MOZUOrderResource.h"


@interface MOZUOrderResource()
@property(readwrite, nonatomic) MOZUAPIContext * apiContext;
@end

@implementation MOZUOrderResource

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
Retrieves a list of orders according to any specified filter criteria and sort options.
@param filter A set of filter expressions representing the search parameters for a query: eq=equals, ne=not equals, gt=greater than, lt = less than or equals, gt = greater than or equals, lt = less than or equals, sw = starts with, or cont = contains. Optional.
@param pageSize The number of results to display on each page when creating paged results from a query. The maximum value is 200.
@param q A list of order search terms (not phrases) to use in the query when searching across order number and the name or email of the billing contact. When entering, separate multiple search terms with a space character.
@param qLimit The maximum number of search results to return in the response. You can limit any range between 1-100.
@param responseFields Use this field to include those fields which are not included by default.
@param sortBy 
@param startIndex 
*/

- (void)ordersWithStartIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter q:(NSString *)q qLimit:(NSNumber *)qLimit responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUOrderCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUOrderClient clientForGetOrdersOperationWithStartIndex:startIndex pageSize:pageSize sortBy:sortBy filter:filter q:q qLimit:qLimit responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Retrieves the actions available to perform for an order based on its current status.
@param orderId Unique identifier of the order.
*/

- (void)availableActionsWithOrderId:(NSString *)orderId completionHandler:(void(^)(NSArray *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUOrderClient clientForGetAvailableActionsOperationWithOrderId:orderId];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Retrieves an order for the purpose of splitting it into multiple taxable orders in order to fulfill the order in multiple locations.
@param orderId Unique identifier of the order.
*/

- (void)taxableOrdersWithOrderId:(NSString *)orderId completionHandler:(void(^)(NSArray<MOZUPricingTaxableOrder> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUOrderClient clientForGetTaxableOrdersOperationWithOrderId:orderId];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Retrieves the details of an order specified by the order ID.
@param draft If true, retrieve the draft version of the order, which might include uncommitted changes to the order or its components.
@param orderId Unique identifier of the order.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)orderWithOrderId:(NSString *)orderId draft:(NSNumber *)draft responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUOrder *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUOrderClient clientForGetOrderOperationWithOrderId:orderId draft:draft responseFields:responseFields];
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
Creates a new order from an existing cart when the customer chooses to proceed to checkout.
@param cartId Identifier of the cart to delete.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)createOrderFromCartWithCartId:(NSString *)cartId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUOrder *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUOrderClient clientForCreateOrderFromCartOperationWithCartId:cartId responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Creates a new order for no-cart quick-ordering scenarios.
@param body Properties of an order, including its components.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)createOrderWithBody:(MOZUOrder *)body responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUOrder *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUOrderClient clientForCreateOrderOperationWithBody:body responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Perform the specified action for an order. The actions you can perform depend on the current status of the order.
@param body The action to perform for the order.
@param orderId Unique identifier of the order.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)performOrderActionWithBody:(MOZUOrderAction *)body orderId:(NSString *)orderId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUOrder *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUOrderClient clientForPerformOrderActionOperationWithBody:body orderId:orderId responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

/**
commerce-orders Put ProcessDigitalWallet description DOCUMENT_HERE 
@param body Mozu.CommerceRuntime.Contracts.Orders.DigitalWallet ApiType DOCUMENT_HERE 
@param digitalWalletType 
@param orderId Unique identifier of the order.
@param responseFields A list or array of fields returned for a call. These fields may be customized and may be used for various types of data calls in Mozu. For example, responseFields are returned for retrieving or updating attributes, carts, and messages in Mozu.
*/

- (void)processDigitalWalletWithBody:(MOZUDigitalWallet *)body orderId:(NSString *)orderId digitalWalletType:(NSString *)digitalWalletType responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUOrder *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUOrderClient clientForProcessDigitalWalletOperationWithBody:body orderId:orderId digitalWalletType:digitalWalletType responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Update the properties of a discount applied to an order.
@param body Properties of all applied discounts for an associated cart, order, or product. 
@param discountId Unique identifier of the discount. System-supplied and read only.
@param orderId Unique identifier of the order.
@param responseFields Use this field to include those fields which are not included by default.
@param updateMode Specifies whether to update the original order, update the order in draft mode, or update the order in draft mode and then commit the changes to the original. Draft mode enables users to make incremental order changes before committing the changes to the original order. Valid values are "ApplyToOriginal," "ApplyToDraft," or "ApplyAndCommit."
@param version System-supplied integer that represents the current version of the order, which prevents users from unintentionally overriding changes to the order. When a user performs an operation for a defined order, the system validates that the version of the updated order matches the version of the order on the server. After the operation completes successfully, the system increments the version number by one.
*/

- (void)updateOrderDiscountWithBody:(MOZUAppliedDiscount *)body orderId:(NSString *)orderId discountId:(NSInteger)discountId updateMode:(NSString *)updateMode version:(NSString *)version responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUOrder *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUOrderClient clientForUpdateOrderDiscountOperationWithBody:body orderId:orderId discountId:discountId updateMode:updateMode version:version responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Deletes the current draft version of the order, which also deletes any uncommitted changes made to the order in draft mode.
@param orderId Unique identifier of the order.
@param version Determines whether or not to check versioning of items for concurrency purposes.
*/

- (void)deleteOrderDraftWithOrderId:(NSString *)orderId version:(NSString *)version completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUOrderClient clientForDeleteOrderDraftOperationWithOrderId:orderId version:version];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}

/**
commerce-orders Put ResendOrderConfirmationEmail description DOCUMENT_HERE 
@param body The action to perform for the order.
@param orderId Unique identifier of the order.
*/

- (void)resendOrderConfirmationEmailWithBody:(MOZUOrderAction *)body orderId:(NSString *)orderId completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUOrderClient clientForResendOrderConfirmationEmailOperationWithBody:body orderId:orderId];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}

/**
Updates the user ID of the shopper who placed the order to the current user.
@param orderId Unique identifier of the order.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)changeOrderUserIdWithOrderId:(NSString *)orderId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUOrder *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUOrderClient clientForChangeOrderUserIdOperationWithOrderId:orderId responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Updates the specified order when additional order information, such as shipping or billing information, is modified during the checkout process.
@param body Properties of an order, including its components.
@param orderId Unique identifier of the order.
@param responseFields Use this field to include those fields which are not included by default.
@param updateMode Specifies whether to update the original order, update the order in draft mode, or update the order in draft mode and then commit the changes to the original. Draft mode enables users to make incremental order changes before committing the changes to the original order. Valid values are "ApplyToOriginal," "ApplyToDraft," or "ApplyAndCommit."
@param version System-supplied integer that represents the current version of the order, which prevents users from unintentionally overriding changes to the order. When a user performs an operation for a defined order, the system validates that the version of the updated order matches the version of the order on the server. After the operation completes successfully, the system increments the version number by one.
*/

- (void)updateOrderWithBody:(MOZUOrder *)body orderId:(NSString *)orderId updateMode:(NSString *)updateMode version:(NSString *)version responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUOrder *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUOrderClient clientForUpdateOrderOperationWithBody:body orderId:orderId updateMode:updateMode version:version responseFields:responseFields];
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



@end