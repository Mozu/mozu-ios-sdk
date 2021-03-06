
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUAdjustmentClient.h"
#import "MOZUAdjustmentURLComponents.h"
#import "MozuOrder.h"


@implementation MOZUAdjustmentClient

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


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

+ (MOZUClient *)clientForApplyShippingAdjustmentOperationWithBody:(MOZUAdjustment *)body orderId:(NSString *)orderId updateMode:(NSString *)updateMode version:(NSString *)version responseFields:(NSString *)responseFields {
	id url = [MOZUAdjustmentURLComponents URLComponentsForApplyShippingAdjustmentOperationWithOrderId:orderId updateMode:updateMode version:version responseFields:responseFields];
	id verb = @"PUT";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	client.body = body;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUOrder alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForApplyAdjustmentOperationWithBody:(MOZUAdjustment *)body orderId:(NSString *)orderId updateMode:(NSString *)updateMode version:(NSString *)version responseFields:(NSString *)responseFields {
	id url = [MOZUAdjustmentURLComponents URLComponentsForApplyAdjustmentOperationWithOrderId:orderId updateMode:updateMode version:version responseFields:responseFields];
	id verb = @"PUT";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	client.body = body;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUOrder alloc] initWithString:jsonResult error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

+ (MOZUClient *)clientForRemoveShippingAdjustmentOperationWithOrderId:(NSString *)orderId updateMode:(NSString *)updateMode version:(NSString *)version {
	id url = [MOZUAdjustmentURLComponents URLComponentsForRemoveShippingAdjustmentOperationWithOrderId:orderId updateMode:updateMode version:version];
	id verb = @"DELETE";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUOrder alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForRemoveAdjustmentOperationWithOrderId:(NSString *)orderId updateMode:(NSString *)updateMode version:(NSString *)version {
	id url = [MOZUAdjustmentURLComponents URLComponentsForRemoveAdjustmentOperationWithOrderId:orderId updateMode:updateMode version:version];
	id verb = @"DELETE";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUOrder alloc] initWithString:jsonResult error:nil];
	};

	return client;
}



@end