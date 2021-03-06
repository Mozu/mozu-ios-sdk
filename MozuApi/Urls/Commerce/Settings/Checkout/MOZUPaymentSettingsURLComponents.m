/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUPaymentSettingsURLComponents.h"

@implementation MOZUPaymentSettingsURLComponents

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+ (MOZUURLComponents *)URLComponentsForGetThirdPartyPaymentWorkflowWithValuesOperationWithFullyQualifiedName:(NSString *)fullyQualifiedName responseFields:(NSString *)responseFields {
	NSString *template = @"/api/commerce/settings/checkout/paymentsettings/thirdpartyworkflow/{fullyQualifiedName}?responseFields={responseFields}";
	NSDictionary *params = @{
		@"fullyQualifiedName" : fullyQualifiedName,
		@"responseFields" : responseFields ? responseFields : @"",
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+ (MOZUURLComponents *)URLComponentsForGetThirdPartyPaymentWorkflowsOperation {
	NSString *template = @"/api/commerce/settings/checkout/paymentsettings/thirdpartyworkflows";
	NSDictionary *params = nil;

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

+ (MOZUURLComponents *)URLComponentsForAddThirdPartyPaymentWorkflowOperation {
	NSString *template = @"/api/commerce/settings/checkout/paymentsettings/thirdpartyworkflows";
	NSDictionary *params = nil;

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

+ (MOZUURLComponents *)URLComponentsForDeleteThirdPartyPaymentWorkflowOperationWithFullyQualifiedName:(NSString *)fullyQualifiedName {
	NSString *template = @"/api/commerce/settings/checkout/paymentsettings/thirdpartyworkflows/{fullyQualifiedName}";
	NSDictionary *params = @{
		@"fullyQualifiedName" : fullyQualifiedName,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}



@end