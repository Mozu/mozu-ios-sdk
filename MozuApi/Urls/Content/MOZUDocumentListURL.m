/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUDocumentListURL.h"

@implementation MOZUDocumentListURLComponents

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+(MOZUURLComponents*)URLComponentsForGetDocumentListsOperationWithPageSize:(NSNumber*)pageSize startIndex:(NSNumber*)startIndex {
	NSString* template = @"/api/content/documentlists/?pageSize={pageSize}&startIndex={startIndex}";
	NSDictionary* params = @{
		@"pageSize" : pageSize,
		@"startIndex" : startIndex,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUTenantPod useSSL:NO];
}

+(MOZUURLComponents*)URLComponentsForGetDocumentListOperationWithDocumentListName:(NSString*)documentListName {
	NSString* template = @"/api/content/documentlists/{documentListName}";
	NSDictionary* params = @{
		@"documentListName" : documentListName,
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


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//



@end