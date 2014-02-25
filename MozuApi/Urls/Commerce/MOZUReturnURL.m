/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUReturnURL.h"

@implementation MOZUReturnURLComponents

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+(MOZUURLComponents*)URLComponentsForGetReturnsOperationWithStartIndex:(NSNumber*)startIndex pageSize:(NSNumber*)pageSize sortBy:(NSString*)sortBy filter:(NSString*)filter {
	NSString* template = @"/api/commerce/returns/?startIndex={startIndex}&pageSize={pageSize}&sortBy={sortBy}&filter={filter}";
	NSDictionary* params = @{
		@"startIndex" : startIndex,
		@"pageSize" : pageSize,
		@"sortBy" : sortBy,
		@"filter" : filter,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+(MOZUURLComponents*)URLComponentsForGetReturnOperationWithReturnId:(NSString*)returnId {
	NSString* template = @"/api/commerce/returns/{returnId}";
	NSDictionary* params = @{
		@"returnId" : returnId,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+(MOZUURLComponents*)URLComponentsForGetAvailableReturnActionsOperationWithReturnId:(NSString*)returnId {
	NSString* template = @"/api/commerce/returns/{returnId}/actions";
	NSDictionary* params = @{
		@"returnId" : returnId,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+(MOZUURLComponents*)URLComponentsForGetPaymentsOperationWithReturnId:(NSString*)returnId {
	NSString* template = @"/api/commerce/returns/{returnId}/payments";
	NSDictionary* params = @{
		@"returnId" : returnId,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+(MOZUURLComponents*)URLComponentsForGetPaymentOperationWithReturnId:(NSString*)returnId paymentId:(NSString*)paymentId {
	NSString* template = @"/api/commerce/returns/{returnId}/payments/{paymentId}";
	NSDictionary* params = @{
		@"returnId" : returnId,
		@"paymentId" : paymentId,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+(MOZUURLComponents*)URLComponentsForGetAvailablePaymentActionsForReturnOperationWithReturnId:(NSString*)returnId paymentId:(NSString*)paymentId {
	NSString* template = @"/api/commerce/returns/{returnId}/payments/{paymentId}/actions";
	NSDictionary* params = @{
		@"returnId" : returnId,
		@"paymentId" : paymentId,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

+(MOZUURLComponents*)URLComponentsForCreateReturnOperation {
	NSString* template = @"/api/commerce/returns/";
	NSDictionary* params = nil;

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+(MOZUURLComponents*)URLComponentsForPerformPaymentActionForReturnOperationWithReturnId:(NSString*)returnId paymentId:(NSString*)paymentId {
	NSString* template = @"/api/commerce/returns/{returnId}/payments/{paymentId}/actions";
	NSDictionary* params = @{
		@"returnId" : returnId,
		@"paymentId" : paymentId,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+(MOZUURLComponents*)URLComponentsForCreatePaymentActionForReturnOperationWithReturnId:(NSString*)returnId {
	NSString* template = @"/api/commerce/returns/{returnId}/payments/actions";
	NSDictionary* params = @{
		@"returnId" : returnId,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+(MOZUURLComponents*)URLComponentsForPerformReturnActionsOperation {
	NSString* template = @"/api/commerce/returns/actions";
	NSDictionary* params = nil;

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

+(MOZUURLComponents*)URLComponentsForUpdateReturnOperationWithReturnId:(NSString*)returnId {
	NSString* template = @"/api/commerce/returns/{returnId}";
	NSDictionary* params = @{
		@"returnId" : returnId,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

+(MOZUURLComponents*)URLComponentsForDeleteReturnOperationWithReturnId:(NSString*)returnId {
	NSString* template = @"/api/commerce/returns/{returnId}";
	NSDictionary* params = @{
		@"returnId" : returnId,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}



@end