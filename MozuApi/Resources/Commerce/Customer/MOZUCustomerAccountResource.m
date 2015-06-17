
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUCustomerAccountClient.h"
#import "MOZUCustomerAccountResource.h"


@interface MOZUCustomerAccountResource()
@property(readwrite, nonatomic) MOZUAPIContext * apiContext;
@end

@implementation MOZUCustomerAccountResource

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
Retrieves a list of customer accounts.
@param fields The fields to include in the response.
@param filter A set of expressions that consist of a field, operator, and value and represent search parameter syntax when filtering results of a query. Valid operators include equals (eq), does not equal (ne), greater than (gt), less than (lt), greater than or equal to (ge), less than or equal to (le), starts with (sw), or contains (cont). For example - "filter=IsDisplayed+eq+true"
@param isAnonymous If true, retrieve anonymous shopper accounts in the response.
@param pageSize 
@param q A list of order search terms (not phrases) to use in the query when searching across order number and the name or email of the billing contact. When entering, separate multiple search terms with a space character.
@param qLimit The maximum number of search results to return in the response. You can limit any range between 1-100.
@param responseFields Use this field to include those fields which are not included by default.
@param sortBy 
@param startIndex 
*/

- (void)accountsWithStartIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter fields:(NSString *)fields q:(NSString *)q qLimit:(NSNumber *)qLimit isAnonymous:(NSNumber *)isAnonymous responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUCustomerAccountCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerAccountClient clientForGetAccountsOperationWithStartIndex:startIndex pageSize:pageSize sortBy:sortBy filter:filter fields:fields q:q qLimit:qLimit isAnonymous:isAnonymous responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Retrieves the current login state of the customer account specified in the request.
@param accountId Unique identifier of the customer account.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)loginStateWithAccountId:(NSInteger)accountId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZULoginState *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerAccountClient clientForGetLoginStateOperationWithAccountId:accountId responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Retrieve details of a customer account.
@param accountId Unique identifier of the customer account.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)accountWithAccountId:(NSInteger)accountId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUCustomerAccount *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerAccountClient clientForGetAccountOperationWithAccountId:accountId responseFields:responseFields];
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
Creates a new customer account based on the information specified in the request.
@param body Properties of the customer account.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)addAccountWithBody:(MOZUCustomerAccount *)body responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUCustomerAccount *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerAccountClient clientForAddAccountOperationWithBody:body responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Modify the password associated with a customer account.
@param body The information required to modify a shopper account password.
@param accountId Unique identifier of the customer account.
@param unlockAccount 
*/

- (void)changePasswordWithBody:(MOZUPasswordInfo *)body accountId:(NSInteger)accountId unlockAccount:(NSNumber *)unlockAccount completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerAccountClient clientForChangePasswordOperationWithBody:body accountId:accountId unlockAccount:unlockAccount];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}

/**
Adds a new user login to a defined customer account.
@param body The login information for a customer account.
@param accountId Unique identifier of the customer account.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)addLoginToExistingCustomerWithBody:(MOZUCustomerLoginInfo *)body accountId:(NSInteger)accountId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUCustomerAuthTicket *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerAccountClient clientForAddLoginToExistingCustomerOperationWithBody:body accountId:accountId responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Updates the customer lifetime value of the specified customer account in the event of an order import or a lifetime value calculation error.
@param accountId Unique identifier of the customer account.
*/

- (void)recomputeCustomerLifetimeValueWithAccountId:(NSInteger)accountId completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerAccountClient clientForRecomputeCustomerLifetimeValueOperationWithAccountId:accountId];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}

/**
Lock or unlock a customer account.
@param body If true, the customer account is locked from logging in.
@param accountId Unique identifier of the customer account.
*/

- (void)setLoginLockedWithBody:(BOOL)body accountId:(NSInteger)accountId completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerAccountClient clientForSetLoginLockedOperationWithBody:body accountId:accountId];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}

/**
Requires the password for the customer account to be changed.
@param body If true, the password for the customer account must be changed.
@param accountId Unique identifier of the customer account.
*/

- (void)setPasswordChangeRequiredWithBody:(BOOL)body accountId:(NSInteger)accountId completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerAccountClient clientForSetPasswordChangeRequiredOperationWithBody:body accountId:accountId];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}

/**
Creates a new customer account and logs the user associated with the customer account into the site.
@param body The authentication information associated with a customer account. The data includes the account properties such as the name, username, authorization access, and email address, the required password to match, and indicates if the account was imported from a third party resource. 
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)addAccountAndLoginWithBody:(MOZUCustomerAccountAndAuthInfo *)body responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUCustomerAuthTicket *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerAccountClient clientForAddAccountAndLoginOperationWithBody:body responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Creates multiple customer accounts based on the information specified in the request.
@param body The authentication information associated with a customer account. The data includes the account properties such as the name, username, authorization access, and email address, the required password to match, and indicates if the account was imported from a third party resource. 
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)addAccountsWithBody:(NSArray<MOZUCustomerAccountAndAuthInfo> *)body responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUCustomerAccountCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerAccountClient clientForAddAccountsOperationWithBody:body responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Changes a collection of shopper passwords
@param body Mozu.Customer.Contracts.AccountPasswordInfoCollection ApiType DOCUMENT_HERE 
@param responseFields A list or array of fields returned for a call. These fields may be customized and may be used for various types of data calls in Mozu. For example, responseFields are returned for retrieving or updating attributes, carts, and messages in Mozu.
*/

- (void)changePasswordsWithBody:(MOZUAccountPasswordInfoCollection *)body responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUChangePasswordResultCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerAccountClient clientForChangePasswordsOperationWithBody:body responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Retrieves the current login state of a customer account by providing the customer's email address.
@param emailAddress The email address associated with the customer account.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)loginStateByEmailAddressWithEmailAddress:(NSString *)emailAddress responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZULoginState *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerAccountClient clientForGetLoginStateByEmailAddressOperationWithEmailAddress:emailAddress responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Retrieves the current login state of a customer account by providing the user name associated with the customer account.
@param responseFields Use this field to include those fields which are not included by default.
@param userName The user name associated with the customer account.
*/

- (void)loginStateByUserNameWithUserName:(NSString *)userName responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZULoginState *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerAccountClient clientForGetLoginStateByUserNameOperationWithUserName:userName responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Resets the password for a customer account.
@param body Information required to reset the password for a customer account.
*/

- (void)resetPasswordWithBody:(MOZUResetPasswordInfo *)body completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerAccountClient clientForResetPasswordOperationWithBody:body];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

/**
Updates a customer account.
@param body Properties of the customer account.
@param accountId Unique identifier of the customer account.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)updateAccountWithBody:(MOZUCustomerAccount *)body accountId:(NSInteger)accountId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUCustomerAccount *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerAccountClient clientForUpdateAccountOperationWithBody:body accountId:accountId responseFields:responseFields];
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
Deletes a customer account. A customer account cannot be deleted if any orders exist, past or present.
@param accountId Unique identifier of the customer account.
*/

- (void)deleteAccountWithAccountId:(NSInteger)accountId completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerAccountClient clientForDeleteAccountOperationWithAccountId:accountId];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}



@end