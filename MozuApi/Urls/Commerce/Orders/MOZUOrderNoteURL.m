/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUOrderNoteURL.h"

@implementation MOZUOrderNoteURLComponents

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+(MOZUURLComponents*)URLComponentsForGetOrderNotesOperationWithOrderId:(NSString*)orderId {
	NSString* template = @"/api/commerce/orders/{orderId}/notes";
	NSDictionary* params = @{
		@"orderId" : orderId,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+(MOZUURLComponents*)URLComponentsForGetOrderNoteOperationWithOrderId:(NSString*)orderId noteId:(NSString*)noteId {
	NSString* template = @"/api/commerce/orders/{orderId}/notes/{noteId}";
	NSDictionary* params = @{
		@"orderId" : orderId,
		@"noteId" : noteId,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

+(MOZUURLComponents*)URLComponentsForCreateOrderNoteOperationWithOrderId:(NSString*)orderId {
	NSString* template = @"/api/commerce/orders/{orderId}/notes";
	NSDictionary* params = @{
		@"orderId" : orderId,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

+(MOZUURLComponents*)URLComponentsForUpdateOrderNoteOperationWithOrderId:(NSString*)orderId noteId:(NSString*)noteId {
	NSString* template = @"/api/commerce/orders/{orderId}/notes/{noteId}";
	NSDictionary* params = @{
		@"orderId" : orderId,
		@"noteId" : noteId,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

+(MOZUURLComponents*)URLComponentsForDeleteOrderNoteOperationWithOrderId:(NSString*)orderId noteId:(NSString*)noteId {
	NSString* template = @"/api/commerce/orders/{orderId}/notes/{noteId}";
	NSDictionary* params = @{
		@"orderId" : orderId,
		@"noteId" : noteId,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}



@end