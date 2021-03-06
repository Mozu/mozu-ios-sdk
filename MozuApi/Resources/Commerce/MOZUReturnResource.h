
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
#import "MOZUAPIContext.h"

#import "MOZUReturnItemCollection.h"
#import "MOZUReturnItem.h"
#import "MOZUReturn.h"
#import "MOZUReturnCollection.h"
#import "MOZUPaymentAction.h"
#import "MOZUReasonCollection.h"
#import "MOZUPaymentCollection.h"
#import "MOZUPayment.h"
#import "MOZUReturnAction.h"


@interface MOZUReturnResource : NSObject


@property(readonly, nonatomic) MOZUAPIContext * apiContext;

-(id)initWithAPIContext:(MOZUAPIContext *)apiContext;

-(id)cloneWithAPIContextModification:(MOZUAPIContextModificationBlock)apiContextModification;

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieves a list of all returns according to any filter and sort criteria.
@param filter A set of expressions that consist of a field, operator, and value and represent search parameter syntax when filtering results of a query. Valid operators include equals (eq), does not equal (ne), greater than (gt), less than (lt), greater than or equal to (ge), less than or equal to (le), starts with (sw), or contains (cont). For example - "filter=IsDisplayed+eq+true"
@param pageSize The number of results to display on each page when creating paged results from a query. The maximum value is 200.
@param responseFields Use this field to include those fields which are not included by default.
@param sortBy The property by which to sort results and whether the results appear in ascending (a-z) order, represented by ASC or in descending (z-a) order, represented by DESC. The sortBy parameter follows an available property. For example: "sortBy=productCode+asc"
@param startIndex When creating paged results from a query, this value indicates the zero-based offset in the complete result set where the returned entities begin. For example, with a PageSize of 25, to get the 51st through the 75th items, use startIndex=3.
*/

- (void)returnsWithStartIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUReturnCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Retrieves a list of the actions available to perform for the specified return based on its current state.
@param returnId Unique identifier of the return whose items you want to get.
*/

- (void)availableReturnActionsWithReturnId:(NSString *)returnId completionHandler:(void(^)(NSArray *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Retrieves the details of a single return item.
@param responseFields Use this field to include those fields which are not included by default.
@param returnId Unique identifier of the return whose items you want to get.
@param returnItemId Unique identifier of the return item whose details you want to get.
*/

- (void)returnItemWithReturnId:(NSString *)returnId returnItemId:(NSString *)returnItemId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUReturnItem *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Retrieves the details of all return items in an order.
@param responseFields Use this field to include those fields which are not included by default.
@param returnId Unique identifier of the return whose items you want to get.
*/

- (void)returnItemsWithReturnId:(NSString *)returnId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUReturnItemCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Retrieves a list of the payment actions available to perform for the specified return when a return results in a refund to the customer.
@param paymentId Unique identifier of the payment for which to perform the action.
@param returnId Unique identifier of the return whose items you want to get.
*/

- (void)availablePaymentActionsForReturnWithReturnId:(NSString *)returnId paymentId:(NSString *)paymentId completionHandler:(void(^)(NSArray *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Retrieves the details of a payment submitted as part of a refund associated with a customer return.
@param paymentId Unique identifier of the payment for which to perform the action.
@param responseFields Use this field to include those fields which are not included by default.
@param returnId Unique identifier of the return whose items you want to get.
*/

- (void)paymentWithReturnId:(NSString *)returnId paymentId:(NSString *)paymentId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUPayment *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Retrieves a list of all payments submitted as part of a refund associated with a customer return.
@param responseFields Use this field to include those fields which are not included by default.
@param returnId Unique identifier of the return whose items you want to get.
*/

- (void)paymentsWithReturnId:(NSString *)returnId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUPaymentCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Retrieves a list of properties for the specified return.
@param responseFields Use this field to include those fields which are not included by default.
@param returnId Unique identifier of the return whose items you want to get.
*/

- (void)returnWithReturnId:(NSString *)returnId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUReturn *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
commerce-returns Get GetReasons description DOCUMENT_HERE 
@param responseFields A list or array of fields returned for a call. These fields may be customized and may be used for various types of data calls in Mozu. For example, responseFields are returned for retrieving or updating attributes, carts, and messages in Mozu.
*/

- (void)reasonsWithResponseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUReasonCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

/**
Creates a return for previously fulfilled items. Each return must either be associated with an original order or a product definition to represent each returned item.
@param body Properties of a return of one or more previously fulfilled items.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)createReturnWithBody:(MOZUReturn *)body responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUReturn *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Adds a return item to the return.
@param body Properties of a previously fulfilled item associated with a return.
@param responseFields Use this field to include those fields which are not included by default.
@param returnId Unique identifier of the return whose items you want to get.
*/

- (void)createReturnItemWithBody:(MOZUReturnItem *)body returnId:(NSString *)returnId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUReturn *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Updates a refund payment associated with a customer return by performing the specified action.
@param body Properties of the payment action performed for an order.
@param paymentId Unique identifier of the payment for which to perform the action.
@param responseFields Use this field to include those fields which are not included by default.
@param returnId Unique identifier of the return whose items you want to get.
*/

- (void)performPaymentActionForReturnWithBody:(MOZUPaymentAction *)body returnId:(NSString *)returnId paymentId:(NSString *)paymentId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUReturn *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Creates a new payment for a return that results in a refund to the customer.
@param body Properties of the payment action performed for an order.
@param responseFields Use this field to include those fields which are not included by default.
@param returnId Unique identifier of the return whose items you want to get.
*/

- (void)createPaymentActionForReturnWithBody:(MOZUPaymentAction *)body returnId:(NSString *)returnId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUReturn *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Updates the return by performing the action specified in the request.
@param body Properties of an action a user can perform for a return.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)performReturnActionsWithBody:(MOZUReturnAction *)body responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUReturnCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

/**
Updates one or more properties of a return for items previously shipped in a completed order.
@param body Properties of a return of one or more previously fulfilled items.
@param responseFields Use this field to include those fields which are not included by default.
@param returnId Unique identifier of the return whose items you want to get.
*/

- (void)updateReturnWithBody:(MOZUReturn *)body returnId:(NSString *)returnId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUReturn *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
commerce-returns Put ResendReturnEmail description DOCUMENT_HERE 
@param body Properties of an action a user can perform for a return.
*/

- (void)resendReturnEmailWithBody:(MOZUReturnAction *)body completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Removes a particular order item from the order of the current shopper.
@param returnId Unique identifier of the return whose items you want to get.
@param returnItemId Unique identifier of the return item whose details you want to get.
*/

- (void)deleteOrderItemWithReturnId:(NSString *)returnId returnItemId:(NSString *)returnItemId completionHandler:(void(^)(MOZUReturn *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Deletes the return specified in the request.
@param returnId Unique identifier of the return whose items you want to get.
*/

- (void)deleteReturnWithReturnId:(NSString *)returnId completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
;


@end