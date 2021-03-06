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
@param returnId Unique identifier of the return whose items you want to get.
@param shipmentId Unique identifier of the shipment to retrieve.
@param responseFields Use this field to include those fields which are not included by default.
*/
+ (MOZUURLComponents *)URLComponentsForGetShipmentOperationWithReturnId:(NSString *)returnId shipmentId:(NSString *)shipmentId responseFields:(NSString *)responseFields;


//
#pragma mark -
#pragma mark POST Operations
#pragma mark -
//

/**
Resource Url Components for createPackageShipments
@param returnId Unique identifier of the return whose items you want to get.
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
@param returnId Unique identifier of the return whose items you want to get.
@param shipmentId Unique identifier of the shipment to retrieve.
*/
+ (MOZUURLComponents *)URLComponentsForDeleteShipmentOperationWithReturnId:(NSString *)returnId shipmentId:(NSString *)shipmentId;



@end