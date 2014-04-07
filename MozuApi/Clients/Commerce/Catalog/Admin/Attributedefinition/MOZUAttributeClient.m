
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUAttributeClient.h"
#import "MOZUAttributeURLComponents.h"
#import "MozuAttribute.h"
#import "MozuAttributeCollection.h"


@implementation MOZUAttributeClient

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+ (MOZUClient *)clientForGetAttributesOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode startIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter {
	id url = [MOZUAttributeURLComponents URLComponentsForGetAttributesOperationWithStartIndex:startIndex pageSize:pageSize sortBy:sortBy filter:filter];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUAttributeCollection alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForGetAttributeOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode attributeFQN:(NSString *)attributeFQN {
	id url = [MOZUAttributeURLComponents URLComponentsForGetAttributeOperationWithAttributeFQN:attributeFQN];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUAttribute alloc] initWithString:jsonResult error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

+ (MOZUClient *)clientForAddAttributeOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(MOZUAttribute *)body {
	id url = [MOZUAttributeURLComponents URLComponentsForAddAttributeOperation];
	id verb = @"POST";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];

	client.body = body;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUAttribute alloc] initWithString:jsonResult error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

+ (MOZUClient *)clientForUpdateAttributeOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(MOZUAttribute *)body attributeFQN:(NSString *)attributeFQN {
	id url = [MOZUAttributeURLComponents URLComponentsForUpdateAttributeOperationWithAttributeFQN:attributeFQN];
	id verb = @"PUT";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];

	client.body = body;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUAttribute alloc] initWithString:jsonResult error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

+ (MOZUClient *)clientForDeleteAttributeOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode attributeFQN:(NSString *)attributeFQN {
	id url = [MOZUAttributeURLComponents URLComponentsForDeleteAttributeOperationWithAttributeFQN:attributeFQN];
	id verb = @"DELETE";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];

	return client;
}



@end