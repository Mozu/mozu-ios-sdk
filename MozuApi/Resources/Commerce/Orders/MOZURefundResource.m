
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZURefundClient.h"
#import "MOZURefundResource.h"


@interface MOZURefundResource()
@property(readwrite, nonatomic) MOZUAPIContext * apiContext;
@end

@implementation MOZURefundResource

-(id)initWithAPIContext:(MOZUAPIContext *)apiContext {
	if (self = [super init]) {
		self.apiContext = apiContext;
		return self;
	}
	else {
		return nil;
	}
}


-(id)cloneWithAPIContextModification:(MOZUAPIContextModificationBlock)apiContextModification {
	MOZUAPIContext* cloned = [self.apiContext cloneWith:apiContextModification];
	return [self initWithAPIContext:cloned];
}

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
Creates a refund based on the information supplied in the request.  
@param body Mozu.CommerceRuntime.Contracts.Refunds.Refund ApiType DOCUMENT_HERE 
@param orderId Unique identifier of the order.
@param responseFields A list or array of fields returned for a call. These fields may be customized and may be used for various types of data calls in Mozu. For example, responseFields are returned for retrieving or updating attributes, carts, and messages in Mozu.
*/

- (void)createRefundWithBody:(MOZURefund *)body orderId:(NSString *)orderId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZURefund *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZURefundClient clientForCreateRefundOperationWithBody:body orderId:orderId responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

/**
Resends the order refund email previously sent to the shopper. 
@param orderId Unique identifier of the order.
@param refundId Unique ID of the refund.
        
*/

- (void)resendRefundEmailWithOrderId:(NSString *)orderId refundId:(NSString *)refundId completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZURefundClient clientForResendRefundEmailOperationWithOrderId:orderId refundId:refundId];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//



@end