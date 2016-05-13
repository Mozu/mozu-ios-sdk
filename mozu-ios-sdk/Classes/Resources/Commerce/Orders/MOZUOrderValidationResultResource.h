
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

#import "MOZUOrderValidationResult.h"


@interface MOZUOrderValidationResultResource : NSObject


@property(readonly, nonatomic) MOZUAPIContext * apiContext;

-(id)initWithAPIContext:(MOZUAPIContext *)apiContext;

-(id)cloneWithAPIContextModification:(MOZUAPIContextModificationBlock)apiContextModification;

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieves a list of the validation results associated with the order.
@param orderId Unique identifier of the order.
*/

- (void)validationResultsWithOrderId:(NSString *)orderId completionHandler:(void(^)(NSArray<MOZUOrderValidationResult> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

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

/**
Add a new order validation result to a submitted order.
@param body Properties of the resulting order validation performed by an order validation capability.
@param orderId Unique identifier of the order.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)addValidationResultWithBody:(MOZUOrderValidationResult *)body orderId:(NSString *)orderId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUOrderValidationResult *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//



@end