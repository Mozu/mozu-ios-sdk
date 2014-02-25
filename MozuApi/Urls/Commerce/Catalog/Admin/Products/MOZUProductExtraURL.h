/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUURLComponents.h"

@interface MOZUProductExtraURLComponents : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Resource Url Components for getExtras
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
*/
+(MOZUURLComponents*)URLComponentsForGetExtrasOperationWithProductCode:(NSString*)productCode;

/**
Resource Url Components for getExtra
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
@param attributeFQN The fully qualified name of the attribute, which is a user defined attribute identifier.
*/
+(MOZUURLComponents*)URLComponentsForGetExtraOperationWithProductCode:(NSString*)productCode attributeFQN:(NSString*)attributeFQN;


//
#pragma mark -
#pragma mark POST Operations
#pragma mark -
//

/**
Resource Url Components for addExtra
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
*/
+(MOZUURLComponents*)URLComponentsForAddExtraOperationWithProductCode:(NSString*)productCode;


//
#pragma mark -
#pragma mark PUT Operations
#pragma mark -
//

/**
Resource Url Components for updateExtra
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
@param attributeFQN The fully qualified name of the attribute, which is a user defined attribute identifier.
*/
+(MOZUURLComponents*)URLComponentsForUpdateExtraOperationWithProductCode:(NSString*)productCode attributeFQN:(NSString*)attributeFQN;


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Resource Url Components for deleteExtra
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
@param attributeFQN The fully qualified name of the attribute, which is a user defined attribute identifier.
*/
+(MOZUURLComponents*)URLComponentsForDeleteExtraOperationWithProductCode:(NSString*)productCode attributeFQN:(NSString*)attributeFQN;



@end