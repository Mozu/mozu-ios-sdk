
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
#import "MOZUAuthTicket.h"
#import "MOZUSubscriptionCollection.h"


@interface MOZUSubscriptionClient : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**

@param filter 
@param pageSize 
@param sortBy 
@param startIndex 
*/

+ (MOZUClient *)clientForGetSubscriptionsOperationWithStartIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter userClaims:(MOZUUserAuthTicket *)userClaims;


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//


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



@end