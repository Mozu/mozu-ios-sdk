
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
#import "MOZUCustomerAttribute.h"
#import "MOZUCustomerAttributeCollection.h"


@interface MOZUCustomerAttributeClient : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieves the contents of an attribute associated with the specified customer account.
@param accountId Unique identifier of the customer account.
@param attributeFQN The fully qualified name of the attribute, which is a user defined attribute identifier.
@param responseFields Use this field to include those fields which are not included by default.
*/

+ (MOZUClient *)clientForGetAccountAttributeOperationWithAccountId:(NSInteger)accountId attributeFQN:(NSString *)attributeFQN responseFields:(NSString *)responseFields;

/**
Retrieves the list of customer account attributes.
@param accountId Unique identifier of the customer account.
@param filter 
@param pageSize 
@param responseFields Use this field to include those fields which are not included by default.
@param sortBy 
@param startIndex 
*/

+ (MOZUClient *)clientForGetAccountAttributesOperationWithAccountId:(NSInteger)accountId startIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter responseFields:(NSString *)responseFields;


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

/**
Applies a defined attribute to the customer account specified in the request and assigns a value to the customer attribute.
@param body Properties of an attribute associated with a customer account.
@param accountId Unique identifier of the customer account.
@param responseFields Use this field to include those fields which are not included by default.
*/

+ (MOZUClient *)clientForAddAccountAttributeOperationWithBody:(MOZUCustomerAttribute *)body accountId:(NSInteger)accountId responseFields:(NSString *)responseFields;


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

/**
Updates one or more details of a customer account attribute.
@param body Properties of an attribute associated with a customer account.
@param accountId Unique identifier of the customer account.
@param attributeFQN The fully qualified name of the attribute, which is a user defined attribute identifier.
@param responseFields Use this field to include those fields which are not included by default.
*/

+ (MOZUClient *)clientForUpdateAccountAttributeOperationWithBody:(MOZUCustomerAttribute *)body accountId:(NSInteger)accountId attributeFQN:(NSString *)attributeFQN responseFields:(NSString *)responseFields;


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Removes the attribute specified in the request from the customer account.
@param accountId Unique identifier of the customer account.
@param attributeFQN The fully qualified name of the attribute, which is a user defined attribute identifier.
*/

+ (MOZUClient *)clientForDeleteAccountAttributeOperationWithAccountId:(NSInteger)accountId attributeFQN:(NSString *)attributeFQN;



@end