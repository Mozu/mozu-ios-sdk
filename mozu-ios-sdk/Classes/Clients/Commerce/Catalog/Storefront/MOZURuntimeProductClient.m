
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZURuntimeProductClient.h"
#import "MOZURuntimeProductURLComponents.h"
#import "MozuRuntimeLocationInventoryCollection.h"
#import "MozuProductValidationSummary.h"
#import "MozuConfiguredProduct.h"
#import "MozuRuntimeProductCollection.h"
#import "MozuDiscountValidationSummary.h"
#import "MozuRuntimeProduct.h"


@implementation MOZURuntimeProductClient

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+ (MOZUClient *)clientForGetProductsOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode filter:(NSString *)filter startIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy responseFields:(NSString *)responseFields {
	id url = [MOZURuntimeProductURLComponents URLComponentsForGetProductsOperationWithFilter:filter startIndex:startIndex pageSize:pageSize sortBy:sortBy responseFields:responseFields];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZURuntimeProductCollection alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForGetProductInventoryOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode productCode:(NSString *)productCode locationCodes:(NSString *)locationCodes responseFields:(NSString *)responseFields {
	id url = [MOZURuntimeProductURLComponents URLComponentsForGetProductInventoryOperationWithProductCode:productCode locationCodes:locationCodes responseFields:responseFields];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZURuntimeLocationInventoryCollection alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForGetProductOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode productCode:(NSString *)productCode variationProductCode:(NSString *)variationProductCode allowInactive:(NSNumber *)allowInactive skipInventoryCheck:(NSNumber *)skipInventoryCheck supressOutOfStock404:(NSNumber *)supressOutOfStock404 quantity:(NSNumber *)quantity responseFields:(NSString *)responseFields {
	id url = [MOZURuntimeProductURLComponents URLComponentsForGetProductOperationWithProductCode:productCode variationProductCode:variationProductCode allowInactive:allowInactive skipInventoryCheck:skipInventoryCheck supressOutOfStock404:supressOutOfStock404 quantity:quantity responseFields:responseFields];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZURuntimeProduct alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForGetProductForIndexingOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode productCode:(NSString *)productCode productVersion:(NSNumber *)productVersion responseFields:(NSString *)responseFields {
	id url = [MOZURuntimeProductURLComponents URLComponentsForGetProductForIndexingOperationWithProductCode:productCode productVersion:productVersion responseFields:responseFields];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZURuntimeProduct alloc] initWithString:jsonResult error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

+ (MOZUClient *)clientForConfiguredProductOperationWithBody:(MOZUProductOptionSelections *)body productCode:(NSString *)productCode includeOptionDetails:(NSNumber *)includeOptionDetails skipInventoryCheck:(NSNumber *)skipInventoryCheck quantity:(NSNumber *)quantity responseFields:(NSString *)responseFields {
	id url = [MOZURuntimeProductURLComponents URLComponentsForConfiguredProductOperationWithProductCode:productCode includeOptionDetails:includeOptionDetails skipInventoryCheck:skipInventoryCheck quantity:quantity responseFields:responseFields];
	id verb = @"POST";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	client.body = body;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUConfiguredProduct alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForValidateProductOperationWithBody:(MOZUProductOptionSelections *)body productCode:(NSString *)productCode skipInventoryCheck:(NSNumber *)skipInventoryCheck quantity:(NSNumber *)quantity responseFields:(NSString *)responseFields {
	id url = [MOZURuntimeProductURLComponents URLComponentsForValidateProductOperationWithProductCode:productCode skipInventoryCheck:skipInventoryCheck quantity:quantity responseFields:responseFields];
	id verb = @"POST";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	client.body = body;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUProductValidationSummary alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForValidateDiscountsOperationWithBody:(MOZUDiscountSelections *)body productCode:(NSString *)productCode variationProductCode:(NSString *)variationProductCode customerAccountId:(NSNumber *)customerAccountId allowInactive:(NSNumber *)allowInactive skipInventoryCheck:(NSNumber *)skipInventoryCheck responseFields:(NSString *)responseFields {
	id url = [MOZURuntimeProductURLComponents URLComponentsForValidateDiscountsOperationWithProductCode:productCode variationProductCode:variationProductCode customerAccountId:customerAccountId allowInactive:allowInactive skipInventoryCheck:skipInventoryCheck responseFields:responseFields];
	id verb = @"POST";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	client.body = body;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUDiscountValidationSummary alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForGetProductInventoriesOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(MOZULocationInventoryQuery *)body responseFields:(NSString *)responseFields {
	id url = [MOZURuntimeProductURLComponents URLComponentsForGetProductInventoriesOperationWithResponseFields:responseFields];
	id verb = @"POST";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];

	client.body = body;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZURuntimeLocationInventoryCollection alloc] initWithString:jsonResult error:nil];
	};

	return client;
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