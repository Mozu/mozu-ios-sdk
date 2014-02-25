/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUURLComponents.h"

@interface MOZUProductOptionURLComponents : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Resource Url Components for getOptions
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
*/
+(MOZUURLComponents*)URLComponentsForGetOptionsOperationWithProductCode:(NSString*)productCode;

/**
Resource Url Components for getOption
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
@param attributeFQN The fully qualified name of the attribute, which is a user defined attribute identifier.
*/
+(MOZUURLComponents*)URLComponentsForGetOptionOperationWithProductCode:(NSString*)productCode attributeFQN:(NSString*)attributeFQN;


//
#pragma mark -
#pragma mark POST Operations
#pragma mark -
//

/**
Resource Url Components for addOption
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
*/
+(MOZUURLComponents*)URLComponentsForAddOptionOperationWithProductCode:(NSString*)productCode;


//
#pragma mark -
#pragma mark PUT Operations
#pragma mark -
//

/**
Resource Url Components for updateOption
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
@param attributeFQN The fully qualified name of the attribute, which is a user defined attribute identifier.
*/
+(MOZUURLComponents*)URLComponentsForUpdateOptionOperationWithProductCode:(NSString*)productCode attributeFQN:(NSString*)attributeFQN;


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Resource Url Components for deleteOption
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
@param attributeFQN The fully qualified name of the attribute, which is a user defined attribute identifier.
*/
+(MOZUURLComponents*)URLComponentsForDeleteOptionOperationWithProductCode:(NSString*)productCode attributeFQN:(NSString*)attributeFQN;



@end