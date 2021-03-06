
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



@protocol MOZUCommerceShippingRate
@end


/**
	Properties of an estimated shipping rate for a shipment.
*/
@interface MOZUCommerceShippingRate : JSONModel<MOZUCommerceShippingRate>

/**
3-letter ISO 4217 standard global currency code. Currently, only "USD" (US Dollar) is supported.
*/
@property(nonatomic) NSString * currencyCode;

/**
Indicates if the facet is currently valid.
*/
@property(nonatomic) NSNumber * isValid;

/**
Array list of validation and status messages associated with shipping rates, orders, and product purchasable state.
*/
@property(nonatomic) NSArray *messages;

/**
The amount the company and the shopper pay for shipping based on the current rate. Depending on any company discounts or fees, the price the company pays for shipping may differ from what the shopper pays.
*/
@property(nonatomic) NSNumber * price;

/**
The code associated with a carrier's shipping method service type, used during fulfillment of packages and shipments. Service type codes include a prefix that indicates the carrier. For example: FEDEX_INTERNATIONAL_STANDARD and UPS_GROUND.
*/
@property(nonatomic) NSString * shippingMethodCode;

/**
The carrier-supplied name for the shipping service type, such as "UPS Ground" or "2nd Day Air".
*/
@property(nonatomic) NSString * shippingMethodName;

/**
The shipping zone to which this rate applies.
*/
@property(nonatomic) NSString * shippingZoneCode;

/**
Custom data returned by the shipping service.
*/
@property(nonatomic) NSObject * data;

@end

