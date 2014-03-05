/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUCustomerContactURLComponents.h"

@implementation MOZUCustomerContactURLComponents

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+(MOZUURLComponents*)URLComponentsForGetAccountContactOperationWithAccountId:(NSInteger)accountId contactId:(NSInteger)contactId {
	NSString* template = @"/api/commerce/customer/accounts/{accountId}/contacts/{contactId}";
	NSDictionary* params = @{
		@"accountId" : @(accountId),
		@"contactId" : @(contactId),
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+(MOZUURLComponents*)URLComponentsForGetAccountContactsOperationWithAccountId:(NSInteger)accountId startIndex:(NSNumber*)startIndex pageSize:(NSNumber*)pageSize sortBy:(NSString*)sortBy filter:(NSString*)filter {
	NSString* template = @"/api/commerce/customer/accounts/{accountId}/contacts?startIndex={startIndex}&pageSize={pageSize}&sortBy={sortBy}&filter={filter}";
	NSDictionary* params = @{
		@"accountId" : @(accountId),
		@"startIndex" : startIndex ? startIndex : @"",
		@"pageSize" : pageSize ? pageSize : @"",
		@"sortBy" : sortBy ? sortBy : @"",
		@"filter" : filter ? filter : @"",
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

+(MOZUURLComponents*)URLComponentsForAddAccountContactOperationWithAccountId:(NSInteger)accountId {
	NSString* template = @"/api/commerce/customer/accounts/{accountId}/contacts";
	NSDictionary* params = @{
		@"accountId" : @(accountId),
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

+(MOZUURLComponents*)URLComponentsForUpdateAccountContactOperationWithAccountId:(NSInteger)accountId contactId:(NSInteger)contactId {
	NSString* template = @"/api/commerce/customer/accounts/{accountId}/contacts/{contactId}";
	NSDictionary* params = @{
		@"accountId" : @(accountId),
		@"contactId" : @(contactId),
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

+(MOZUURLComponents*)URLComponentsForDeleteAccountContactOperationWithAccountId:(NSInteger)accountId contactId:(NSInteger)contactId {
	NSString* template = @"/api/commerce/customer/accounts/{accountId}/contacts/{contactId}";
	NSDictionary* params = @{
		@"accountId" : @(accountId),
		@"contactId" : @(contactId),
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}



@end