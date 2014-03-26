
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



@protocol MOZUShippingRateValidationMessage
@end


/**
	Properties of a message returned when a shipping rate fails validation.
*/
@interface MOZUShippingRateValidationMessage : JSONModel<MOZUShippingRateValidationMessage>

/**
URL displayed with the shipping validation failure message that links to help information.
*/
@property(nonatomic) NSString * helpLink;

/**
Content of the shipping rate validation failure message.
*/
@property(nonatomic) NSString * message;

/**
Severity level of the shipping rate validation failure.
*/
@property(nonatomic) NSString * severity;

@end
