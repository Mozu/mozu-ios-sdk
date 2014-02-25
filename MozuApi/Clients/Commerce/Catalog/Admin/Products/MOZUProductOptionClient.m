
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUProductOptionClient.h"
#import "MOZUProductOptionUrlComponents.h"
#import "MozuAdminProductOption.h"


@implementation MOZUProductOptionClient

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+(MOZUClient*)clientForGetOptionsOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode productCode:(NSString*)productCode userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUProductOptionURLComponents URLComponentsForGetOptionsOperationWithProductCode:productCode];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];

	client.userClaims = userClaims;

	client.JSONParser = ^id(NSString *jsonResult) {
		NSArray * jsonAsArray = [NSJSONSerialization JSONObjectWithData:[jsonResult dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
		return [MOZUAdminProductOption arrayOfModelsFromDictionaries:jsonAsArray error:nil];
	};

	return client;
}

+(MOZUClient*)clientForGetOptionOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode productCode:(NSString*)productCode attributeFQN:(NSString*)attributeFQN userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUProductOptionURLComponents URLComponentsForGetOptionOperationWithProductCode:productCode attributeFQN:attributeFQN];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];

	client.userClaims = userClaims;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUAdminProductOption alloc] initWithString:jsonResult error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

+(MOZUClient*)clientForAddOptionOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(MOZUAdminProductOption*)body productCode:(NSString*)productCode userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUProductOptionURLComponents URLComponentsForAddOptionOperationWithProductCode:productCode];
	id verb = @"POST";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];

	client.body = body;
	client.userClaims = userClaims;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUAdminProductOption alloc] initWithString:jsonResult error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

+(MOZUClient*)clientForUpdateOptionOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(MOZUAdminProductOption*)body productCode:(NSString*)productCode attributeFQN:(NSString*)attributeFQN userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUProductOptionURLComponents URLComponentsForUpdateOptionOperationWithProductCode:productCode attributeFQN:attributeFQN];
	id verb = @"PUT";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];

	client.body = body;
	client.userClaims = userClaims;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUAdminProductOption alloc] initWithString:jsonResult error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

+(MOZUClient*)clientForDeleteOptionOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode productCode:(NSString*)productCode attributeFQN:(NSString*)attributeFQN userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUProductOptionURLComponents URLComponentsForDeleteOptionOperationWithProductCode:productCode attributeFQN:attributeFQN];
	id verb = @"DELETE";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];

	client.userClaims = userClaims;
	return client;
}



@end