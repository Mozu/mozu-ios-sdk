
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



@protocol MOZUShippingRate
@end


/**
	Properties of an estimated shipping rate for a shipment.
*/
@interface MOZUShippingRate : JSONModel<MOZUShippingRate>

/**
3-letter ISO 4217 standard global currency code. Currently, only "USD" (US Dollar) is supported.
*/
@property(nonatomic) NSString * currencyCode;

/**
If true, the estimated shipping rate is valid.
*/
@property(nonatomic) NSNumber * isValid;

/**
Array list of validation messages associated with the shipping rate.
*/
@property(nonatomic) NSArray *messages;

/**
The amount the company and the shopper pay for shipping based on the current rate. Depending on any company discounts or fees, the price the company pays for shipping may differ from what the shopper pays.
*/
@property(nonatomic) NSNumber * price;

/**
The code that identifies the service type shipping method, such as FED_EX_INTERNATIONAL.
*/
@property(nonatomic) NSString * shippingMethodCode;

/**
The name of the shipping method associated with the estimated rate, such as "UPS Ground".
*/
@property(nonatomic) NSString * shippingMethodName;

@end

