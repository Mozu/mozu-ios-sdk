
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUBillingInfoClient.h"
#import "MOZUBillingInfoURLComponents.h"
#import "MozuBillingInfo.h"


@implementation MOZUBillingInfoClient

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+ (MOZUClient *)clientForGetBillingInfoOperationWithOrderId:(NSString *)orderId draft:(NSNumber *)draft responseFields:(NSString *)responseFields {
	id url = [MOZUBillingInfoURLComponents URLComponentsForGetBillingInfoOperationWithOrderId:orderId draft:draft responseFields:responseFields];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUBillingInfo alloc] initWithString:jsonResult error:nil];
	};

	return client;
}


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

+ (MOZUClient *)clientForSetBillingInfoOperationWithBody:(MOZUBillingInfo *)body orderId:(NSString *)orderId updateMode:(NSString *)updateMode version:(NSString *)version responseFields:(NSString *)responseFields {
	id url = [MOZUBillingInfoURLComponents URLComponentsForSetBillingInfoOperationWithOrderId:orderId updateMode:updateMode version:version responseFields:responseFields];
	id verb = @"PUT";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	client.body = body;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUBillingInfo alloc] initWithString:jsonResult error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//



@end