
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
#import "MOZUReturnItem.h"
#import "MOZUOrderNote.h"
#import "MOZUPackage.h"
#import "MOZUPayment.h"



@protocol MOZUReturn
@end


/**
	Properties of a return of one or more previously fulfilled items.
*/
@interface MOZUReturn : JSONModel<MOZUReturn>

/**
Unique identifier of the web session in which the cart, order, return, or wish list was created or last modified.
*/
@property(nonatomic) NSString * webSessionId;

/**
Available actions you can complete for an order. These actions may differ depending on the status of the order, such as actions required to enter a payment, return of a package, and fulfillment of a shipment.
*/
@property(nonatomic) NSArray *availableActions;

/**
Code that identifies the channel associated with the site for the shopper's created shopping cart, order, and return.
*/
@property(nonatomic) NSString * channelCode;

/**
3-letter ISO 4217 standard global currency code. Currently, only "USD" (US Dollar) is supported.
*/
@property(nonatomic) NSString * currencyCode;

/**
Unique identifer of the customer account. This ID is used to associate numerous types of data and object with the customer account, including orders, returns, wish lists, and in-store credit.
*/
@property(nonatomic) NSNumber * customerAccountId;

/**
The type of customer interaction used to create this shopping cart. Possible values are Website, Call, Store, or Unknown.
*/
@property(nonatomic) NSString * customerInteractionType;

/**
Unique identifier of the source product property. For a product field it will be the name of the field. For a product attribute it will be the Attribute FQN. 
*/
@property(nonatomic) NSString * id;

/**
The unique, user-defined code that identifies a location. This location can be the location where the order was entered, location for newly in-stock products, and where products are returned.
*/
@property(nonatomic) NSString * locationCode;

/**
The total value of the return to the merchant for accounting purposes. This total represents the combined product loss and shipping loss associated with the return.
*/
@property(nonatomic) NSNumber * lossTotal;

/**
If this return is associated with a previously completed order, the unique identifier of the original order.
*/
@property(nonatomic) NSString * originalOrderId;

/**
The total tax amount levied on the product loss amount.
*/
@property(nonatomic) NSNumber * productLossTaxTotal;

/**
The total value of the product returned to the merchant for accounting purposes, calculated by multiplying the cost of the item by its quantity returned.
*/
@property(nonatomic) NSNumber * productLossTotal;

/**
If a refund action was performed for this return, the total amount refunded to the shopper. The refund amount can differ from the sum of the price of the returned items.
*/
@property(nonatomic) NSNumber * refundAmount;

/**
A merchant-specific identifier used to sequentially order returns.
*/
@property(nonatomic) NSNumber * returnNumber;

/**
Unique identifier for the order created as a result of the return. If the return results in shipping a replacement item, the order includes shipment information for the replaced items. If the return results in a refund, the order includes payment transactions to credit the shopper.
*/
@property(nonatomic) NSString * returnOrderId;

/**
The type of return, which is "Refund" or "Replace".
*/
@property(nonatomic) NSString * returnType;

/**
The date by which a shopper must ship items associated with a return in an "awaiting items" state to the merchant.
*/
@property(nonatomic) NSDate * rmaDeadline;

/**
The total tax amount levied on the shipping loss amount.
*/
@property(nonatomic) NSNumber * shippingLossTaxTotal;

/**
The total value of shipping the returned product to the merchant for accounting purposes, calculated by multiplying the shipping cost of the item by its quantity returned.
*/
@property(nonatomic) NSNumber * shippingLossTotal;

/**
Unique identifier of the site.
*/
@property(nonatomic) NSNumber * siteId;

/**
The current status of an object. This status is specific to the object including payment (New, Authorized, Captured, Declined, Failed, Voided, Credited, CheckRequested, or RolledBack), discount (Active, Scheduled, or Expired), returns (ReturnAuthorized), tenant, package (Fulfilled or NotFulfilled), application, master and product catalogs, orders (Pending, Submitted, Processing, Pending Review, Closed, or Canceled), and order validation results (Pass, Fail, Error, or Review).
*/
@property(nonatomic) NSString * status;

/**
Unique identifier of the Mozu tenant.
*/
@property(nonatomic) NSNumber * tenantId;

/**
Unique identifier of the customer account (shopper or system user). System-supplied and read-only. If the shopper user is anonymous, the user ID represents a system-generated user ID string.
*/
@property(nonatomic) NSString * userId;

/**
Unique identifier of the customer visit in which the cart was created or last modified.
*/
@property(nonatomic) NSString * visitId;

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
@property(nonatomic) NSArray<MOZUReturnItem> *items;

/**
Paged list collection of note content for objects including customers, orders, and returns. 
*/
@property(nonatomic) NSArray<MOZUOrderNote> *notes;

/**
Array list of physical packages shipped for a specified order.
*/
@property(nonatomic) NSArray<MOZUPackage> *packages;

/**
Wrapper for a collection of payments associated with an order or return. An order can include a number of payments until the full total is covered. 
*/
@property(nonatomic) NSArray<MOZUPayment> *payments;

@end

