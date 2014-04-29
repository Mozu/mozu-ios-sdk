/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZULocationURLComponents.h"

@implementation MOZULocationURLComponents

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+ (MOZUURLComponents *)URLComponentsForGetLocationOperationWithCode:(NSString *)code {
	NSString *template = @"/api/commerce/storefront/locations/{code}";
	NSDictionary *params = @{
		@"code" : code,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+ (MOZUURLComponents *)URLComponentsForGetLocationInUsageTypeOperationWithLocationUsageType:(NSString *)locationUsageType code:(NSString *)code {
	NSString *template = @"/api/commerce/storefront/locationUsageTypes/{locationUsageType}/locations/{code}";
	NSDictionary *params = @{
		@"locationUsageType" : locationUsageType,
		@"code" : code,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+ (MOZUURLComponents *)URLComponentsForGetLocationsInUsageTypeOperationWithLocationUsageType:(NSString *)locationUsageType startIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter {
	NSString *template = @"/api/commerce/storefront/locationUsageTypes/{locationUsageType}/locations?startIndex={startIndex}&pageSize={pageSize}&sortBy={sortBy}&filter={filter}";
	NSDictionary *params = @{
		@"locationUsageType" : locationUsageType,
		@"startIndex" : startIndex ? startIndex : @"",
		@"pageSize" : pageSize ? pageSize : @"",
		@"sortBy" : sortBy ? sortBy : @"",
		@"filter" : filter ? filter : @"",
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+ (MOZUURLComponents *)URLComponentsForGetDirectShipLocationOperation {
	NSString *template = @"/api/commerce/storefront/locationUsageTypes/DS/location";
	NSDictionary *params = nil;

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+ (MOZUURLComponents *)URLComponentsForGetInStorePickupLocationOperationWithCode:(NSString *)code {
	NSString *template = @"/api/commerce/storefront/locationUsageTypes/SP/locations/{code}";
	NSDictionary *params = @{
		@"code" : code,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+ (MOZUURLComponents *)URLComponentsForGetInStorePickupLocationsOperationWithStartIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter {
	NSString *template = @"/api/commerce/storefront/locationUsageTypes/SP/locations?startIndex={startIndex}&pageSize={pageSize}&sortBy={sortBy}&filter={filter}";
	NSDictionary *params = @{
		@"startIndex" : startIndex ? startIndex : @"",
		@"pageSize" : pageSize ? pageSize : @"",
		@"sortBy" : sortBy ? sortBy : @"",
		@"filter" : filter ? filter : @"",
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