
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "MOZUAuditInfo.h"
#import "MOZUChangeMessage.h"
#import "MOZUPickupItem.h"



@protocol MOZUPickup
@end


/**
	Properties of an in-store pickup defined to fulfill items in an order.
*/
@interface MOZUPickup : JSONModel<MOZUPickup>

/**
Available actions you can complete for an order. These actions may differ depending on the status of the order, such as actions required to enter a payment, return of a package, and fulfillment of a shipment.
*/
@property(nonatomic) NSArray *availableActions;

/**
The specific code that represents pickup.
*/
@property(nonatomic) NSString * code;

/**
Date and time when a shipment completes fulfillment by delivery to a customer's physical address, picked up by a customer at a store, or delivered digitally for downloadable products.
*/
@property(nonatomic) NSDate * fulfillmentDate;

/**
The code that identifies the location used to fulfill the cart/cart item or order/order item. This code can include physical store locations for in-store pickup, warehouse locations providing the products for shipment, or the location for the digital file(s).
*/
@property(nonatomic) NSString * fulfillmentLocationCode;

/**
Unique identifier of the source product property. For a product field it will be the name of the field. For a product attribute it will be the Attribute FQN. 
*/
@property(nonatomic) NSString * id;

/**
The current status of an object. This status is specific to the object including payment (New, Authorized, Captured, Declined, Failed, Voided, Credited, CheckRequested, or RolledBack), discount (Active, Scheduled, or Expired), returns (ReturnAuthorized), tenant, package (Fulfilled or NotFulfilled), application, master and product catalogs, orders (Pending, Submitted, Processing, Pending Review, Closed, or Canceled), and order validation results (Pass, Fail, Error, or Review).
*/
@property(nonatomic) NSString * status;

/**
Identifier and datetime stamp information recorded when a user or application creates, updates, or deletes a resource entity. This value is system-supplied and read-only.
*/
@property(nonatomic) MOZUAuditInfo *auditInfo;

/**
Collection (list or paged) of change messages logged for each modification made by a shopper to their carts, wishlists, orders, package, payment, pickup, and returns. Change log messages are system-supplied based on shopper actions and read only.
*/
@property(nonatomic) NSArray<MOZUChangeMessage> *changeMessages;

/**
An array list of objects in the returned collection.
*/
@property(nonatomic) NSArray<MOZUPickupItem> *items;

@end

