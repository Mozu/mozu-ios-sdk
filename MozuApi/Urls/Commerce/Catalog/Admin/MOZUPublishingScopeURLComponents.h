/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUURLComponents.h"

@interface MOZUPublishingScopeURLComponents : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Resource Url Components for getPublishSet
@param publishSetCode 
@param responseFields A list or array of fields returned for a call. These fields may be customized and may be used for various types of data calls in Mozu. For example, responseFields are returned for retrieving or updating attributes, carts, and messages in Mozu.
*/
+ (MOZUURLComponents *)URLComponentsForGetPublishSetOperationWithPublishSetCode:(NSString *)publishSetCode responseFields:(NSString *)responseFields;

/**
Resource Url Components for getPublishSets
@param responseFields A list or array of fields returned for a call. These fields may be customized and may be used for various types of data calls in Mozu. For example, responseFields are returned for retrieving or updating attributes, carts, and messages in Mozu.
*/
+ (MOZUURLComponents *)URLComponentsForGetPublishSetsOperationWithResponseFields:(NSString *)responseFields;


//
#pragma mark -
#pragma mark POST Operations
#pragma mark -
//

/**
Resource Url Components for discardDrafts
*/
+ (MOZUURLComponents *)URLComponentsForDiscardDraftsOperation;

/**
Resource Url Components for publishDrafts
*/
+ (MOZUURLComponents *)URLComponentsForPublishDraftsOperation;

/**
Resource Url Components for assignProductsToPublishSet
@param responseFields A list or array of fields returned for a call. These fields may be customized and may be used for various types of data calls in Mozu. For example, responseFields are returned for retrieving or updating attributes, carts, and messages in Mozu.
*/
+ (MOZUURLComponents *)URLComponentsForAssignProductsToPublishSetOperationWithResponseFields:(NSString *)responseFields;


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
Resource Url Components for deletePublishSet
@param publishSetCode 
@param discardDrafts 
*/
+ (MOZUURLComponents *)URLComponentsForDeletePublishSetOperationWithPublishSetCode:(NSString *)publishSetCode discardDrafts:(NSNumber *)discardDrafts;



@end