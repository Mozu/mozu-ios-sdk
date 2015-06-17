
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

#import "MOZUTransaction.h"


@interface MOZUTransactionResource : NSObject


@property(readonly, nonatomic) MOZUAPIContext * apiContext;

-(id)initWithAPIContext:(MOZUAPIContext *)apiContext;

-(id)cloneWithAPIContextModification:(MOZUAPIContextModificationBlock)apiContextModification;

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieves a list of transactions associated with the customer account specified in the request.
@param accountId Unique identifier of the customer account.
*/

- (void)transactionsWithAccountId:(NSInteger)accountId completionHandler:(void(^)(NSArray<MOZUTransaction> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

/**
Creates a new transaction for the customer account specified in the request.
@param body Properties of a transaction performed by a customer account. The system creates a transaction each time the customer submits an order, returns an item, picks up items for an order, or manages items on a wish list.
@param accountId Unique identifier of the customer account.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)addTransactionWithBody:(MOZUTransaction *)body accountId:(NSInteger)accountId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUTransaction *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Deletes a transaction from the customer account specified in the request.
@param accountId Unique identifier of the customer account.
@param transactionId Unique identifier of the transaction to delete.
*/

- (void)removeTransactionWithAccountId:(NSInteger)accountId transactionId:(NSString *)transactionId completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
;


@end