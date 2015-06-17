
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
#import "MOZUPayment.h"



@protocol MOZURefund
@end


/**
	Mozu.CommerceRuntime.Contracts.Refunds.Refund ApiType DOCUMENT_HERE 
*/
@interface MOZURefund : JSONModel<MOZURefund>

/**
Amount refunded.
*/
@property(nonatomic) NSNumber * amount;

/**
Unique identifier of the source product property. For a product field it will be the name of the field. For a product attribute it will be the Attribute FQN. 
*/
@property(nonatomic) NSString * id;

/**
Unique identifier of the order associated with the payment.
*/
@property(nonatomic) NSString * orderId;

/**
The reason description for an action, including item return, coupon not valid, and item is taxed. 
*/
@property(nonatomic) NSString * reason;

/**
Basic audit info about the object, including date, time, and user account. Identifier and datetime stamp information recorded when a user or application creates, updates, or deletes a resource entity. This value is system-supplied and read-only.
*/
@property(nonatomic) MOZUAuditInfo *auditInfo;

/**
The payment associated with this refund (if applicable).
*/
@property(nonatomic) MOZUPayment *payment;

@end

