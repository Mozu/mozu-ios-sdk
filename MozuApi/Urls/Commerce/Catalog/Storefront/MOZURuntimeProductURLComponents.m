/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZURuntimeProductURLComponents.h"

@implementation MOZURuntimeProductURLComponents

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+ (MOZUURLComponents *)URLComponentsForGetProductsOperationWithFilter:(NSString *)filter startIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy responseFields:(NSString *)responseFields {
	NSString *template = @"/api/commerce/catalog/storefront/products/?filter={filter}&startIndex={startIndex}&pageSize={pageSize}&sortBy={sortBy}&responseFields={responseFields}";
	NSDictionary *params = @{
		@"filter" : filter ? filter : @"",
		@"startIndex" : startIndex ? startIndex : @"",
		@"pageSize" : pageSize ? pageSize : @"",
		@"sortBy" : sortBy ? sortBy : @"",
		@"responseFields" : responseFields ? responseFields : @"",
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+ (MOZUURLComponents *)URLComponentsForGetProductInventoryOperationWithProductCode:(NSString *)productCode locationCodes:(NSString *)locationCodes responseFields:(NSString *)responseFields {
	NSString *template = @"/api/commerce/catalog/storefront/products/{productCode}/locationinventory?locationCodes={locationCodes}&responseFields={responseFields}";
	NSDictionary *params = @{
		@"productCode" : productCode,
		@"locationCodes" : locationCodes ? locationCodes : @"",
		@"responseFields" : responseFields ? responseFields : @"",
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+ (MOZUURLComponents *)URLComponentsForGetProductOperationWithProductCode:(NSString *)productCode variationProductCode:(NSString *)variationProductCode allowInactive:(NSNumber *)allowInactive skipInventoryCheck:(NSNumber *)skipInventoryCheck supressOutOfStock404:(NSNumber *)supressOutOfStock404 responseFields:(NSString *)responseFields {
	NSString *template = @"/api/commerce/catalog/storefront/products/{productCode}?variationProductCode={variationProductCode}&allowInactive={allowInactive}&skipInventoryCheck={skipInventoryCheck}&supressOutOfStock404={supressOutOfStock404}&responseFields={responseFields}";
	NSDictionary *params = @{
		@"productCode" : productCode,
		@"variationProductCode" : variationProductCode ? variationProductCode : @"",
		@"allowInactive" : allowInactive ? allowInactive : @"",
		@"skipInventoryCheck" : skipInventoryCheck ? skipInventoryCheck : @"",
		@"supressOutOfStock404" : supressOutOfStock404 ? supressOutOfStock404 : @"",
		@"responseFields" : responseFields ? responseFields : @"",
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+ (MOZUURLComponents *)URLComponentsForGetProductForIndexingOperationWithProductCode:(NSString *)productCode responseFields:(NSString *)responseFields {
	NSString *template = @"/api/commerce/catalog/storefront/products/indexing/{productCode}?responseFields={responseFields}";
	NSDictionary *params = @{
		@"productCode" : productCode,
		@"responseFields" : responseFields ? responseFields : @"",
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

+ (MOZUURLComponents *)URLComponentsForConfiguredProductOperationWithProductCode:(NSString *)productCode includeOptionDetails:(NSNumber *)includeOptionDetails skipInventoryCheck:(NSNumber *)skipInventoryCheck responseFields:(NSString *)responseFields {
	NSString *template = @"/api/commerce/catalog/storefront/products/{productCode}/configure?includeOptionDetails={includeOptionDetails}&skipInventoryCheck={skipInventoryCheck}&responseFields={responseFields}";
	NSDictionary *params = @{
		@"productCode" : productCode,
		@"includeOptionDetails" : includeOptionDetails ? includeOptionDetails : @"",
		@"skipInventoryCheck" : skipInventoryCheck ? skipInventoryCheck : @"",
		@"responseFields" : responseFields ? responseFields : @"",
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+ (MOZUURLComponents *)URLComponentsForValidateProductOperationWithProductCode:(NSString *)productCode skipInventoryCheck:(NSNumber *)skipInventoryCheck responseFields:(NSString *)responseFields {
	NSString *template = @"/api/commerce/catalog/storefront/products/{productCode}/validate?skipInventoryCheck={skipInventoryCheck}&responseFields={responseFields}";
	NSDictionary *params = @{
		@"productCode" : productCode,
		@"skipInventoryCheck" : skipInventoryCheck ? skipInventoryCheck : @"",
		@"responseFields" : responseFields ? responseFields : @"",
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+ (MOZUURLComponents *)URLComponentsForValidateDiscountsOperationWithProductCode:(NSString *)productCode variationProductCode:(NSString *)variationProductCode customerAccountId:(NSNumber *)customerAccountId allowInactive:(NSNumber *)allowInactive skipInventoryCheck:(NSNumber *)skipInventoryCheck responseFields:(NSString *)responseFields {
	NSString *template = @"/api/commerce/catalog/storefront/products/{productCode}/validateDiscounts?variationProductCode={variationProductCode}&customerAccountId={customerAccountId}&allowInactive={allowInactive}&skipInventoryCheck={skipInventoryCheck}&responseFields={responseFields}";
	NSDictionary *params = @{
		@"productCode" : productCode,
		@"variationProductCode" : variationProductCode ? variationProductCode : @"",
		@"customerAccountId" : customerAccountId ? customerAccountId : @"",
		@"allowInactive" : allowInactive ? allowInactive : @"",
		@"skipInventoryCheck" : skipInventoryCheck ? skipInventoryCheck : @"",
		@"responseFields" : responseFields ? responseFields : @"",
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+ (MOZUURLComponents *)URLComponentsForGetProductInventoriesOperationWithResponseFields:(NSString *)responseFields {
	NSString *template = @"/api/commerce/catalog/storefront/products/locationinventory?responseFields={responseFields}";
	NSDictionary *params = @{
		@"responseFields" : responseFields ? responseFields : @"",
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}


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