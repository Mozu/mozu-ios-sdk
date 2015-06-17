
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUCustomerContactClient.h"
#import "MOZUCustomerContactResource.h"


@interface MOZUCustomerContactResource()
@property(readwrite, nonatomic) MOZUAPIContext * apiContext;
@end

@implementation MOZUCustomerContactResource

-(id)initWithAPIContext:(MOZUAPIContext *)apiContext {
	if (self = [super init]) {
		self.apiContext = apiContext;
		return self;
	}
	else {
		return nil;
	}
}


-(id)cloneWithAPIContextModification:(MOZUAPIContextModificationBlock)apiContextModification {
	MOZUAPIContext* cloned = [self.apiContext cloneWith:apiContextModification];
	return [self initWithAPIContext:cloned];
}

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieves the specified contact for a customer account such as a billing or shipping contact.
@param accountId Unique identifier of the customer account.
@param contactId Unique identifer of the customer account contact being updated.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)accountContactWithAccountId:(NSInteger)accountId contactId:(NSInteger)contactId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUCustomerContact *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerContactClient clientForGetAccountContactOperationWithAccountId:accountId contactId:contactId responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Retrieves a list of contacts for a customer according to any specified filter criteria and sort options.
@param accountId Unique identifier of the customer account.
@param filter A set of expressions that consist of a field, operator, and value and represent search parameter syntax when filtering results of a query. Valid operators include equals (eq), does not equal (ne), greater than (gt), less than (lt), greater than or equal to (ge), less than or equal to (le), starts with (sw), or contains (cont). For example - "filter=IsDisplayed+eq+true"
@param pageSize The number of results to display on each page when creating paged results from a query. The maximum value is 200.
@param responseFields Use this field to include those fields which are not included by default.
@param sortBy 
@param startIndex 
*/

- (void)accountContactsWithAccountId:(NSInteger)accountId startIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUCustomerContactCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerContactClient clientForGetAccountContactsOperationWithAccountId:accountId startIndex:startIndex pageSize:pageSize sortBy:sortBy filter:filter responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

/**
Creates a new contact for a customer account such as a new shipping address.
@param body Contact information, including the contact's name, address, phone numbers, email addresses, and company (if supplied). Also indicates whether this is a billing, shipping, or billing and shipping contact.
@param accountId Unique identifier of the customer account.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)addAccountContactWithBody:(MOZUCustomerContact *)body accountId:(NSInteger)accountId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUCustomerContact *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerContactClient clientForAddAccountContactOperationWithBody:body accountId:accountId responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

/**
Updates a contact for a specified customer account such as to update addresses or change which contact is the primary contact for billing.
@param body Contact information, including the contact's name, address, phone numbers, email addresses, and company (if supplied). Also indicates whether this is a billing, shipping, or billing and shipping contact.
@param accountId Unique identifier of the customer account.
@param contactId Unique identifer of the customer account contact being updated.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)updateAccountContactWithBody:(MOZUCustomerContact *)body accountId:(NSInteger)accountId contactId:(NSInteger)contactId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUCustomerContact *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerContactClient clientForUpdateAccountContactOperationWithBody:body accountId:accountId contactId:contactId responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Deletes a contact for the specified customer account.
@param accountId Unique identifier of the customer account.
@param contactId Unique identifer of the customer account contact being updated.
*/

- (void)deleteAccountContactWithAccountId:(NSInteger)accountId contactId:(NSInteger)contactId completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerContactClient clientForDeleteAccountContactOperationWithAccountId:accountId contactId:contactId];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}



@end