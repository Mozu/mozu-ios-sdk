/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUURLComponents.h"

@interface MOZUCardURLComponents : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Resource Url Components for getAccountCards
@param accountId Unique identifier of the customer account.
*/
+(MOZUURLComponents*)URLComponentsForGetAccountCardsOperationWithAccountId:(NSInteger)accountId;

/**
Resource Url Components for getAccountCard
@param accountId Unique identifier of the customer account.
@param cardId Unique identifier of the card associated with the customer account billing contact.
*/
+(MOZUURLComponents*)URLComponentsForGetAccountCardOperationWithAccountId:(NSInteger)accountId cardId:(NSString*)cardId;


//
#pragma mark -
#pragma mark POST Operations
#pragma mark -
//

/**
Resource Url Components for addAccountCard
@param accountId Unique identifier of the customer account.
*/
+(MOZUURLComponents*)URLComponentsForAddAccountCardOperationWithAccountId:(NSInteger)accountId;


//
#pragma mark -
#pragma mark PUT Operations
#pragma mark -
//

/**
Resource Url Components for updateAccountCard
@param accountId Unique identifier of the customer account.
@param cardId Unique identifier of the credit card.
*/
+(MOZUURLComponents*)URLComponentsForUpdateAccountCardOperationWithAccountId:(NSInteger)accountId cardId:(NSString*)cardId;


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Resource Url Components for deleteAccountCard
@param accountId Unique identifier of the customer account.
@param cardId Unique identifier of the credit card to delete.
*/
+(MOZUURLComponents*)URLComponentsForDeleteAccountCardOperationWithAccountId:(NSInteger)accountId cardId:(NSString*)cardId;



@end