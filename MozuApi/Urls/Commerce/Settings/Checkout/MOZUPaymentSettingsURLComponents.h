/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUURLComponents.h"

@interface MOZUPaymentSettingsURLComponents : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Resource Url Components for getThirdPartyPaymentWorkflowWithValues
@param fullyQualifiedName 
@param responseFields A list or array of fields returned for a call. These fields may be customized and may be used for various types of data calls in Mozu. For example, responseFields are returned for retrieving or updating attributes, carts, and messages in Mozu.
*/
+ (MOZUURLComponents *)URLComponentsForGetThirdPartyPaymentWorkflowWithValuesOperationWithFullyQualifiedName:(NSString *)fullyQualifiedName responseFields:(NSString *)responseFields;

/**
Resource Url Components for getThirdPartyPaymentWorkflows
*/
+ (MOZUURLComponents *)URLComponentsForGetThirdPartyPaymentWorkflowsOperation;


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
Resource Url Components for addThirdPartyPaymentWorkflow
*/
+ (MOZUURLComponents *)URLComponentsForAddThirdPartyPaymentWorkflowOperation;


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Resource Url Components for deleteThirdPartyPaymentWorkflow
@param fullyQualifiedName 
*/
+ (MOZUURLComponents *)URLComponentsForDeleteThirdPartyPaymentWorkflowOperationWithFullyQualifiedName:(NSString *)fullyQualifiedName;



@end