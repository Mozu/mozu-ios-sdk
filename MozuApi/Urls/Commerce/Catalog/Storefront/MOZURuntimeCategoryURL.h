/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUURLComponents.h"

@interface MOZURuntimeCategoryURLComponents : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Resource Url Components for getCategories
@param filter A set of expressions that consist of a field, operator, and value and represent search parameter syntax when filtering results of a query. You can filter product category search results by any of its properties, including its position in the category hierarchy. Valid operators include equals (eq), does not equal (ne), greater than (gt), less than (lt), greater than or equal to (ge), less than or equal to (le), starts with (sw), or contains (cont). For example - "filter=IsDisplayed+eq+true"
@param startIndex 
@param pageSize The number of results to display on each page when creating paged results from a query. The maximum value is 200.
@param sortBy 
*/
+(MOZUURLComponents*)URLComponentsForGetCategoriesOperationWithFilter:(NSString*)filter startIndex:(NSNumber*)startIndex pageSize:(NSNumber*)pageSize sortBy:(NSString*)sortBy;

/**
Resource Url Components for getCategory
@param categoryId Unique identifier for the storefront container used to organize products.
@param allowInactive If true, allow inactive categories to be retrieved in the category list response. If false, the categories retrieved will not include ones marked inactive.
*/
+(MOZUURLComponents*)URLComponentsForGetCategoryOperationWithCategoryId:(NSInteger)categoryId allowInactive:(NSNumber*)allowInactive;

/**
Resource Url Components for getCategoryTree
*/
+(MOZUURLComponents*)URLComponentsForGetCategoryTreeOperation;


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


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//



@end