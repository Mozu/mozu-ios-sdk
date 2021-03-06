
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

#import "MOZUPublicCard.h"
#import "MOZUSyncResponse.h"


@interface MOZUPublicCardResource : NSObject



//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

/**
payments-cards Post Create description DOCUMENT_HERE 
@param body Mozu.PaymentService.Contracts.PublicCard ApiType DOCUMENT_HERE 
*/

- (void)createWithBody:(MOZUPublicCard *)body completionHandler:(void(^)(MOZUSyncResponse *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

/**
payments-cards Put Update description DOCUMENT_HERE 
@param body Mozu.PaymentService.Contracts.PublicCard ApiType DOCUMENT_HERE 
@param cardId Unique identifier of the card associated with the customer account billing contact.
*/

- (void)updateWithBody:(MOZUPublicCard *)body cardId:(NSString *)cardId completionHandler:(void(^)(MOZUSyncResponse *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
payments-cards Delete Delete description DOCUMENT_HERE 
@param cardId Unique identifier of the card associated with the customer account billing contact.
*/

- (void)deleteWithCardId:(NSString *)cardId completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
;


@end