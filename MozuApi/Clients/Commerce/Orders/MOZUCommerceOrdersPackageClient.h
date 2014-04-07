
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import <Foundation/Foundation.h>
#import "MOZUClient.h"
#import "MOZUCommercePackage.h"


@interface MOZUCommerceOrdersPackageClient : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieves the details of a package of order items.
@param orderId Unique identifier of the order associated with the package to retrieve.
@param packageId Unique identifier of the package to retrieve.
*/

+ (MOZUClient *)clientForGetPackageOperationWithOrderId:(NSString *)orderId packageId:(NSString *)packageId;

/**
Retrieves a list of the actions available to perform for a package associated with order fulfillment.
@param orderId Unique identifier of the order associated with the package fulfillment.
@param packageId Unique identifier of the package associated with the fulfillment actions to retrieve.
*/

+ (MOZUClient *)clientForGetAvailablePackageFulfillmentActionsOperationWithOrderId:(NSString *)orderId packageId:(NSString *)packageId;

/**
Retrieves the package label image supplied by the carrier.
@param orderId Unique identifier of the order associated with the package label to retrieve.
@param packageId Unique identifier of the package for which to retrieve the label.
*/

+ (MOZUClient *)clientForGetPackageLabelOperationWithOrderId:(NSString *)orderId packageId:(NSString *)packageId;


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

/**
Creates a new physical package of order items.
@param body Properties of the physical package of order items.
@param orderId Unique identifier of the order associated with this package.
*/

+ (MOZUClient *)clientForCreatePackageOperationWithBody:(MOZUCommercePackage *)body orderId:(NSString *)orderId;


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

/**
Updates one or more properties of a physical package of order items.
@param body Wrapper of properties for the package of order items to update.
@param orderId Unique identifier of the order associated with the package to update.
@param packageId Unique identifier of the package of order items to update.
*/

+ (MOZUClient *)clientForUpdatePackageOperationWithBody:(MOZUCommercePackage *)body orderId:(NSString *)orderId packageId:(NSString *)packageId;


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Removes a physical package of items from the specified order.
@param orderId Unique identifier of the order associated with the package to delete.
@param packageId Unique identifier of the package to delete.
*/

+ (MOZUClient *)clientForDeletePackageOperationWithOrderId:(NSString *)orderId packageId:(NSString *)packageId;



@end