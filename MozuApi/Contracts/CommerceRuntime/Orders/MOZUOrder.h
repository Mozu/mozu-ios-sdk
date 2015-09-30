
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
#import "MOZUAdjustment.h"
#import "MOZUOrderAttribute.h"
#import "MOZUAuditInfo.h"
#import "MOZUBillingInfo.h"
#import "MOZUChangeMessage.h"
#import "MOZUDigitalPackage.h"
#import "MOZUExtendedProperty.h"
#import "MOZUFulfillmentInfo.h"
#import "MOZUAppliedDiscount.h"
#import "MOZUInvalidCoupon.h"
#import "MOZUOrderItem.h"
#import "MOZUOrderNote.h"
#import "MOZUPackage.h"
#import "MOZUPayment.h"
#import "MOZUPickup.h"
#import "MOZURefund.h"
#import "MOZUShipment.h"
#import "MOZUShippingDiscount.h"
#import "MOZUShopperNotes.h"
#import "MOZUOrderValidationResult.h"



@protocol MOZUOrder
@end


/**
	Properties of an order, including its components.
*/
@interface MOZUOrder : JSONModel<MOZUOrder>

/**
The date and time the order was accepted by the tenant.
*/
@property(nonatomic) NSDate * acceptedDate;

/**
Indicates if the customer account is opted to receive marketing materials. If true, the customer account is opted in for receiving the content. 
*/
@property(nonatomic) NSNumber * acceptsMarketing;

/**
The amount of the order the shopper can receive in the event of a return. This amount represents the amount captured at the time the order was submitted, not when the order was returned.
*/
@property(nonatomic) NSNumber * amountAvailableForRefund;

/**
A counter for how much money has been issued in refunds. This calculated field does NOT include refunds issued in returns.
*/
@property(nonatomic) NSNumber * amountRefunded;

/**
The total amount of the order not currently associated with a payment. The shopper must create one or more payments to satisfy this amount before the order can be fully paid.
*/
@property(nonatomic) NSNumber * amountRemainingForPayment;

/**
Available actions you can complete for an order. These actions may differ depending on the status of the order, such as actions required to enter a payment, return of a package, and fulfillment of a shipment.
*/
@property(nonatomic) NSArray *availableActions;

/**
Date when the order was cancelled. System-supplied and read-only.
*/
@property(nonatomic) NSDate * cancelledDate;

/**
Code that identifies the channel associated with the site for the shopper's created shopping cart, order, and return.
*/
@property(nonatomic) NSString * channelCode;

/**
Date when the order was closed. Closed order is an order that has been processed and the items shipped. System-supplied and read-only.
*/
@property(nonatomic) NSDate * closedDate;

/**
Array list of coupon codes associated with a shopping cart and the associated order. These codes are entered by a shopper when proceeding to checkout. 
*/
@property(nonatomic) NSArray *couponCodes;

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
The tax identification number (TIN) of the customer who submitted the order. If the customer who submitted the order has a customer account defined for the tenant, the system sets this value when the order is submitted.
*/
@property(nonatomic) NSString * customerTaxId;

/**
The aggregate total for all items in the cart, including costs associated with shopper-defined options or extras and any applied discounts.
*/
@property(nonatomic) NSNumber * discountedSubtotal;

/**
The subtotal of the cart, order, and wishlist items, including any applied discount calculations. Wishlist subtotals may change depending on the length of time, available discounts, and stock amounts of products at the time of review by shoppers.
*/
@property(nonatomic) NSNumber * discountedTotal;

/**
Estimated amount of discounts applied to all items in the carts and orders. System-supplied and read-only. This value will be available at the wish list, cart item, order item, and wish list item level at a later time.
*/
@property(nonatomic) NSNumber * discountTotal;

/**
Order level duty or tariff amount. Does not take into account duties or tariffs specifically on items on the order
*/
@property(nonatomic) NSNumber * dutyAmount;

/**
Duties or tariffs for the Order as well as OrderItems (e.g. if the Order has a $5 duty or tariff for any reason and an OrderItem has a $2 duty or tariff then the value in this property would be $7)
*/
@property(nonatomic) NSNumber * dutyTotal;

/**
The email address of the specified user or the email address associated with the specified entity.
*/
@property(nonatomic) NSString * email;

/**
Date and time in UTC format when a discount, credit, wish list, or cart expires. An expired discount no longer can be redeemed. An expired wish list is no longer available. An expired credit can no longer be redeemed for a purchase. Acart becomes inactive and expired based on a system-calculated interval. For example, if an anonymous shopper has 14 days of inactivity, the cart is considered abandoned after that period of inactivity. System-supplied and read-only.
*/
@property(nonatomic) NSDate * expirationDate;

/**
Unique identifier used by an external program to identify a Mozu order, customer account, or wish list.
*/
@property(nonatomic) NSString * externalId;

/**
The monetary sum of all fees incurred in the cart, order, line item in a cart, or line item in an order. This value is not calculated for wish lists at this time.
*/
@property(nonatomic) NSNumber * feeTotal;

