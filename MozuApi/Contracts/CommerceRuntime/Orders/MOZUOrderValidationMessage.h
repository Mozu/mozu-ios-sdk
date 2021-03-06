
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



@protocol MOZUOrderValidationMessage
@end


/**
	Properties of a message returned by an order validation capability for the order specified in the request.
*/
@interface MOZUOrderValidationMessage : JSONModel<MOZUOrderValidationMessage>

/**
The text of the change message, such as "This product is no longer available." System-supplied and read-only.
*/
@property(nonatomic) NSString * message;

/**
The type of message returned by the order validation capability, such as "Fraud Score."
*/
@property(nonatomic) NSString * messageType;

/**
Unique identifier of the order item associated with a validation message, order, or return.
*/
@property(nonatomic) NSString * orderItemId;

@end

