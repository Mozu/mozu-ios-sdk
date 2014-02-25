/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUURLComponents.h"

@interface MOZUTransactionURLComponents : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Resource Url Components for getTransactions
@param accountId Unique identifier of the customer account for which to retrieve transactions.
*/
+(MOZUURLComponents*)URLComponentsForGetTransactionsOperationWithAccountId:(NSInteger)accountId;


//
#pragma mark -
#pragma mark POST Operations
#pragma mark -
//

/**
Resource Url Components for addTransaction
@param accountId Unique identifier of the customer account.
*/
+(MOZUURLComponents*)URLComponentsForAddTransactionOperationWithAccountId:(NSInteger)accountId;


//
#pragma mark -
#pragma mark PUT Operations
#pragma mark -
//


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Resource Url Components for removeTransaction
@param accountId Unique identifier of the customer account from which to delete the transaction.
@param transactionId Unique identifier of the transaction to delete.
*/
+(MOZUURLComponents*)URLComponentsForRemoveTransactionOperationWithAccountId:(NSInteger)accountId transactionId:(NSString*)transactionId;



@end