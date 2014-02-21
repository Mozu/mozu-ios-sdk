
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
#import "MOZUAPIContext.h"

#import "MOZUAuthTicket.h"
#import "MOZUProductSearchResult.h"
#import "MOZUSearchSuggestion.h"


@interface MOZUProductSearchResultResource : NSObject


@property(readonly, nonatomic) MOZUAPIContext * apiContext;

-(id)initWithAPIContext:(MOZUAPIContext *)apiContext;


//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Searches the categories displayed on the storefront for products or product options that the shopper types in a search query.
@param facet Individually list the facet fields you want to display in a storefront product search.
@param facetFieldRangeQuery Display a range facet not specified in a template in a storefront product search by listing the facet field and the range to display.
@param facetHierDepth If filtering using category facets in a hierarchy, the number of category hierarchy levels to return for the facet. This option is only available for category facets.
@param facetHierPrefix If filtering using category facets in a hierarchy, the parent categories you want to skip in the storefront product search. This parameter is only available for category facets.
@param facetHierValue If filtering using category facets in a hierarchy, the category in the hierarchy to begin faceting on. This parameter is only available for category facets.
@param facetPageSize The number of facet values to return for one or more facets.
@param facetSettings Settings reserved for future facet search functionality on a storefront product search.
@param facetStartIndex When paging through multiple facets, the startIndex value for each facet.
@param facetTemplate The facet template to use on the storefront. A template displays all facets associated with the template on the storefront product search. Currently, only category-level facet templates are available.
@param facetTemplateSubset Display a subset of the facets defined in the template specified in facetTemplate parameter.
@param facetValueFilter The facet values to apply to the filter.
@param filter A set of expressions that consist of a field, operator, and value and represent search parameter syntax when filtering results of a query. You can filter product search results by any of its properties, including product code, type, category, and name. Valid operators include equals (eq), does not equal (ne), greater than (gt), less than (lt), greater than or equal to (ge), less than or equal to (le), starts with (sw), or contains (cont). For example - "filter=categoryId+eq+12"
@param pageSize The number of results to display on each page when creating paged results from a query. The maximum value is 200.
@param query The terms to search on.
@param sortBy 
@param startIndex 
*/

-(void)searchWithQuery:(NSString*)query filter:(NSString*)filter facetTemplate:(NSString*)facetTemplate facetTemplateSubset:(NSString*)facetTemplateSubset facet:(NSString*)facet facetFieldRangeQuery:(NSString*)facetFieldRangeQuery facetHierPrefix:(NSString*)facetHierPrefix facetHierValue:(NSString*)facetHierValue facetHierDepth:(NSString*)facetHierDepth facetStartIndex:(NSString*)facetStartIndex facetPageSize:(NSString*)facetPageSize facetSettings:(NSString*)facetSettings facetValueFilter:(NSString*)facetValueFilter sortBy:(NSString*)sortBy pageSize:(NSNumber*)pageSize startIndex:(NSNumber*)startIndex userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUProductSearchResult* result, MOZUApiError* error, NSHTTPURLResponse* response))handler
;
/**
Suggests possible search terms as the shopper enters search text.
@param pageSize The number of results to display on each page when creating paged results from a query. The maximum value is 200.
@param q Text that the shopper is currently entering.
*/

-(void)suggestWithQ:(NSString*)q pageSize:(NSNumber*)pageSize userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUSearchSuggestion* result, MOZUApiError* error, NSHTTPURLResponse* response))handler
;

//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//



@end