/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUProductSearchResultURLComponents.h"

@implementation MOZUProductSearchResultURLComponents

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+ (MOZUURLComponents *)URLComponentsForSearchOperationWithQuery:(NSString *)query filter:(NSString *)filter facetTemplate:(NSString *)facetTemplate facetTemplateSubset:(NSString *)facetTemplateSubset facet:(NSString *)facet facetFieldRangeQuery:(NSString *)facetFieldRangeQuery facetHierPrefix:(NSString *)facetHierPrefix facetHierValue:(NSString *)facetHierValue facetHierDepth:(NSString *)facetHierDepth facetStartIndex:(NSString *)facetStartIndex facetPageSize:(NSString *)facetPageSize facetSettings:(NSString *)facetSettings facetValueFilter:(NSString *)facetValueFilter sortBy:(NSString *)sortBy pageSize:(NSNumber *)pageSize startIndex:(NSNumber *)startIndex searchSettings:(NSString *)searchSettings enableSearchTuningRules:(NSNumber *)enableSearchTuningRules searchTuningRuleContext:(NSString *)searchTuningRuleContext searchTuningRuleCode:(NSString *)searchTuningRuleCode facetTemplateExclude:(NSString *)facetTemplateExclude responseFields:(NSString *)responseFields {
	NSString *template = @"/api/commerce/catalog/storefront/productsearch/search/?query={query}&filter={filter}&facetTemplate={facetTemplate}&facetTemplateSubset={facetTemplateSubset}&facet={facet}&facetFieldRangeQuery={facetFieldRangeQuery}&facetHierPrefix={facetHierPrefix}&facetHierValue={facetHierValue}&facetHierDepth={facetHierDepth}&facetStartIndex={facetStartIndex}&facetPageSize={facetPageSize}&facetSettings={facetSettings}&facetValueFilter={facetValueFilter}&sortBy={sortBy}&pageSize={pageSize}&startIndex={startIndex}&searchSettings={searchSettings}&enableSearchTuningRules={enableSearchTuningRules}&searchTuningRuleContext={searchTuningRuleContext}&searchTuningRuleCode={searchTuningRuleCode}&facetTemplateExclude={facetTemplateExclude}&responseFields={responseFields}";
	NSDictionary *params = @{
		@"query" : query ? query : @"",
		@"filter" : filter ? filter : @"",
		@"facetTemplate" : facetTemplate ? facetTemplate : @"",
		@"facetTemplateSubset" : facetTemplateSubset ? facetTemplateSubset : @"",
		@"facet" : facet ? facet : @"",
		@"facetFieldRangeQuery" : facetFieldRangeQuery ? facetFieldRangeQuery : @"",
		@"facetHierPrefix" : facetHierPrefix ? facetHierPrefix : @"",
		@"facetHierValue" : facetHierValue ? facetHierValue : @"",
		@"facetHierDepth" : facetHierDepth ? facetHierDepth : @"",
		@"facetStartIndex" : facetStartIndex ? facetStartIndex : @"",
		@"facetPageSize" : facetPageSize ? facetPageSize : @"",
		@"facetSettings" : facetSettings ? facetSettings : @"",
		@"facetValueFilter" : facetValueFilter ? facetValueFilter : @"",
		@"sortBy" : sortBy ? sortBy : @"",
		@"pageSize" : pageSize ? pageSize : @"",
		@"startIndex" : startIndex ? startIndex : @"",
		@"searchSettings" : searchSettings ? searchSettings : @"",
		@"enableSearchTuningRules" : enableSearchTuningRules ? enableSearchTuningRules : @"",
		@"searchTuningRuleContext" : searchTuningRuleContext ? searchTuningRuleContext : @"",
		@"searchTuningRuleCode" : searchTuningRuleCode ? searchTuningRuleCode : @"",
		@"facetTemplateExclude" : facetTemplateExclude ? facetTemplateExclude : @"",
		@"responseFields" : responseFields ? responseFields : @"",
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+ (MOZUURLComponents *)URLComponentsForSuggestOperationWithQuery:(NSString *)query groups:(NSString *)groups pageSize:(NSNumber *)pageSize responseFields:(NSString *)responseFields {
	NSString *template = @"/api/commerce/catalog/storefront/productsearch/suggest?query={query}&groups={groups}&pageSize={pageSize}&responseFields={responseFields}";
	NSDictionary *params = @{
		@"query" : query ? query : @"",
		@"groups" : groups ? groups : @"",
		@"pageSize" : pageSize ? pageSize : @"",
		@"responseFields" : responseFields ? responseFields : @"",
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}


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