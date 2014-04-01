/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUURLComponents.h"

@interface MOZUOrderAttributeURLComponents : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Resource Url Components for getOrderAttributes
@param orderId Unique identifier of the order for which to retrieve a list of defined attributes.
*/
+ (MOZUURLComponents *)URLComponentsForGetOrderAttributesOperationWithOrderId:(NSString *)orderId;


//
#pragma mark -
#pragma mark POST Operations
#pragma mark -
//

/**
Resource Url Components for createOrderAttributes
@param orderId Unique identifier of the order for which to assign the attributes.
*/
+ (MOZUURLComponents *)URLComponentsForCreateOrderAttributesOperationWithOrderId:(NSString *)orderId;


//
#pragma mark -
#pragma mark PUT Operations
#pragma mark -
//

/**
Resource Url Components for updateOrderAttributes
@param orderId Identifier of the order for which to update attributes.
@param removeMissing If true, the operation removes missing properties so that the updated order attributes will not show properties with a null value.
*/
+ (MOZUURLComponents *)URLComponentsForUpdateOrderAttributesOperationWithOrderId:(NSString *)orderId removeMissing:(NSNumber *)removeMissing;


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//



@end