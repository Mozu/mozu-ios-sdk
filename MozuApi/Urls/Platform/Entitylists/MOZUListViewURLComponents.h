/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUURLComponents.h"

@interface MOZUListViewURLComponents : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Resource Url Components for getViewEntity
@param entityListFullName 
@param viewName 
@param entityId 
@param responseFields Use this field to include those fields which are not included by default.
*/
+ (MOZUURLComponents *)URLComponentsForGetViewEntityOperationWithEntityListFullName:(NSString *)entityListFullName viewName:(NSString *)viewName entityId:(NSString *)entityId responseFields:(NSString *)responseFields;

/**
Resource Url Components for getViewEntities
@param entityListFullName 
@param viewName 
@param pageSize 
@param startIndex 
@param filter A set of expressions that consist of a field, operator, and value and represent search parameter syntax when filtering results of a query. Valid operators include equals (eq), does not equal (ne), greater than (gt), less than (lt), greater than or equal to (ge), less than or equal to (le), starts with (sw), or contains (cont). For example - "filter=IsDisplayed+eq+true"
@param responseFields Use this field to include those fields which are not included by default.
*/
+ (MOZUURLComponents *)URLComponentsForGetViewEntitiesOperationWithEntityListFullName:(NSString *)entityListFullName viewName:(NSString *)viewName pageSize:(NSNumber *)pageSize startIndex:(NSNumber *)startIndex filter:(NSString *)filter responseFields:(NSString *)responseFields;

/**
Resource Url Components for getViewEntityContainer
@param entityListFullName 
@param viewName 
@param entityId 
@param responseFields Use this field to include those fields which are not included by default.
*/
+ (MOZUURLComponents *)URLComponentsForGetViewEntityContainerOperationWithEntityListFullName:(NSString *)entityListFullName viewName:(NSString *)viewName entityId:(NSString *)entityId responseFields:(NSString *)responseFields;

/**
Resource Url Components for getViewEntityContainers
@param entityListFullName 
@param viewName 
@param pageSize 
@param startIndex 
@param filter A set of expressions that consist of a field, operator, and value and represent search parameter syntax when filtering results of a query. Valid operators include equals (eq), does not equal (ne), greater than (gt), less than (lt), greater than or equal to (ge), less than or equal to (le), starts with (sw), or contains (cont). For example - "filter=IsDisplayed+eq+true"
@param responseFields Use this field to include those fields which are not included by default.
*/
+ (MOZUURLComponents *)URLComponentsForGetViewEntityContainersOperationWithEntityListFullName:(NSString *)entityListFullName viewName:(NSString *)viewName pageSize:(NSNumber *)pageSize startIndex:(NSNumber *)startIndex filter:(NSString *)filter responseFields:(NSString *)responseFields;

/**
Resource Url Components for getEntityListView
@param entityListFullName 
@param viewName 
@param responseFields Use this field to include those fields which are not included by default.
*/
+ (MOZUURLComponents *)URLComponentsForGetEntityListViewOperationWithEntityListFullName:(NSString *)entityListFullName viewName:(NSString *)viewName responseFields:(NSString *)responseFields;

/**
Resource Url Components for getEntityListViews
@param entityListFullName 
@param responseFields Use this field to include those fields which are not included by default.
*/
+ (MOZUURLComponents *)URLComponentsForGetEntityListViewsOperationWithEntityListFullName:(NSString *)entityListFullName responseFields:(NSString *)responseFields;


//
#pragma mark -
#pragma mark POST Operations
#pragma mark -
//

/**
Resource Url Components for createEntityListView
@param entityListFullName 
@param responseFields Use this field to include those fields which are not included by default.
*/
+ (MOZUURLComponents *)URLComponentsForCreateEntityListViewOperationWithEntityListFullName:(NSString *)entityListFullName responseFields:(NSString *)responseFields;


//
#pragma mark -
#pragma mark PUT Operations
#pragma mark -
//

/**
Resource Url Components for updateEntityListView
@param entityListFullName 
@param viewName 
@param responseFields Use this field to include those fields which are not included by default.
*/
+ (MOZUURLComponents *)URLComponentsForUpdateEntityListViewOperationWithEntityListFullName:(NSString *)entityListFullName viewName:(NSString *)viewName responseFields:(NSString *)responseFields;


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Resource Url Components for deleteEntityListView
@param entityListFullName 
@param viewName 
*/
+ (MOZUURLComponents *)URLComponentsForDeleteEntityListViewOperationWithEntityListFullName:(NSString *)entityListFullName viewName:(NSString *)viewName;



@end