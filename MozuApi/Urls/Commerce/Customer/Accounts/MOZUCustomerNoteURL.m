/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUCustomerNoteURL.h"

@implementation MOZUCustomerNoteURLComponents

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+(MOZUURLComponents*)URLComponentsForGetAccountNoteOperationWithAccountId:(NSInteger)accountId noteId:(NSInteger)noteId {
	NSString* template = @"/api/commerce/customer/accounts/{accountId}/notes/{noteId}";
	NSDictionary* params = @{
		@"accountId" : @(accountId),
		@"noteId" : @(noteId),
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+(MOZUURLComponents*)URLComponentsForGetAccountNotesOperationWithAccountId:(NSInteger)accountId startIndex:(NSNumber*)startIndex pageSize:(NSNumber*)pageSize sortBy:(NSString*)sortBy filter:(NSString*)filter {
	NSString* template = @"/api/commerce/customer/accounts/{accountId}/notes?startIndex={startIndex}&pageSize={pageSize}&sortBy={sortBy}&filter={filter}";
	NSDictionary* params = @{
		@"accountId" : @(accountId),
		@"startIndex" : startIndex,
		@"pageSize" : pageSize,
		@"sortBy" : sortBy,
		@"filter" : filter,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

+(MOZUURLComponents*)URLComponentsForAddAccountNoteOperationWithAccountId:(NSInteger)accountId {
	NSString* template = @"/api/commerce/customer/accounts/{accountId}/notes";
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

+(MOZUURLComponents*)URLComponentsForUpdateAccountNoteOperationWithAccountId:(NSInteger)accountId noteId:(NSInteger)noteId {
	NSString* template = @"/api/commerce/customer/accounts/{accountId}/notes/{noteId}";
	NSDictionary* params = @{
		@"accountId" : @(accountId),
		@"noteId" : @(noteId),
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

+(MOZUURLComponents*)URLComponentsForDeleteAccountNoteOperationWithAccountId:(NSInteger)accountId noteId:(NSInteger)noteId {
	NSString* template = @"/api/commerce/customer/accounts/{accountId}/notes/{noteId}";
	NSDictionary* params = @{
		@"accountId" : @(accountId),
		@"noteId" : @(noteId),
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}



@end