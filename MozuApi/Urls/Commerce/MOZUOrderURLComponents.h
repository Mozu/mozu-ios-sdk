/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUURLComponents.h"

@interface MOZUOrderURLComponents : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Resource Url Components for getOrders
@param startIndex 
@param pageSize The number of results to display on each page when creating paged results from a query. The maximum value is 200.
@param sortBy 
@param filter A set of expressions that consist of a field, operator, and value and represent search parameter syntax when filtering results of a query. You can filter an order's search results by any of its properties, including status, contact information, or total. Valid operators include equals (eq), does not equal (ne), greater than (gt), less than (lt), greater than or equal to (ge), less than or equal to (le), starts with (sw), or contains (cont). For example - "filter=Status+eq+Submitted"
@param q A list of order search terms to use in the query when searching across order number and the name or email of the billing contact. Separate multiple search terms with a space character.
@param qLimit The maximum number of search results to return in the response. You can limit any range between 1-100.
*/
+ (MOZUURLComponents *)URLComponentsForGetOrdersOperationWithStartIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter q:(NSString *)q qLimit:(NSNumber *)qLimit;

/**
Resource Url Components for getAvailableActions
@param orderId Unique identifier of the available order actions to get.
*/
+ (MOZUURLComponents *)URLComponentsForGetAvailableActionsOperationWithOrderId:(NSString *)orderId;

/**
Resource Url Components for getTaxableOrders
@param orderId 
*/
+ (MOZUURLComponents *)URLComponentsForGetTaxableOrdersOperationWithOrderId:(NSString *)orderId;

/**
Resource Url Components for getOrder
@param orderId Unique identifier of the order details to get.
@param draft If true, retrieve the draft version of the order, which might include uncommitted changes to the order or its components.
*/
+ (MOZUURLComponents *)URLComponentsForGetOrderOperationWithOrderId:(NSString *)orderId draft:(NSNumber *)draft;


//
#pragma mark -
#pragma mark POST Operations
#pragma mark -
//

/**
Resource Url Components for createOrder
*/
+ (MOZUURLComponents *)URLComponentsForCreateOrderOperation;

/**
Resource Url Components for createOrderFromCart
@param cartId Unique identifier of the cart. This is the original cart ID expressed as a GUID.
*/
+ (MOZUURLComponents *)URLComponentsForCreateOrderFromCartOperationWithCartId:(NSString *)cartId;

/**
Resource Url Components for performOrderAction
@param orderId Unique identifier of the order.
*/
+ (MOZUURLComponents *)URLComponentsForPerformOrderActionOperationWithOrderId:(NSString *)orderId;


//
#pragma mark -
#pragma mark PUT Operations
#pragma mark -
//

/**
Resource Url Components for updateOrderDiscount
@param orderId Unique identifier of the order discount. System-supplied and read only.
@param discountId Unique identifier of the discount. System-supplied and read only.
@param updateMode Specifies whether to modify the discount by updating the original order, updating the order in draft mode, or updating the order in draft mode and then committing the changes to the original. Draft mode enables users to make incremental order changes before committing the changes to the original order. Valid values are "ApplyToOriginal," "ApplyToDraft," or "ApplyAndCommit."
@param version System-supplied integer that represents the current version of the order, which prevents users from unintentionally overriding changes to the order. When a user performs an operation for a defined order, the system validates that the version of the updated order matches the version of the order on the server. After the operation completes successfully, the system increments the version number by one.
*/
+ (MOZUURLComponents *)URLComponentsForUpdateOrderDiscountOperationWithOrderId:(NSString *)orderId discountId:(NSInteger)discountId updateMode:(NSString *)updateMode version:(NSString *)version;

/**
Resource Url Components for deleteOrderDraft
@param orderId Unique identifier of the order associated with the draft to delete.
@param version If applicable, the version of the order draft to delete.
*/
+ (MOZUURLComponents *)URLComponentsForDeleteOrderDraftOperationWithOrderId:(NSString *)orderId version:(NSString *)version;

/**
Resource Url Components for changeOrderUserId
@param orderId Unique identifier of the order.
*/
+ (MOZUURLComponents *)URLComponentsForChangeOrderUserIdOperationWithOrderId:(NSString *)orderId;

/**
Resource Url Components for updateOrder
@param orderId Unique identifier of the order to update.
@param updateMode Specifies whether to update the original order, update the order in draft mode, or update the order in draft mode and then commit the changes to the original. Draft mode enables users to make incremental order changes before committing the changes to the original order. Valid values are "ApplyToOriginal," "ApplyToDraft," or "ApplyAndCommit."
@param version System-supplied integer that represents the current version of the order, which prevents users from unintentionally overriding changes to the order. When a user performs an operation for a defined order, the system validates that the version of the updated order matches the version of the order on the server. After the operation completes successfully, the system increments the version number by one.
*/
+ (MOZUURLComponents *)URLComponentsForUpdateOrderOperationWithOrderId:(NSString *)orderId updateMode:(NSString *)updateMode version:(NSString *)version;


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//



@end