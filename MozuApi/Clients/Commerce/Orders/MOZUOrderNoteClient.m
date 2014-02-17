
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUOrderNoteClient.h"
#import "MOZUOrderNoteUrl.h"
#import "MozuOrderNote.h"


@implementation MOZUOrderNoteClient

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+(MOZUClient*)clientForGetOrderNotesOperationWithWithOrderId:(NSString*)orderId userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUOrderNoteURL URLForGetOrderNotesOperationWithOrderId:orderId];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	if (userClaims != nil) {
		client.userClaims = userClaims;
	}

	client.JSONParser = ^id(NSString *jsonResult) {
		NSArray * jsonAsArray = [[NSJSONSerialization JSONObjectWithData:[jsonResult dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
		return [MOZUOrderNote arrayOfModelFromDictionaries:jsonAsArray error:nil];
	}

	return client;
}

+(MOZUClient*)clientForGetOrderNoteOperationWithWithOrderId:(NSString*)orderId noteId:(NSString*)noteId userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUOrderNoteURL URLForGetOrderNoteOperationWithOrderId:orderId noteId:noteId];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	if (userClaims != nil) {
		client.userClaims = userClaims;
	}

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUOrderNote alloc] initWithString:jsonResult error:nil];
	}

	return client;
}


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

+(MOZUClient*)clientForCreateOrderNoteOperationWithWithOrderNote:(MOZUOrderNote*)orderNote orderId:(NSString*)orderId userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUOrderNoteURL URLForCreateOrderNoteOperationWithOrderId:orderId];
	id verb = @"POST";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	if (userClaims != nil) {
		client.userClaims = userClaims;
	}

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUOrderNote alloc] initWithString:jsonResult error:nil];
	}

	return client;
}


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

+(MOZUClient*)clientForUpdateOrderNoteOperationWithWithOrderNote:(MOZUOrderNote*)orderNote orderId:(NSString*)orderId noteId:(NSString*)noteId userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUOrderNoteURL URLForUpdateOrderNoteOperationWithOrderId:orderId noteId:noteId];
	id verb = @"PUT";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	if (userClaims != nil) {
		client.userClaims = userClaims;
	}

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUOrderNote alloc] initWithString:jsonResult error:nil];
	}

	return client;
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

+(MOZUClient*)clientForDeleteOrderNoteOperationWithWithOrderId:(NSString*)orderId noteId:(NSString*)noteId userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUOrderNoteURL URLForDeleteOrderNoteOperationWithOrderId:orderId noteId:noteId];
	id verb = @"DELETE";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	if (userClaims != nil) {
		client.userClaims = userClaims;
	}

	return client;
}



@end