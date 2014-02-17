
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUDocumentClient.h"
#import "MOZUDocumentUrl.h"
#import "MozuDocument.h"
#import "MozuDocumentCollection.h"


@implementation MOZUDocumentClient

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+(MOZUClient*)clientForGetDocumentOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode documentListName:(NSString*)documentListName documentId:(NSString*)documentId userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUDocumentURL URLForGetDocumentOperationWithDocumentListName:documentListName documentId:documentId];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];
	[client setHeader:kX_VOL_DATAVIEW_MODE value:dataViewMode];

	if (userClaims != nil) {
		client.userClaims = userClaims;
	}

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUDocument alloc] initWithString:jsonResult error:nil];
	}

	return client;
}

+(MOZUClient*)clientForGetDocumentContentOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode documentListName:(NSString*)documentListName documentId:(NSString*)documentId userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUDocumentURL URLForGetDocumentContentOperationWithDocumentListName:documentListName documentId:documentId];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];
	[client setHeader:kX_VOL_DATAVIEW_MODE value:dataViewMode];

	if (userClaims != nil) {
		client.userClaims = userClaims;
	}

	return client;
}

+(MOZUClient*)clientForGetDocumentsOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode documentListName:(NSString*)documentListName filter:(NSString*)filter sortBy:(NSString*)sortBy pageSize:(NSNumber*)pageSize startIndex:(NSNumber*)startIndex userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUDocumentURL URLForGetDocumentsOperationWithDocumentListName:documentListName filter:filter sortBy:sortBy pageSize:pageSize startIndex:startIndex];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];
	[client setHeader:kX_VOL_DATAVIEW_MODE value:dataViewMode];

	if (userClaims != nil) {
		client.userClaims = userClaims;
	}

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUDocumentCollection alloc] initWithString:jsonResult error:nil];
	}

	return client;
}


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

+(MOZUClient*)clientForCreateDocumentOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode document:(MOZUDocument*)document documentListName:(NSString*)documentListName userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUDocumentURL URLForCreateDocumentOperationWithDocumentListName:documentListName];
	id verb = @"POST";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];
	[client setHeader:kX_VOL_DATAVIEW_MODE value:dataViewMode];

	if (userClaims != nil) {
		client.userClaims = userClaims;
	}

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUDocument alloc] initWithString:jsonResult error:nil];
	}

	return client;
}


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

+(MOZUClient*)clientForUpdateDocumentOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode document:(MOZUDocument*)document documentListName:(NSString*)documentListName documentId:(NSString*)documentId userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUDocumentURL URLForUpdateDocumentOperationWithDocumentListName:documentListName documentId:documentId];
	id verb = @"PUT";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];
	[client setHeader:kX_VOL_DATAVIEW_MODE value:dataViewMode];

	if (userClaims != nil) {
		client.userClaims = userClaims;
	}

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUDocument alloc] initWithString:jsonResult error:nil];
	}

	return client;
}

+(MOZUClient*)clientForUpdateDocumentContentOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode stream:(NSInputStream*)stream documentListName:(NSString*)documentListName documentId:(NSString*)documentId userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUDocumentURL URLForUpdateDocumentContentOperationWithDocumentListName:documentListName documentId:documentId];
	id verb = @"PUT";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];
	[client setHeader:kX_VOL_DATAVIEW_MODE value:dataViewMode];

	if (userClaims != nil) {
		client.userClaims = userClaims;
	}

	return client;
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

+(MOZUClient*)clientForDeleteDocumentOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode documentListName:(NSString*)documentListName documentId:(NSString*)documentId userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUDocumentURL URLForDeleteDocumentOperationWithDocumentListName:documentListName documentId:documentId];
	id verb = @"DELETE";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];
	[client setHeader:kX_VOL_DATAVIEW_MODE value:dataViewMode];

	if (userClaims != nil) {
		client.userClaims = userClaims;
	}

	return client;
}

+(MOZUClient*)clientForDeleteDocumentContentOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode documentListName:(NSString*)documentListName documentId:(NSString*)documentId userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUDocumentURL URLForDeleteDocumentContentOperationWithDocumentListName:documentListName documentId:documentId];
	id verb = @"DELETE";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];
	[client setHeader:kX_VOL_DATAVIEW_MODE value:dataViewMode];

	if (userClaims != nil) {
		client.userClaims = userClaims;
	}

	return client;
}



@end