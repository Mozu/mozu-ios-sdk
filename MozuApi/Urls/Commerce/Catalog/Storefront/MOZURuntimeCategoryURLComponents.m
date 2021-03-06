/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZURuntimeCategoryURLComponents.h"

@implementation MOZURuntimeCategoryURLComponents

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+ (MOZUURLComponents *)URLComponentsForGetCategoriesOperationWithFilter:(NSString *)filter startIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy responseFields:(NSString *)responseFields {
	NSString *template = @"/api/commerce/catalog/storefront/categories/?filter={filter}&startIndex={startIndex}&pageSize={pageSize}&sortBy={sortBy}&responseFields={responseFields}";
	NSDictionary *params = @{
		@"filter" : filter ? filter : @"",
		@"startIndex" : startIndex ? startIndex : @"",
		@"pageSize" : pageSize ? pageSize : @"",
		@"sortBy" : sortBy ? sortBy : @"",
		@"responseFields" : responseFields ? responseFields : @"",
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+ (MOZUURLComponents *)URLComponentsForGetCategoryOperationWithCategoryId:(NSInteger)categoryId allowInactive:(NSNumber *)allowInactive responseFields:(NSString *)responseFields {
	NSString *template = @"/api/commerce/catalog/storefront/categories/{categoryId}?allowInactive={allowInactive}&responseFields={responseFields}";
	NSDictionary *params = @{
		@"categoryId" : @(categoryId),
		@"allowInactive" : allowInactive ? allowInactive : @"",
		@"responseFields" : responseFields ? responseFields : @"",
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+ (MOZUURLComponents *)URLComponentsForGetCategoryTreeOperationWithResponseFields:(NSString *)responseFields {
	NSString *template = @"/api/commerce/catalog/storefront/categories/tree?responseFields={responseFields}";
	NSDictionary *params = @{
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