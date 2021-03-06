
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUInStockNotificationSubscriptionClient.h"
#import "MOZUInStockNotificationSubscriptionResource.h"


@interface MOZUInStockNotificationSubscriptionResource()
@property(readwrite, nonatomic) MOZUAPIContext * apiContext;
@end

@implementation MOZUInStockNotificationSubscriptionResource

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
Retrieves a list of in-stock notification subscriptions.
@param filter A set of expressions that consist of a field, operator, and value and represent search parameter syntax when filtering results of a query. Valid operators include equals (eq), does not equal (ne), greater than (gt), less than (lt), greater than or equal to (ge), less than or equal to (le), starts with (sw), or contains (cont). For example - "filter=IsDisplayed+eq+true"
@param pageSize The number of results to display on each page when creating paged results from a query. The maximum value is 200.
@param responseFields Use this field to include those fields which are not included by default.
@param sortBy The property by which to sort results and whether the results appear in ascending (a-z) order, represented by ASC or in descending (z-a) order, represented by DESC. The sortBy parameter follows an available property. For example: "sortBy=productCode+asc"
@param startIndex When creating paged results from a query, this value indicates the zero-based offset in the complete result set where the returned entities begin. For example, with a PageSize of 25, to get the 51st through the 75th items, use startIndex=3.
*/

- (void)inStockNotificationSubscriptionsWithStartIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUInStockNotificationSubscriptionCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUInStockNotificationSubscriptionClient clientForGetInStockNotificationSubscriptionsOperationWithStartIndex:startIndex pageSize:pageSize sortBy:sortBy filter:filter responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Retrieves the details of a subscription that sends a push notification when a product is available in a site's active stock.
@param identifier Unique identifier of the customer segment to retrieve.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)inStockNotificationSubscriptionWithIdentifier:(NSInteger)identifier responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUInStockNotificationSubscription *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUInStockNotificationSubscriptionClient clientForGetInStockNotificationSubscriptionOperationWithIdentifier:identifier responseFields:responseFields];
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
Creates a new subscription that notifies the customer when the product specified in the request is available in the active inventory of the defined location.
@param body Properties of a push notification to which the shopper subscribes. This notification sends the shopper an alert when a new product or a product previously out of stock becomes available in the specified location's active product inventory.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)addInStockNotificationSubscriptionWithBody:(MOZUInStockNotificationSubscription *)body responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUInStockNotificationSubscription *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUInStockNotificationSubscriptionClient clientForAddInStockNotificationSubscriptionOperationWithBody:body responseFields:responseFields];
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


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Deletes a subscription for a customer in-stock notification.
@param identifier Unique identifier of the customer segment to retrieve.
*/

- (void)deleteInStockNotificationSubscriptionWithIdentifier:(NSInteger)identifier completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUInStockNotificationSubscriptionClient clientForDeleteInStockNotificationSubscriptionOperationWithIdentifier:identifier];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}



@end