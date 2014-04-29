/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUURLComponents.h"

@interface MOZUCartItemURLComponents : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Resource Url Components for getCartItems
*/
+ (MOZUURLComponents *)URLComponentsForGetCartItemsOperation;

/**
Resource Url Components for getCartItem
@param cartItemId Identifier of the cart item to retrieve.
*/
+ (MOZUURLComponents *)URLComponentsForGetCartItemOperationWithCartItemId:(NSString *)cartItemId;


//
#pragma mark -
#pragma mark POST Operations
#pragma mark -
//

/**
Resource Url Components for addItemToCart
*/
+ (MOZUURLComponents *)URLComponentsForAddItemToCartOperation;


//
#pragma mark -
#pragma mark PUT Operations
#pragma mark -
//

/**
Resource Url Components for updateCartItem
@param cartItemId Identifier of the cart item to update.
*/
+ (MOZUURLComponents *)URLComponentsForUpdateCartItemOperationWithCartItemId:(NSString *)cartItemId;

/**
Resource Url Components for updateCartItemQuantity
@param cartItemId Identifier of the cart item to update quantity.
@param quantity The number of cart items in the shopper's active cart.
*/
+ (MOZUURLComponents *)URLComponentsForUpdateCartItemQuantityOperationWithCartItemId:(NSString *)cartItemId quantity:(NSInteger)quantity;


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Resource Url Components for removeAllCartItems
*/
+ (MOZUURLComponents *)URLComponentsForRemoveAllCartItemsOperation;

/**
Resource Url Components for deleteCartItem
@param cartItemId Identifier of the cart item to delete.
*/
+ (MOZUURLComponents *)URLComponentsForDeleteCartItemOperationWithCartItemId:(NSString *)cartItemId;



@end