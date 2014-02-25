
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUDocumentClient.h"
#import "MOZUDocumentUrlComponents.h"
#import "MozuDocument.h"
#import "MozuDocumentCollection.h"


@implementation MOZUDocumentClient

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+(MOZUClient*)clientForGetDocumentOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode documentListName:(NSString*)documentListName documentId:(NSString*)documentId userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUDocumentURLComponents URLComponentsForGetDocumentOperationWithDocumentListName:documentListName documentId:documentId];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];

	client.userClaims = userClaims;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUDocument alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+(MOZUClient*)clientForGetDocumentContentOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode documentListName:(NSString*)documentListName documentId:(NSString*)documentId userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUDocumentURLComponents URLComponentsForGetDocumentContentOperationWithDocumentListName:documentListName documentId:documentId];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];

	client.userClaims = userClaims;
	return client;
}

+(MOZUClient*)clientForGetDocumentsOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode documentListName:(NSString*)documentListName filter:(NSString*)filter sortBy:(NSString*)sortBy pageSize:(NSNumber*)pageSize startIndex:(NSNumber*)startIndex userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUDocumentURLComponents URLComponentsForGetDocumentsOperationWithDocumentListName:documentListName filter:filter sortBy:sortBy pageSize:pageSize startIndex:startIndex];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];

	client.userClaims = userClaims;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUDocumentCollection alloc] initWithString:jsonResult error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

+(MOZUClient*)clientForCreateDocumentOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(MOZUDocument*)body documentListName:(NSString*)documentListName userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUDocumentURLComponents URLComponentsForCreateDocumentOperationWithDocumentListName:documentListName];
	id verb = @"POST";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];

	client.body = body;
	client.userClaims = userClaims;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUDocument alloc] initWithString:jsonResult error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

+(MOZUClient*)clientForUpdateDocumentOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(MOZUDocument*)body documentListName:(NSString*)documentListName documentId:(NSString*)documentId userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUDocumentURLComponents URLComponentsForUpdateDocumentOperationWithDocumentListName:documentListName documentId:documentId];
	id verb = @"PUT";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];

	client.body = body;
	client.userClaims = userClaims;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUDocument alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+(MOZUClient*)clientForUpdateDocumentContentOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(NSInputStream*)body documentListName:(NSString*)documentListName documentId:(NSString*)documentId userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUDocumentURLComponents URLComponentsForUpdateDocumentContentOperationWithDocumentListName:documentListName documentId:documentId];
	id verb = @"PUT";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];

	client.body = body;
	client.userClaims = userClaims;
	return client;
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

+(MOZUClient*)clientForDeleteDocumentOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode documentListName:(NSString*)documentListName documentId:(NSString*)documentId userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUDocumentURLComponents URLComponentsForDeleteDocumentOperationWithDocumentListName:documentListName documentId:documentId];
	id verb = @"DELETE";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];

	client.userClaims = userClaims;
	return client;
}

+(MOZUClient*)clientForDeleteDocumentContentOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode documentListName:(NSString*)documentListName documentId:(NSString*)documentId userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUDocumentURLComponents URLComponentsForDeleteDocumentContentOperationWithDocumentListName:documentListName documentId:documentId];
	id verb = @"DELETE";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];

	client.userClaims = userClaims;
	return client;
}



@end