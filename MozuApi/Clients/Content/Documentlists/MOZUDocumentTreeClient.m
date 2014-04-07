
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUDocumentTreeClient.h"
#import "MOZUDocumentTreeURLComponents.h"
#import "MozuDocument.h"


@implementation MOZUDocumentTreeClient

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+ (MOZUClient *)clientForGetTreeDocumentOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode documentListName:(NSString *)documentListName documentName:(NSString *)documentName {
	id url = [MOZUDocumentTreeURLComponents URLComponentsForGetTreeDocumentOperationWithDocumentListName:documentListName documentName:documentName];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUDocument alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForGetTreeDocumentContentOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode documentListName:(NSString *)documentListName documentName:(NSString *)documentName {
	id url = [MOZUDocumentTreeURLComponents URLComponentsForGetTreeDocumentContentOperationWithDocumentListName:documentListName documentName:documentName];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];

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

+ (MOZUClient *)clientForUpdateTreeDocumentContentOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(NSInputStream *)body documentListName:(NSString *)documentListName documentName:(NSString *)documentName {
	id url = [MOZUDocumentTreeURLComponents URLComponentsForUpdateTreeDocumentContentOperationWithDocumentListName:documentListName documentName:documentName];
	id verb = @"PUT";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];

	client.body = body;
	return client;
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

+ (MOZUClient *)clientForDeleteTreeDocumentContentOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(NSInputStream *)body documentListName:(NSString *)documentListName documentName:(NSString *)documentName {
	id url = [MOZUDocumentTreeURLComponents URLComponentsForDeleteTreeDocumentContentOperationWithDocumentListName:documentListName documentName:documentName];
	id verb = @"DELETE";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];

	client.body = body;
	return client;
}



@end