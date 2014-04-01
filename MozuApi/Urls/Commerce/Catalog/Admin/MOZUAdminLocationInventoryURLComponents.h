/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUURLComponents.h"

@interface MOZUAdminLocationInventoryURLComponents : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Resource Url Components for getLocationInventory
@param locationCode User-defined code that uniquely identifies the location.
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
*/
+ (MOZUURLComponents *)URLComponentsForGetLocationInventoryOperationWithLocationCode:(NSString *)locationCode productCode:(NSString *)productCode;

/**
Resource Url Components for getLocationInventories
@param locationCode User-defined code that uniquely identifies the location.
@param startIndex When creating paged results from a query, this value indicates the zero-based offset in the complete result set where the returned entities begin. For example, with a PageSize of 25, to get the 51st through the 75th items, use startIndex=3.
@param pageSize The number of results to display on each page when creating paged results from a query. The maximum value is 200.
@param sortBy The property by which to sort results and whether the results appear in ascending (a-z) order, represented by ASC or in descending (z-a) order, represented by DESC. The sortBy parameter follows an available property. For example: "sortBy=productCode+asc"
@param filter A set of expressions that consist of a field, operator, and value and represent search parameter syntax when filtering results of a query. Valid operators include equals (eq), does not equal (ne), greater than (gt), less than (lt), greater than or equal to (ge), less than or equal to (le), starts with (sw), or contains (cont). For example - "filter=IsDisplayed+eq+true"
*/
+ (MOZUURLComponents *)URLComponentsForGetLocationInventoriesOperationWithLocationCode:(NSString *)locationCode startIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter;


//
#pragma mark -
#pragma mark POST Operations
#pragma mark -
//

/**
Resource Url Components for addLocationInventory
@param locationCode User-defined code that uniquely identifies the location.
*/
+ (MOZUURLComponents *)URLComponentsForAddLocationInventoryOperationWithLocationCode:(NSString *)locationCode;


//
#pragma mark -
#pragma mark PUT Operations
#pragma mark -
//

/**
Resource Url Components for updateLocationInventory
@param locationCode User-defined code that uniquely identifies the location.
*/
+ (MOZUURLComponents *)URLComponentsForUpdateLocationInventoryOperationWithLocationCode:(NSString *)locationCode;


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Resource Url Components for deleteLocationInventory
@param locationCode User-defined code that uniquely identifies the location.
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
*/
+ (MOZUURLComponents *)URLComponentsForDeleteLocationInventoryOperationWithLocationCode:(NSString *)locationCode productCode:(NSString *)productCode;



@end