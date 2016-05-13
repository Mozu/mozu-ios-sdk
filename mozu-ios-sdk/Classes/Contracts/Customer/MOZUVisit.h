
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
#import "MOZUTransaction.h"



@protocol MOZUVisit
@end


/**
	Properties of a customer visit to one of a company's sites.
*/
@interface MOZUVisit : JSONModel<MOZUVisit>

/**
Unique identifier of the customer account generated by the system. Account IDs are generated at account creation.
*/
@property(nonatomic) NSNumber * accountId;

/**
If the customer visit is made online, the location code associated with the website visited.
*/
@property(nonatomic) NSString * browserLocationCode;

/**
The date and time recording for a customer action including a transaction and storefront visit.
*/
@property(nonatomic) NSDate * date;

/**
Unique identifier of the source product property. For a product field it will be the name of the field. For a product attribute it will be the Attribute FQN. 
*/
@property(nonatomic) NSString * id;

/**
The unique, user-defined code that identifies a location. This location can be the location where the order was entered, location for newly in-stock products, and where products are returned.
*/
@property(nonatomic) NSString * locationCode;

/**
The type of customer visit, which is "Website," "Store," "Call," or "Unknown."
*/
@property(nonatomic) NSString * type;

/**
Unique identifier of the customer account (shopper or system user). System-supplied and read-only. If the shopper user is anonymous, the user ID represents a system-generated user ID string.
*/
@property(nonatomic) NSString * userId;

/**
The HTTP_Referrer that initiatied the visit started. If the shopper was not referred from another source, this value is null.
*/
@property(nonatomic) NSString * webReferrer;

/**
Unique identifier of the web session in which the cart, order, return, or wish list was created or last modified.
*/
@property(nonatomic) NSString * webSessionId;

/**
Unique identifier of the site.
*/
@property(nonatomic) NSNumber * webSiteId;

/**
The user agent string for the browser.
*/
@property(nonatomic) NSString * webUserAgent;

/**
Array list of transactions the customer performed during the visit. A customer can perform multiple transactions in a single visit, or the visit can have no associated transactions.
*/
@property(nonatomic) NSArray<MOZUTransaction> *transactions;

@end