/**
The current fulfillment status of the order, which is "Fulfilled," "NotFulfilled," or "PartiallyFulfilled." The order is considered fulfilled when all packages are shipped or all pickups are picked up.
*/
@property(nonatomic) NSString * fulfillmentStatus;

/**
The combined price for all handling costs calculated together for shipped orders, not for digital or in-store pickup. This includes all handling costs per the product line items and options, excluding taxes and discounts. 
*/
@property(nonatomic) NSNumber * handlingAmount;

/**
Handling fees for the Order as well as OrderItems (e.g. if the Order has a $5 handling fee and an OrderItem has a $2 handling fee per item quantity then the value in this property would be $9)
*/
@property(nonatomic) NSNumber * handlingSubTotal;

/**
Calculated total tax amount for handling costs if the cart/order is subject to sales tax. 
*/
@property(nonatomic) NSNumber * handlingTaxTotal;

/**
This total represents the handling amount value with any applied discounts.
*/
@property(nonatomic) NSNumber * handlingTotal;

/**
If true, the order has a draft that may include one or more uncommitted changes to the order or its components.
*/
@property(nonatomic) NSNumber * hasDraft;

/**
Unique identifier of the source product property. For a product field it will be the name of the field. For a product attribute it will be the Attribute FQN. 
*/
@property(nonatomic) NSString * id;

/**
The date and time an order or wish list is imported into Mozu. This is not the date and time it was created in the external application. 
*/
@property(nonatomic) NSDate * importDate;

/**
A captured and stored IP address. IP addresses are stored for the origin location of submitted orders and the tenant domain.
*/
@property(nonatomic) NSString * ipAddress;

/**
If true, this version of the order is a draft that might contain uncommitted changes.
*/
@property(nonatomic) NSNumber * isDraft;

/**
If true, the shopper can return any of the items in this order to the tenant.
*/
@property(nonatomic) BOOL isEligibleForReturns;

/**
Indicates if this object/data was imported from an outside source such as a data import or synchronization via an app or service. If true, this data was originally imported into Mozu and accessible through your store database. Examples of imported objects/data include orders and customer accounts.
*/
@property(nonatomic) NSNumber * isImport;

/**
If true, the order is exempt from applied sales tax.
*/
@property(nonatomic) NSNumber * isTaxExempt;

/**
The total amount of calculated tax for items, used by carts, orders, and wish lists.
*/
@property(nonatomic) NSNumber * itemTaxTotal;

/**
The date in UTC Date/Time when the items in the cart were last validated against the site's product catalog. System-supplied and read-only.
*/
@property(nonatomic) NSDate * lastValidationDate;

/**
The unique, user-defined code that identifies a location. This location can be the location where the order was entered, location for newly in-stock products, and where products are returned.
*/
@property(nonatomic) NSString * locationCode;

/**
The order number that displays on the storefront which differs from the order ID.
*/
@property(nonatomic) NSNumber * orderNumber;

/**
Identifier of the cart prior to the customer proceeding to checkout.
*/
@property(nonatomic) NSString * originalCartId;

/**
If this Order has a parent Order, the parent Order ID is recorded here.
*/
@property(nonatomic) NSString * parentOrderId;

/**
If this order was created to fulfill an item replacement as part of a return merchandise authorization (RMA), the unique identifier of the return.
*/
@property(nonatomic) NSString * parentReturnId;

/**
Status of the payment for the specified order.
*/
@property(nonatomic) NSString * paymentStatus;

/**
Status of any returns associated with this order after it was completed.
*/
@property(nonatomic) NSString * returnStatus;

/**
The shipping subtotal amount calculated without any applied discounts for line item and entire amounts of carts and orders. This property is not calculated for wish lists at this time.
*/
@property(nonatomic) NSNumber * shippingSubTotal;

/**
The total amount of tax incurred on the shipping charges in the cart and order. This property is not calculated at this time for wish lists.
*/
@property(nonatomic) NSNumber * shippingTaxTotal;

/**
The calculated total shipping amount estimated for carts or orders, including tax. This amount is not calculated for wish lists at this time.
*/
@property(nonatomic) NSNumber * shippingTotal;

/**
Unique identifier of the site.
*/
@property(nonatomic) NSNumber * siteId;

/**
The device from which the order originated in the case of offline orders.
*/
@property(nonatomic) NSString * sourceDevice;

/**
The current status of an object. This status is specific to the object including payment (New, Authorized, Captured, Declined, Failed, Voided, Credited, CheckRequested, or RolledBack), discount (Active, Scheduled, or Expired), returns (ReturnAuthorized), tenant, package (Fulfilled or NotFulfilled), application, master and product catalogs, orders (Pending, Submitted, Processing, Pending Review, Closed, or Canceled), and order validation results (Pass, Fail, Error, or Review).
*/
@property(nonatomic) NSString * status;

/**
The date and time the order was submitted. System-supplied and read-only.
*/
@property(nonatomic) NSDate * submittedDate;

/**
Estimated amount of the cart or order without sales tax, shipping costs, and other fees. This amount is not calculated for wish lists at this time.
*/
@property(nonatomic) NSNumber * subtotal;

