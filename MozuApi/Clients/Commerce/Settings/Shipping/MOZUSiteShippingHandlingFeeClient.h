
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
#import "MOZUSiteShippingHandlingFee.h"


@interface MOZUSiteShippingHandlingFeeClient : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieves the details of the order handling fee configured for the site.
*/

+(MOZUClient*)clientForGetOrderHandlingFeeOperation userClaims:(MOZUUserAuthTicket*)userClaims;


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

/**
Creates a new order handling fee for the site.
@param orderHandlingFee Properties of the order handling fee to assess for order shipment.
*/

+(MOZUClient*)clientForCreateOrderHandlingFeeOperationWithWithOrderHandlingFee:(MOZUSiteShippingHandlingFee*)orderHandlingFee userClaims:(MOZUUserAuthTicket*)userClaims;


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

/**
Updates the order handling fee amount for the site.
@param orderHandlingFee The combined price for all items in the order, including all selected options but excluding any discounts.
*/

+(MOZUClient*)clientForUpdateOrderHandlingFeeOperationWithWithOrderHandlingFee:(MOZUSiteShippingHandlingFee*)orderHandlingFee userClaims:(MOZUUserAuthTicket*)userClaims;


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//



@end