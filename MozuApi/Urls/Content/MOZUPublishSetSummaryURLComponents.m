/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUPublishSetSummaryURLComponents.h"

@implementation MOZUPublishSetSummaryURLComponents

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+ (MOZUURLComponents *)URLComponentsForGetPublishSetsOperationWithPageSize:(NSNumber *)pageSize startIndex:(NSNumber *)startIndex responseFields:(NSString *)responseFields {
	NSString *template = @"/api/content/publishsets/?pageSize={pageSize}&startIndex={startIndex}&responseFields={responseFields}";
	NSDictionary *params = @{
		@"pageSize" : pageSize ? pageSize : @"",
		@"startIndex" : startIndex ? startIndex : @"",
		@"responseFields" : responseFields ? responseFields : @"",
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+ (MOZUURLComponents *)URLComponentsForGetPublishSetItemsOperationWithCode:(NSString *)code pageSize:(NSNumber *)pageSize startIndex:(NSNumber *)startIndex responseFields:(NSString *)responseFields {
	NSString *template = @"/api/content/publishsets/{code}/items?pageSize={pageSize}&startIndex={startIndex}&responseFields={responseFields}";
	NSDictionary *params = @{
		@"code" : code,
		@"pageSize" : pageSize ? pageSize : @"",
		@"startIndex" : startIndex ? startIndex : @"",
		@"responseFields" : responseFields ? responseFields : @"",
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

+ (MOZUURLComponents *)URLComponentsForDeletePublishSetOperationWithCode:(NSString *)code shouldDiscard:(NSNumber *)shouldDiscard responseFields:(NSString *)responseFields {
	NSString *template = @"/api/content/publishsets/{code}?shouldDiscard={shouldDiscard}&responseFields={responseFields}";
	NSDictionary *params = @{
		@"code" : code,
		@"shouldDiscard" : shouldDiscard ? shouldDiscard : @"",
		@"responseFields" : responseFields ? responseFields : @"",
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

+ (MOZUURLComponents *)URLComponentsForAddPublishSetItemsOperationWithCode:(NSString *)code responseFields:(NSString *)responseFields {
	NSString *template = @"/api/content/publishsets/{code}/items?responseFields={responseFields}";
	NSDictionary *params = @{
		@"code" : code,
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