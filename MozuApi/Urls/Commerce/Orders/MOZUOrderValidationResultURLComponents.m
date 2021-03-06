/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUOrderValidationResultURLComponents.h"

@implementation MOZUOrderValidationResultURLComponents

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+ (MOZUURLComponents *)URLComponentsForGetValidationResultsOperationWithOrderId:(NSString *)orderId {
	NSString *template = @"/api/commerce/orders/{orderId}/validationresults";
	NSDictionary *params = @{
		@"orderId" : orderId,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
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

+ (MOZUURLComponents *)URLComponentsForAddValidationResultOperationWithOrderId:(NSString *)orderId responseFields:(NSString *)responseFields {
	NSString *template = @"/api/commerce/orders/{orderId}/validationresults?responseFields={responseFields}";
	NSDictionary *params = @{
		@"orderId" : orderId,
		@"responseFields" : responseFields ? responseFields : @"",
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//



@end