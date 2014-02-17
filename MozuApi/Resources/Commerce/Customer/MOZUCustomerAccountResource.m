
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

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

-(void)accountsWithWithStartIndex:(NSNumber*)startIndex pageSize:(NSNumber*)pageSize sortBy:(NSString*)sortBy filter:(NSString*)filter fields:(NSString*)fields q:(NSString*)q qLimit:(NSNumber*)qLimit isAnonymous:(NSNumber*)isAnonymous userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUCustomerAccountCollection* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUCustomerAccountClient clientForGetAccountsOperationWithWithStartIndex:startIndex pageSize:pageSize sortBy:sortBy filter:filter fields:fields q:q qLimit:qLimit isAnonymous:isAnonymous userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

-(void)accountWithWithAccountId:(NSInteger)accountId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUCustomerAccount* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUCustomerAccountClient clientForGetAccountOperationWithWithAccountId:accountId userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

-(void)loginStateWithWithAccountId:(NSInteger)accountId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZULoginState* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUCustomerAccountClient clientForGetLoginStateOperationWithWithAccountId:accountId userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
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

-(void)addAccountWithWithAccount:(MOZUCustomerAccount*)account userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUCustomerAccount* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUCustomerAccountClient clientForAddAccountOperationWithWithAccount:account userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

-(void)addLoginToExistingCustomerWithWithCustomerAuthInfo:(MOZUCustomerLoginInfo*)customerAuthInfo accountId:(NSInteger)accountId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUCustomerAuthTicket* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUCustomerAccountClient clientForAddLoginToExistingCustomerOperationWithWithCustomerAuthInfo:customerAuthInfo accountId:accountId userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

-(void)recomputeCustomerLifetimeValueWithWithAccountId:(NSInteger)accountId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUCustomerAccountClient clientForRecomputeCustomerLifetimeValueOperationWithWithAccountId:accountId userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}

-(void)setLoginLockedWithWithIsLocked:(BOOL)isLocked accountId:(NSInteger)accountId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUCustomerAccountClient clientForSetLoginLockedOperationWithWithIsLocked:isLocked accountId:accountId userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}

-(void)setPasswordChangeRequiredWithWithIsPasswordChangeRequired:(BOOL)isPasswordChangeRequired accountId:(NSInteger)accountId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUCustomerAccountClient clientForSetPasswordChangeRequiredOperationWithWithIsPasswordChangeRequired:isPasswordChangeRequired accountId:accountId userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}

-(void)addAccountAndLoginWithWithAccountAndAuthInfo:(MOZUCustomerAccountAndAuthInfo*)accountAndAuthInfo userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUCustomerAuthTicket* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUCustomerAccountClient clientForAddAccountAndLoginOperationWithWithAccountAndAuthInfo:accountAndAuthInfo userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

-(void)addAccountsWithWithCustomers:(NSArray<MOZUCustomerAccountAndAuthInfo>*)customers userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUCustomerAccountCollection* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUCustomerAccountClient clientForAddAccountsOperationWithWithCustomers:customers userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

-(void)loginStateByEmailAddressWithWithEmailAddress:(NSString*)emailAddress userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZULoginState* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUCustomerAccountClient clientForGetLoginStateByEmailAddressOperationWithWithEmailAddress:emailAddress userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

-(void)loginStateByUserNameWithWithUserName:(NSString*)userName userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZULoginState* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUCustomerAccountClient clientForGetLoginStateByUserNameOperationWithWithUserName:userName userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

-(void)resetPasswordWithWithResetPasswordInfo:(MOZUResetPasswordInfo*)resetPasswordInfo userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUCustomerAccountClient clientForResetPasswordOperationWithWithResetPasswordInfo:resetPasswordInfo userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
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

-(void)updateAccountWithWithAccount:(MOZUCustomerAccount*)account accountId:(NSInteger)accountId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUCustomerAccount* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUCustomerAccountClient clientForUpdateAccountOperationWithWithAccount:account accountId:accountId userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
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

-(void)deleteAccountWithWithAccountId:(NSInteger)accountId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUCustomerAccountClient clientForDeleteAccountOperationWithWithAccountId:accountId userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}



@end