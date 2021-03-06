/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUURLComponents.h"

@interface MOZUOrderValidationResultURLComponents : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Resource Url Components for getValidationResults
@param orderId Unique identifier of the order.
*/
+ (MOZUURLComponents *)URLComponentsForGetValidationResultsOperationWithOrderId:(NSString *)orderId;


//
#pragma mark -
#pragma mark POST Operations
#pragma mark -
//


//
#pragma mark -
#pragma mark PUT Operations
#pragma mark -
//

/**
Resource Url Components for addValidationResult
@param orderId Unique identifier of the order.
@param responseFields Use this field to include those fields which are not included by default.
*/
+ (MOZUURLComponents *)URLComponentsForAddValidationResultOperationWithOrderId:(NSString *)orderId responseFields:(NSString *)responseFields;


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//



@end