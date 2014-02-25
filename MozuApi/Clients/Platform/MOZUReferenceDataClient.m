
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUReferenceDataClient.h"
#import "MOZUReferenceDataUrlComponents.h"
#import "MozuTopLevelDomainCollection.h"
#import "MozuContentLocaleCollection.h"
#import "MozuBehaviorCollection.h"
#import "MozuCountryCollection.h"
#import "MozuTimeZoneCollection.h"
#import "MozuBehaviorCategoryCollection.h"
#import "MozuBehaviorCategory.h"
#import "MozuCurrencyCollection.h"
#import "MozuAddressSchemaCollection.h"
#import "MozuBehavior.h"
#import "MozuUnitOfMeasureCollection.h"
#import "MozuAddressSchema.h"


@implementation MOZUReferenceDataClient

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+(MOZUClient*)clientForGetAddressSchemaOperationWithCountryCode:(NSString*)countryCode {
	id url = [MOZUReferenceDataURLComponents URLComponentsForGetAddressSchemaOperationWithCountryCode:countryCode];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUAddressSchema alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+(MOZUClient*)clientForGetAddressSchemasOperation {
	id url = [MOZUReferenceDataURLComponents URLComponentsForGetAddressSchemasOperation];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUAddressSchemaCollection alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+(MOZUClient*)clientForGetBehaviorOperationWithBehaviorId:(NSInteger)behaviorId {
	id url = [MOZUReferenceDataURLComponents URLComponentsForGetBehaviorOperationWithBehaviorId:behaviorId];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUBehavior alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+(MOZUClient*)clientForGetBehaviorCategoriesOperation {
	id url = [MOZUReferenceDataURLComponents URLComponentsForGetBehaviorCategoriesOperation];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUBehaviorCategoryCollection alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+(MOZUClient*)clientForGetBehaviorCategoryOperationWithCategoryId:(NSInteger)categoryId {
	id url = [MOZUReferenceDataURLComponents URLComponentsForGetBehaviorCategoryOperationWithCategoryId:categoryId];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUBehaviorCategory alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+(MOZUClient*)clientForGetBehaviorsOperationWithUserType:(NSString*)userType {
	id url = [MOZUReferenceDataURLComponents URLComponentsForGetBehaviorsOperationWithUserType:userType];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUBehaviorCollection alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+(MOZUClient*)clientForGetContentLocalesOperation {
	id url = [MOZUReferenceDataURLComponents URLComponentsForGetContentLocalesOperation];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUContentLocaleCollection alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+(MOZUClient*)clientForGetCountriesOperation {
	id url = [MOZUReferenceDataURLComponents URLComponentsForGetCountriesOperation];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUCountryCollection alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+(MOZUClient*)clientForGetCurrenciesOperation {
	id url = [MOZUReferenceDataURLComponents URLComponentsForGetCurrenciesOperation];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUCurrencyCollection alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+(MOZUClient*)clientForGetTimeZonesOperation {
	id url = [MOZUReferenceDataURLComponents URLComponentsForGetTimeZonesOperation];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUTimeZoneCollection alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+(MOZUClient*)clientForGetTopLevelDomainsOperation {
	id url = [MOZUReferenceDataURLComponents URLComponentsForGetTopLevelDomainsOperation];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUTopLevelDomainCollection alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+(MOZUClient*)clientForGetUnitsOfMeasureOperationWithFilter:(NSString*)filter {
	id url = [MOZUReferenceDataURLComponents URLComponentsForGetUnitsOfMeasureOperationWithFilter:filter];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUUnitOfMeasureCollection alloc] initWithString:jsonResult error:nil];
	};

	return client;
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