/**
The total monetary sum of sales tax estimated for a cart or order.
*/
@property(nonatomic) NSNumber * taxTotal;

/**
Unique identifier of the Mozu tenant.
*/
@property(nonatomic) NSNumber * tenantId;

/**
Total is used to indicate the monetary, estimated total amount of the cart or order, including items, sales tax, shipping costs, and other fees. Totals are not estimated for wish lists at this time.
*/
@property(nonatomic) NSNumber * total;

/**
The total amount collected to date for the order.
*/
@property(nonatomic) NSNumber * totalCollected;

/**
This specifies the order type. This means, was this order placed online or offline? Online means shopper created the order at checkout, offline means the order was a phone order.
*/
@property(nonatomic) NSString * type;

/**
The current version number of the order, wish list, document list, or document type list.
*/
@property(nonatomic) NSString * version;

/**
Unique identifier of the customer visit in which the cart was created or last modified.
*/
@property(nonatomic) NSString * visitId;

/**
Unique identifier of the web session in which the cart, order, return, or wish list was created or last modified.
*/
@property(nonatomic) NSString * webSessionId;

/**
Properties of an ad-hoc price adjustment for an order.
*/
@property(nonatomic) MOZUAdjustment *adjustment;

/**
Collection of attributes that may be paged list or a list, depending on the usage per object and API type. 
*/
@property(nonatomic) NSArray<MOZUOrderAttribute> *attributes;

/**
Identifier and datetime stamp information recorded when a user or application creates, updates, or deletes a resource entity. This value is system-supplied and read-only.
*/
@property(nonatomic) MOZUAuditInfo *auditInfo;

/**
Properties for the customer's billing information associated with an order or specific payment.
*/
@property(nonatomic) MOZUBillingInfo *billingInfo;

/**
Collection (list or paged) of change messages logged for each modification made by a shopper to their carts, wishlists, orders, package, payment, pickup, and returns. Change log messages are system-supplied based on shopper actions and read only.
*/
@property(nonatomic) NSArray<MOZUChangeMessage> *changeMessages;

/**
Custom data for a given vendor set within the commerce process.
*/
@property(nonatomic) NSObject * data;

/**
Specifies the fulfillment of digital packages associated with this order.
*/
@property(nonatomic) NSArray<MOZUDigitalPackage> *digitalPackages;

/**
Extra properties (key-value pairs) that extend the primary object. Think of this as a property bag of string keys and string values.
*/
@property(nonatomic) NSArray<MOZUExtendedProperty> *extendedProperties;

/**
Properties of the information required to fulfill the cart, order, or wish list. Shoppers can fulfill ordered items by using in-store pickup or direct shipping.
*/
@property(nonatomic) MOZUFulfillmentInfo *fulfillmentInfo;

/**
The list of historically-applied handling discounts.  The active one will have IsExcluded == false
*/
@property(nonatomic) NSArray<MOZUAppliedDiscount> *handlingDiscounts;

/**
The list of invalid coupons the shopper attempted to enter for the cart or order. These coupons may no longer be valid or incorrectly entered.
*/
@property(nonatomic) NSArray<MOZUInvalidCoupon> *invalidCoupons;

/**
An array list of objects in the returned collection.
*/
@property(nonatomic) NSArray<MOZUOrderItem> *items;

/**
Paged list collection of note content for objects including customers, orders, and returns. 
*/
@property(nonatomic) NSArray<MOZUOrderNote> *notes;

/**
List of order-level discounts projected to apply to the cart at checkout or order.
*/
@property(nonatomic) NSArray<MOZUAppliedDiscount> *orderDiscounts;

/**
Array list of physical packages shipped for a specified order.
*/
@property(nonatomic) NSArray<MOZUPackage> *packages;

/**
Wrapper for a collection of payments associated with an order or return. An order can include a number of payments until the full total is covered. 
*/
@property(nonatomic) NSArray<MOZUPayment> *payments;

/**
Array list of the in-store pickups defined for the order.
*/
@property(nonatomic) NSArray<MOZUPickup> *pickups;

/**
Refunds associated with this order. A refund is a single exchange of money from merchant to customer that either encapsulates a refund to a credit card or an issuance of a store credit. Refunds does not reduce the 'amount collected' on an order and it is possible for refunds to exceed the total order amount.
*/
@property(nonatomic) NSArray<MOZURefund> *refunds;

/**
Array list of the shipments defined to fulfill items in this order using the direct ship fulfillment method.
*/
@property(nonatomic) NSArray<MOZUShipment> *shipments;

/**
Properties of an ad-hoc price adjustment made for an order.
*/
@property(nonatomic) MOZUAdjustment *shippingAdjustment;

/**
List of shipping discounts projected to apply to carts, orders, and wish lists and items at checkout.
*/
@property(nonatomic) NSArray<MOZUShippingDiscount> *shippingDiscounts;

/**
A paged list collection of shopper notes for the order.
*/
@property(nonatomic) MOZUShopperNotes *shopperNotes;

/**
Response returned by an order validation capability application.
*/
@property(nonatomic) NSArray<MOZUOrderValidationResult> *validationResults;

@end

