
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUReturnClient.h"
#import "MOZUReturnURLComponents.h"
#import "MozuReturnItemCollection.h"
#import "MozuReturn.h"
#import "MozuReturnCollection.h"
#import "MozuReturnItem.h"
#import "MozuReasonCollection.h"
#import "MozuPaymentCollection.h"
#import "MozuPayment.h"


@implementation MOZUReturnClient

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+ (MOZUClient *)clientForGetReturnsOperationWithStartIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter responseFields:(NSString *)responseFields {
	id url = [MOZUReturnURLComponents URLComponentsForGetReturnsOperationWithStartIndex:startIndex pageSize:pageSize sortBy:sortBy filter:filter responseFields:responseFields];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUReturnCollection alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForGetAvailableReturnActionsOperationWithReturnId:(NSString *)returnId {
	id url = [MOZUReturnURLComponents URLComponentsForGetAvailableReturnActionsOperationWithReturnId:returnId];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	return client;
}

+ (MOZUClient *)clientForGetReturnItemOperationWithReturnId:(NSString *)returnId returnItemId:(NSString *)returnItemId responseFields:(NSString *)responseFields {
	id url = [MOZUReturnURLComponents URLComponentsForGetReturnItemOperationWithReturnId:returnId returnItemId:returnItemId responseFields:responseFields];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUReturnItem alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForGetReturnItemsOperationWithReturnId:(NSString *)returnId responseFields:(NSString *)responseFields {
	id url = [MOZUReturnURLComponents URLComponentsForGetReturnItemsOperationWithReturnId:returnId responseFields:responseFields];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUReturnItemCollection alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForGetAvailablePaymentActionsForReturnOperationWithReturnId:(NSString *)returnId paymentId:(NSString *)paymentId {
	id url = [MOZUReturnURLComponents URLComponentsForGetAvailablePaymentActionsForReturnOperationWithReturnId:returnId paymentId:paymentId];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	return client;
}

+ (MOZUClient *)clientForGetPaymentOperationWithReturnId:(NSString *)returnId paymentId:(NSString *)paymentId responseFields:(NSString *)responseFields {
	id url = [MOZUReturnURLComponents URLComponentsForGetPaymentOperationWithReturnId:returnId paymentId:paymentId responseFields:responseFields];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUPayment alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForGetPaymentsOperationWithReturnId:(NSString *)returnId responseFields:(NSString *)responseFields {
	id url = [MOZUReturnURLComponents URLComponentsForGetPaymentsOperationWithReturnId:returnId responseFields:responseFields];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUPaymentCollection alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForGetReturnOperationWithReturnId:(NSString *)returnId responseFields:(NSString *)responseFields {
	id url = [MOZUReturnURLComponents URLComponentsForGetReturnOperationWithReturnId:returnId responseFields:responseFields];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUReturn alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForGetReasonsOperationWithResponseFields:(NSString *)responseFields {
	id url = [MOZUReturnURLComponents URLComponentsForGetReasonsOperationWithResponseFields:responseFields];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUReasonCollection alloc] initWithString:jsonResult error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

+ (MOZUClient *)clientForCreateReturnOperationWithBody:(MOZUReturn *)body responseFields:(NSString *)responseFields {
	id url = [MOZUReturnURLComponents URLComponentsForCreateReturnOperationWithResponseFields:responseFields];
	id verb = @"POST";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	client.body = body;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUReturn alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForCreateReturnItemOperationWithBody:(MOZUReturnItem *)body returnId:(NSString *)returnId responseFields:(NSString *)responseFields {
	id url = [MOZUReturnURLComponents URLComponentsForCreateReturnItemOperationWithReturnId:returnId responseFields:responseFields];
	id verb = @"POST";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	client.body = body;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUReturn alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForPerformPaymentActionForReturnOperationWithBody:(MOZUPaymentAction *)body returnId:(NSString *)returnId paymentId:(NSString *)paymentId responseFields:(NSString *)responseFields {
	id url = [MOZUReturnURLComponents URLComponentsForPerformPaymentActionForReturnOperationWithReturnId:returnId paymentId:paymentId responseFields:responseFields];
	id verb = @"POST";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	client.body = body;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUReturn alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForCreatePaymentActionForReturnOperationWithBody:(MOZUPaymentAction *)body returnId:(NSString *)returnId responseFields:(NSString *)responseFields {
	id url = [MOZUReturnURLComponents URLComponentsForCreatePaymentActionForReturnOperationWithReturnId:returnId responseFields:responseFields];
	id verb = @"POST";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	client.body = body;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUReturn alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForPerformReturnActionsOperationWithBody:(MOZUReturnAction *)body responseFields:(NSString *)responseFields {
	id url = [MOZUReturnURLComponents URLComponentsForPerformReturnActionsOperationWithResponseFields:responseFields];
	id verb = @"POST";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	client.body = body;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUReturnCollection alloc] initWithString:jsonResult error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

+ (MOZUClient *)clientForUpdateReturnOperationWithBody:(MOZUReturn *)body returnId:(NSString *)returnId responseFields:(NSString *)responseFields {
	id url = [MOZUReturnURLComponents URLComponentsForUpdateReturnOperationWithReturnId:returnId responseFields:responseFields];
	id verb = @"PUT";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	client.body = body;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUReturn alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForResendReturnEmailOperationWithBody:(MOZUReturnAction *)body {
	id url = [MOZUReturnURLComponents URLComponentsForResendReturnEmailOperation];
	id verb = @"PUT";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	client.body = body;
	return client;
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

+ (MOZUClient *)clientForDeleteOrderItemOperationWithReturnId:(NSString *)returnId returnItemId:(NSString *)returnItemId {
	id url = [MOZUReturnURLComponents URLComponentsForDeleteOrderItemOperationWithReturnId:returnId returnItemId:returnItemId];
	id verb = @"DELETE";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUReturn alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForDeleteReturnOperationWithReturnId:(NSString *)returnId {
	id url = [MOZUReturnURLComponents URLComponentsForDeleteReturnOperationWithReturnId:returnId];
	id verb = @"DELETE";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	return client;
}



@end