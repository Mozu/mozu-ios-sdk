
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import <Foundation/Foundation.h>
#import "MOZUClient.h"
#import "MOZUAPIContext.h"

#import "MOZUAuthTicket.h"
#import "MOZUCustomerAccountAndAuthInfo.h"
#import "MOZUCustomerAccountCollection.h"
#import "MOZUCustomerAccount.h"
#import "MOZULoginState.h"
#import "MOZUCustomerLoginInfo.h"
#import "MOZUCustomerAuthTicket.h"
#import "MOZUResetPasswordInfo.h"


@interface MOZUCustomerAccountResource : NSObject
@property(readonly, nonatomic) MOZUAPIContext * apiContext;

-(id)initWithAPIContext:(MOZUAPIContext *)apiContext;

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieves a list of customer accounts.
@param fields The fields to include in the response.
@param filter A set of expressions that consist of a field, operator, and value and represent search parameter syntax when filtering results of a query. Valid operators include equals (eq), does not equal (ne), greater than (gt), less than (lt), greater than or equal to (ge), less than or equal to (le), starts with (sw), or contains (cont). For example - "filter=IsDisplayed+eq+true"
@param isAnonymous 
@param pageSize 
@param q A list of customer account search terms to use in the query when searching across customer name and email. Separate multiple search terms with a space character.
@param qLimit The maximum number of search results to return in the response. You can limit any range between 1-100.
@param sortBy 
@param startIndex 
*/

-(void)accountsWithWithStartIndex:(NSNumber*)startIndex pageSize:(NSNumber*)pageSize sortBy:(NSString*)sortBy filter:(NSString*)filter fields:(NSString*)fields q:(NSString*)q qLimit:(NSNumber*)qLimit isAnonymous:(NSNumber*)isAnonymous userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUCustomerAccountCollection* result, MOZUApiError* error, NSHTTPURLResponse* response))handler;

/**
Retrieve details of a customer account.
@param accountId Unique identifier of the customer account to retrieve.
*/

-(void)accountWithWithAccountId:(NSInteger)accountId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUCustomerAccount* result, MOZUApiError* error, NSHTTPURLResponse* response))handler;

/**
Retrieves the current login state of the customer account specified in the request.
@param accountId Unique identifier of the customer account.
*/

-(void)loginStateWithWithAccountId:(NSInteger)accountId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZULoginState* result, MOZUApiError* error, NSHTTPURLResponse* response))handler;


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

/**
Creates a new customer account based on the information specified in the request.
@param account Properties of the customer account to update.
*/

-(void)addAccountWithWithAccount:(MOZUCustomerAccount*)account userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUCustomerAccount* result, MOZUApiError* error, NSHTTPURLResponse* response))handler;

/**
Adds a new user login to a defined customer account.
@param customerAuthInfo The authentication information for the customer account.
@param accountId Unique identifier of the customer account.
*/

-(void)addLoginToExistingCustomerWithWithCustomerAuthInfo:(MOZUCustomerLoginInfo*)customerAuthInfo accountId:(NSInteger)accountId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUCustomerAuthTicket* result, MOZUApiError* error, NSHTTPURLResponse* response))handler;

/**
Updates the customer lifetime value of the specified customer account in the event of an order import or a lifetime value calculation error.
@param accountId The unique identifier of the customer account for which to calculate customer lifetime value.
*/

-(void)recomputeCustomerLifetimeValueWithWithAccountId:(NSInteger)accountId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUApiError* error, NSHTTPURLResponse* response))handler;

/**
Lock or unlock a customer account.
@param isLocked If true, the customer account is locked from logging in.
@param accountId The unique identifier of the customer account.
*/

-(void)setLoginLockedWithWithIsLocked:(BOOL)isLocked accountId:(NSInteger)accountId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUApiError* error, NSHTTPURLResponse* response))handler;

/**
Requires the password for the customer account to be changed.
@param isPasswordChangeRequired If true, the password for the customer account must be changed.
@param accountId Unique identifier of the customer account.
*/

-(void)setPasswordChangeRequiredWithWithIsPasswordChangeRequired:(BOOL)isPasswordChangeRequired accountId:(NSInteger)accountId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUApiError* error, NSHTTPURLResponse* response))handler;

/**
Creates a new customer account and logs the user associated with the customer account into the site.
@param accountAndAuthInfo Properties of the customer account to create, including the user authentication information.
*/

-(void)addAccountAndLoginWithWithAccountAndAuthInfo:(MOZUCustomerAccountAndAuthInfo*)accountAndAuthInfo userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUCustomerAuthTicket* result, MOZUApiError* error, NSHTTPURLResponse* response))handler;

/**
Creates multiple customer accounts based on the information specified in the request.
@param customers Properties of the customer accounts to create.
*/

-(void)addAccountsWithWithCustomers:(NSArray<MOZUCustomerAccountAndAuthInfo>*)customers userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUCustomerAccountCollection* result, MOZUApiError* error, NSHTTPURLResponse* response))handler;

/**
Retrieves the current login state of a customer account by providing the customer's email address.
@param emailAddress The email address associated with the customer account.
*/

-(void)loginStateByEmailAddressWithWithEmailAddress:(NSString*)emailAddress userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZULoginState* result, MOZUApiError* error, NSHTTPURLResponse* response))handler;

/**
Retrieves the current login state of a customer account by providing the user name associated with the customer account.
@param userName The user name associated with the customer account.
*/

-(void)loginStateByUserNameWithWithUserName:(NSString*)userName userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZULoginState* result, MOZUApiError* error, NSHTTPURLResponse* response))handler;

/**
Resets the password for a customer account.
@param resetPasswordInfo Information required to reset the password for a customer account.
*/

-(void)resetPasswordWithWithResetPasswordInfo:(MOZUResetPasswordInfo*)resetPasswordInfo userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUApiError* error, NSHTTPURLResponse* response))handler;


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

/**
Updates a customer account.
@param account Properties of the customer account to update.
@param accountId Unique identifier of the customer account.
*/

-(void)updateAccountWithWithAccount:(MOZUCustomerAccount*)account accountId:(NSInteger)accountId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUCustomerAccount* result, MOZUApiError* error, NSHTTPURLResponse* response))handler;


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Deletes a customer account. A customer account cannot be deleted if any orders exist, past or present.
@param accountId Unique identifier of the customer account to delete.
*/

-(void)deleteAccountWithWithAccountId:(NSInteger)accountId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUApiError* error, NSHTTPURLResponse* response))handler;



@end