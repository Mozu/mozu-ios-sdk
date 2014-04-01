/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUURLComponents.h"

@interface MOZUCustomerAccountURLComponents : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Resource Url Components for getAccounts
@param startIndex 
@param pageSize 
@param sortBy 
@param filter A set of expressions that consist of a field, operator, and value and represent search parameter syntax when filtering results of a query. Valid operators include equals (eq), does not equal (ne), greater than (gt), less than (lt), greater than or equal to (ge), less than or equal to (le), starts with (sw), or contains (cont). For example - "filter=IsDisplayed+eq+true"
@param fields The fields to include in the response.
@param q A list of customer account search terms to use in the query when searching across customer name and email. Separate multiple search terms with a space character.
@param qLimit The maximum number of search results to return in the response. You can limit any range between 1-100.
@param isAnonymous 
*/
+ (MOZUURLComponents *)URLComponentsForGetAccountsOperationWithStartIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter fields:(NSString *)fields q:(NSString *)q qLimit:(NSNumber *)qLimit isAnonymous:(NSNumber *)isAnonymous;

/**
Resource Url Components for getAccount
@param accountId Unique identifier of the customer account to retrieve.
*/
+ (MOZUURLComponents *)URLComponentsForGetAccountOperationWithAccountId:(NSInteger)accountId;

/**
Resource Url Components for getLoginState
@param accountId 
*/
+ (MOZUURLComponents *)URLComponentsForGetLoginStateOperationWithAccountId:(NSInteger)accountId;


//
#pragma mark -
#pragma mark POST Operations
#pragma mark -
//

/**
Resource Url Components for addAccount
*/
+ (MOZUURLComponents *)URLComponentsForAddAccountOperation;

/**
Resource Url Components for changePassword
@param accountId 
*/
+ (MOZUURLComponents *)URLComponentsForChangePasswordOperationWithAccountId:(NSInteger)accountId;

/**
Resource Url Components for addLoginToExistingCustomer
@param accountId 
*/
+ (MOZUURLComponents *)URLComponentsForAddLoginToExistingCustomerOperationWithAccountId:(NSInteger)accountId;

/**
Resource Url Components for recomputeCustomerLifetimeValue
@param accountId 
*/
+ (MOZUURLComponents *)URLComponentsForRecomputeCustomerLifetimeValueOperationWithAccountId:(NSInteger)accountId;

/**
Resource Url Components for setLoginLocked
@param accountId 
*/
+ (MOZUURLComponents *)URLComponentsForSetLoginLockedOperationWithAccountId:(NSInteger)accountId;

/**
Resource Url Components for setPasswordChangeRequired
@param accountId 
*/
+ (MOZUURLComponents *)URLComponentsForSetPasswordChangeRequiredOperationWithAccountId:(NSInteger)accountId;

/**
Resource Url Components for addAccountAndLogin
*/
+ (MOZUURLComponents *)URLComponentsForAddAccountAndLoginOperation;

/**
Resource Url Components for addAccounts
*/
+ (MOZUURLComponents *)URLComponentsForAddAccountsOperation;

/**
Resource Url Components for getLoginStateByEmailAddress
@param emailAddress 
*/
+ (MOZUURLComponents *)URLComponentsForGetLoginStateByEmailAddressOperationWithEmailAddress:(NSString *)emailAddress;

/**
Resource Url Components for getLoginStateByUserName
@param userName 
*/
+ (MOZUURLComponents *)URLComponentsForGetLoginStateByUserNameOperationWithUserName:(NSString *)userName;

/**
Resource Url Components for resetPassword
*/
+ (MOZUURLComponents *)URLComponentsForResetPasswordOperation;


//
#pragma mark -
#pragma mark PUT Operations
#pragma mark -
//

/**
Resource Url Components for updateAccount
@param accountId Unique identifier of the customer account.
*/
+ (MOZUURLComponents *)URLComponentsForUpdateAccountOperationWithAccountId:(NSInteger)accountId;


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Resource Url Components for deleteAccount
@param accountId Unique identifier of the customer account to delete.
*/
+ (MOZUURLComponents *)URLComponentsForDeleteAccountOperationWithAccountId:(NSInteger)accountId;



@end