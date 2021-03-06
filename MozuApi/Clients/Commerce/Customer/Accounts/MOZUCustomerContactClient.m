
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUCustomerContactClient.h"
#import "MOZUCustomerContactURLComponents.h"
#import "MozuCustomerContact.h"
#import "MozuCustomerContactCollection.h"


@implementation MOZUCustomerContactClient

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+ (MOZUClient *)clientForGetAccountContactOperationWithAccountId:(NSInteger)accountId contactId:(NSInteger)contactId responseFields:(NSString *)responseFields {
	id url = [MOZUCustomerContactURLComponents URLComponentsForGetAccountContactOperationWithAccountId:accountId contactId:contactId responseFields:responseFields];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUCustomerContact alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForGetAccountContactsOperationWithAccountId:(NSInteger)accountId startIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter responseFields:(NSString *)responseFields {
	id url = [MOZUCustomerContactURLComponents URLComponentsForGetAccountContactsOperationWithAccountId:accountId startIndex:startIndex pageSize:pageSize sortBy:sortBy filter:filter responseFields:responseFields];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUCustomerContactCollection alloc] initWithString:jsonResult error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

+ (MOZUClient *)clientForAddAccountContactOperationWithBody:(MOZUCustomerContact *)body accountId:(NSInteger)accountId responseFields:(NSString *)responseFields {
	id url = [MOZUCustomerContactURLComponents URLComponentsForAddAccountContactOperationWithAccountId:accountId responseFields:responseFields];
	id verb = @"POST";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	client.body = body;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUCustomerContact alloc] initWithString:jsonResult error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

+ (MOZUClient *)clientForUpdateAccountContactOperationWithBody:(MOZUCustomerContact *)body accountId:(NSInteger)accountId contactId:(NSInteger)contactId responseFields:(NSString *)responseFields {
	id url = [MOZUCustomerContactURLComponents URLComponentsForUpdateAccountContactOperationWithAccountId:accountId contactId:contactId responseFields:responseFields];
	id verb = @"PUT";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	client.body = body;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUCustomerContact alloc] initWithString:jsonResult error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

+ (MOZUClient *)clientForDeleteAccountContactOperationWithAccountId:(NSInteger)accountId contactId:(NSInteger)contactId {
	id url = [MOZUCustomerContactURLComponents URLComponentsForDeleteAccountContactOperationWithAccountId:accountId contactId:contactId];
	id verb = @"DELETE";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	return client;
}



@end