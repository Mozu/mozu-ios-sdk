/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUURLComponents.h"

@interface MOZUPropertyTypeURLComponents : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Resource Url Components for getPropertyTypes
@param pageSize The number of results to display on each page when creating paged results from a query. The maximum value is 200.
@param startIndex When creating paged results from a query, this value indicates the zero-based offset in the complete result set where the returned entities begin. For example, with a PageSize of 25, to get the 51st through the 75th items, use startIndex=3.
@param responseFields Use this field to include those fields which are not included by default.
*/
+ (MOZUURLComponents *)URLComponentsForGetPropertyTypesOperationWithPageSize:(NSNumber *)pageSize startIndex:(NSNumber *)startIndex responseFields:(NSString *)responseFields;

/**
Resource Url Components for getPropertyType
@param propertyTypeName The name of the property type.
@param responseFields Use this field to include those fields which are not included by default.
*/
+ (MOZUURLComponents *)URLComponentsForGetPropertyTypeOperationWithPropertyTypeName:(NSString *)propertyTypeName responseFields:(NSString *)responseFields;


//
#pragma mark -
#pragma mark POST Operations
#pragma mark -
//

/**
Resource Url Components for createPropertyType
@param responseFields Use this field to include those fields which are not included by default.
*/
+ (MOZUURLComponents *)URLComponentsForCreatePropertyTypeOperationWithResponseFields:(NSString *)responseFields;


//
#pragma mark -
#pragma mark PUT Operations
#pragma mark -
//

/**
Resource Url Components for updatePropertyType
@param propertyTypeName The name of the property type.
@param responseFields Use this field to include those fields which are not included by default.
*/
+ (MOZUURLComponents *)URLComponentsForUpdatePropertyTypeOperationWithPropertyTypeName:(NSString *)propertyTypeName responseFields:(NSString *)responseFields;


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Resource Url Components for deletePropertyType
@param propertyTypeName The name of the property type.
*/
+ (MOZUURLComponents *)URLComponentsForDeletePropertyTypeOperationWithPropertyTypeName:(NSString *)propertyTypeName;



@end