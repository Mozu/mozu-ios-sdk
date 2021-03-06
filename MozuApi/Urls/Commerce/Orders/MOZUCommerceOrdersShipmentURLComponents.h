/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUURLComponents.h"

@interface MOZUCommerceOrdersShipmentURLComponents : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Resource Url Components for getShipment
@param orderId Unique identifier of the order.
@param shipmentId Unique identifier of the shipment to retrieve.
@param responseFields Use this field to include those fields which are not included by default.
*/
+ (MOZUURLComponents *)URLComponentsForGetShipmentOperationWithOrderId:(NSString *)orderId shipmentId:(NSString *)shipmentId responseFields:(NSString *)responseFields;

/**
Resource Url Components for getAvailableShipmentMethods
@param orderId Unique identifier of the order.
@param draft If true, retrieve the draft version of the order, which might include uncommitted changes to the order or its components.
*/
+ (MOZUURLComponents *)URLComponentsForGetAvailableShipmentMethodsOperationWithOrderId:(NSString *)orderId draft:(NSNumber *)draft;


//
#pragma mark -
#pragma mark POST Operations
#pragma mark -
//

/**
Resource Url Components for createPackageShipments
@param orderId Unique identifier of the order.
*/
+ (MOZUURLComponents *)URLComponentsForCreatePackageShipmentsOperationWithOrderId:(NSString *)orderId;


//
#pragma mark -
#pragma mark PUT Operations
#pragma mark -
//


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Resource Url Components for deleteShipment
@param orderId Unique identifier of the order.
@param shipmentId Unique identifier of the shipment to retrieve.
*/
+ (MOZUURLComponents *)URLComponentsForDeleteShipmentOperationWithOrderId:(NSString *)orderId shipmentId:(NSString *)shipmentId;



@end