/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUURLComponents.h"

@interface MOZUCommerceReturnsShipmentURLComponents : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Resource Url Components for getShipment
@param returnId Unique identifier of the return associated with the replacement shipment to retrieve.
@param shipmentId Unique identifier of the return replacement shipment to retrieve.
*/
+ (MOZUURLComponents *)URLComponentsForGetShipmentOperationWithReturnId:(NSString *)returnId shipmentId:(NSString *)shipmentId;


//
#pragma mark -
#pragma mark POST Operations
#pragma mark -
//

/**
Resource Url Components for createPackageShipments
@param returnId Unique identifier of the return for which to create replacement package shipments.
*/
+ (MOZUURLComponents *)URLComponentsForCreatePackageShipmentsOperationWithReturnId:(NSString *)returnId;


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
@param returnId Unique identifier of the return associated with the replacement shipment to delete.
@param shipmentId Unique identifier of the return replacement shipment to delete.
*/
+ (MOZUURLComponents *)URLComponentsForDeleteShipmentOperationWithReturnId:(NSString *)returnId shipmentId:(NSString *)shipmentId;



@end