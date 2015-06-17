
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
#import "MOZUFulfillmentAction.h"
#import "MOZUOrder.h"


@interface MOZUFulfillmentActionClient : NSObject

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

/**
Sets the fulfillment action to "Ship" or "PickUp". To ship an order or prepare it for in-store pickup, the order must have a customer name, the "Open" or "OpenAndProcessing" status. To ship the order, it must also have the full shipping address and shipping method. Shipping all packages or picking up all pickups for an order will complete a paid order.
@param body Properties of an action to perform when fulfilling an item in an order, whether through in-store pickup or direct shipping.
@param orderId Unique identifier of the order.
@param responseFields A list or array of fields returned for a call. These fields may be customized and may be used for various types of data calls in Mozu. For example, responseFields are returned for retrieving or updating attributes, carts, and messages in Mozu.
*/

+ (MOZUClient *)clientForPerformFulfillmentActionOperationWithBody:(MOZUFulfillmentAction *)body orderId:(NSString *)orderId responseFields:(NSString *)responseFields;

/**
orders-fulfillment Post ResendPackageFulfillmentEmail description DOCUMENT_HERE 
@param body Properties of an action to perform when fulfilling an item in an order, whether through in-store pickup or direct shipping.
@param orderId Unique identifier of the order.
@param responseFields A list or array of fields returned for a call. These fields may be customized and may be used for various types of data calls in Mozu. For example, responseFields are returned for retrieving or updating attributes, carts, and messages in Mozu.
*/

+ (MOZUClient *)clientForResendPackageFulfillmentEmailOperationWithBody:(MOZUFulfillmentAction *)body orderId:(NSString *)orderId responseFields:(NSString *)responseFields;


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



@end