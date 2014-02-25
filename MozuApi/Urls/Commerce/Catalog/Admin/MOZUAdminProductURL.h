/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUURLComponents.h"

@interface MOZUAdminProductURLComponents : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Resource Url Components for getProducts
@param startIndex 
@param pageSize The number of results to display on each page when creating paged results from a query. The maximum value is 200.
@param sortBy 
@param filter A set of expressions that consist of a field, operator, and value and represent search parameter syntax when filtering results of a query. Valid operators include equals (eq), does not equal (ne), greater than (gt), less than (lt), greater than or equal to (ge), less than or equal to (le), starts with (sw), or contains (cont). For example - "filter=IsDisplayed+eq+true"
@param q A list of product search terms to use in the query when searching across product code and product name. Separate multiple search terms with a space character.
@param qLimit The maximum number of search results to return in the response. You can limit any range between 1-100.
@param noCount If true, the operation does not return the TotalCount number of results.
*/
+(MOZUURLComponents*)URLComponentsForGetProductsOperationWithStartIndex:(NSNumber*)startIndex pageSize:(NSNumber*)pageSize sortBy:(NSString*)sortBy filter:(NSString*)filter q:(NSString*)q qLimit:(NSNumber*)qLimit noCount:(NSNumber*)noCount;

/**
Resource Url Components for getProduct
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
*/
+(MOZUURLComponents*)URLComponentsForGetProductOperationWithProductCode:(NSString*)productCode;

/**
Resource Url Components for getProductInCatalogs
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
*/
+(MOZUURLComponents*)URLComponentsForGetProductInCatalogsOperationWithProductCode:(NSString*)productCode;

/**
Resource Url Components for getProductInCatalog
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
@param catalogId The unique identifier of the catalog of products used by a site.
*/
+(MOZUURLComponents*)URLComponentsForGetProductInCatalogOperationWithProductCode:(NSString*)productCode catalogId:(NSInteger)catalogId;


//
#pragma mark -
#pragma mark POST Operations
#pragma mark -
//

/**
Resource Url Components for addProduct
*/
+(MOZUURLComponents*)URLComponentsForAddProductOperation;

/**
Resource Url Components for addProductInCatalog
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
*/
+(MOZUURLComponents*)URLComponentsForAddProductInCatalogOperationWithProductCode:(NSString*)productCode;


//
#pragma mark -
#pragma mark PUT Operations
#pragma mark -
//

/**
Resource Url Components for updateProduct
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
*/
+(MOZUURLComponents*)URLComponentsForUpdateProductOperationWithProductCode:(NSString*)productCode;

/**
Resource Url Components for updateProductInCatalogs
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
*/
+(MOZUURLComponents*)URLComponentsForUpdateProductInCatalogsOperationWithProductCode:(NSString*)productCode;

/**
Resource Url Components for updateProductInCatalog
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
@param catalogId The unique identifier of the catalog of products used by a site.
*/
+(MOZUURLComponents*)URLComponentsForUpdateProductInCatalogOperationWithProductCode:(NSString*)productCode catalogId:(NSInteger)catalogId;


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Resource Url Components for deleteProduct
@param productCode 
*/
+(MOZUURLComponents*)URLComponentsForDeleteProductOperationWithProductCode:(NSString*)productCode;

/**
Resource Url Components for deleteProductInCatalog
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
@param catalogId The unique identifier of the catalog of products used by a site.
*/
+(MOZUURLComponents*)URLComponentsForDeleteProductInCatalogOperationWithProductCode:(NSString*)productCode catalogId:(NSInteger)catalogId;



@end