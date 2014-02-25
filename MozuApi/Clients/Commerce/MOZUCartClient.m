
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUCartClient.h"
#import "MOZUCartUrlComponents.h"
#import "MozuCart.h"
#import "MozuCartSummary.h"


@implementation MOZUCartClient

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+(MOZUClient*)clientForGetCartOperationWithCartId:(NSString*)cartId userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUCartURLComponents URLComponentsForGetCartOperationWithCartId:cartId];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	client.userClaims = userClaims;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUCart alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+(MOZUClient*)clientForGetOrCreateCartOperationWithUserClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUCartURLComponents URLComponentsForGetOrCreateCartOperation];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	client.userClaims = userClaims;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUCart alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+(MOZUClient*)clientForGetCartSummaryOperationWithUserClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUCartURLComponents URLComponentsForGetCartSummaryOperation];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	client.userClaims = userClaims;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUCartSummary alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+(MOZUClient*)clientForGetUserCartOperationWithUserId:(NSString*)userId userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUCartURLComponents URLComponentsForGetUserCartOperationWithUserId:userId];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	client.userClaims = userClaims;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUCart alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+(MOZUClient*)clientForGetUserCartSummaryOperationWithUserId:(NSString*)userId userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUCartURLComponents URLComponentsForGetUserCartSummaryOperationWithUserId:userId];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	client.userClaims = userClaims;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUCartSummary alloc] initWithString:jsonResult error:nil];
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

+(MOZUClient*)clientForUpdateCartOperationWithBody:(MOZUCart*)body userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUCartURLComponents URLComponentsForUpdateCartOperation];
	id verb = @"PUT";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	client.body = body;
	client.userClaims = userClaims;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUCart alloc] initWithString:jsonResult error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

+(MOZUClient*)clientForDeleteCartOperationWithCartId:(NSString*)cartId userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUCartURLComponents URLComponentsForDeleteCartOperationWithCartId:cartId];
	id verb = @"DELETE";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	client.userClaims = userClaims;
	return client;
}

+(MOZUClient*)clientForDeleteCurrentCartOperationWithUserClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUCartURLComponents URLComponentsForDeleteCurrentCartOperation];
	id verb = @"DELETE";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	client.userClaims = userClaims;
	return client;
}



@end