/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUApplicationVersionURL.h"

@implementation MOZUApplicationVersionURLComponents

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+(MOZUURLComponents*)URLComponentsForGetAllApplicationsOperation {
	NSString* template = @"/api/platform/developer/applications/";
	NSDictionary* params = nil;

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUHomePod useSSL:NO];
}

+(MOZUURLComponents*)URLComponentsForGetApplicationOperationWithApplicationId:(NSNumber*)applicationId {
	NSString* template = @"/api/platform/developer/applications/{applicationId}";
	NSDictionary* params = @{
		@"applicationId" : applicationId,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUHomePod useSSL:NO];
}

+(MOZUURLComponents*)URLComponentsForGetApplicationVersionOperationWithApplicationVersionId:(NSInteger)applicationVersionId {
	NSString* template = @"/api/platform/developer/applications/applicationVersions/{applicationVersionId}";
	NSDictionary* params = @{
		@"applicationVersionId" : @(applicationVersionId),
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUHomePod useSSL:NO];
}

+(MOZUURLComponents*)URLComponentsForGetPackagesOperationWithApplicationVersionId:(NSInteger)applicationVersionId {
	NSString* template = @"/api/platform/developer/applications/applicationVersions/{applicationVersionId}/packages";
	NSDictionary* params = @{
		@"applicationVersionId" : @(applicationVersionId),
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUHomePod useSSL:NO];
}

+(MOZUURLComponents*)URLComponentsForGetPackageOperationWithApplicationVersionId:(NSInteger)applicationVersionId packageId:(NSInteger)packageId {
	NSString* template = @"/api/platform/developer/applications/applicationVersions/{applicationVersionId}/packages/{packageId}";
	NSDictionary* params = @{
		@"applicationVersionId" : @(applicationVersionId),
		@"packageId" : @(packageId),
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUHomePod useSSL:NO];
}

+(MOZUURLComponents*)URLComponentsForGetPackageItemsMetadataOperationWithApplicationVersionId:(NSInteger)applicationVersionId packageId:(NSInteger)packageId {
	NSString* template = @"/api/platform/developer/applications/applicationVersions/{applicationVersionId}/packages/{packageId}/files";
	NSDictionary* params = @{
		@"applicationVersionId" : @(applicationVersionId),
		@"packageId" : @(packageId),
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUHomePod useSSL:NO];
}

+(MOZUURLComponents*)URLComponentsForGetPackageItemMetadataOperationWithApplicationVersionId:(NSInteger)applicationVersionId packageId:(NSInteger)packageId itempath:(NSString*)itempath {
	NSString* template = @"/api/platform/developer/applications/applicationVersions/{applicationVersionId}/packages/{packageId}/files/?itemPath={itempath}";
	NSDictionary* params = @{
		@"applicationVersionId" : @(applicationVersionId),
		@"packageId" : @(packageId),
		@"itempath" : itempath,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUHomePod useSSL:NO];
}

+(MOZUURLComponents*)URLComponentsForGetPackageFilesZipOperationWithApplicationVersionId:(NSInteger)applicationVersionId packageId:(NSInteger)packageId {
	NSString* template = @"/api/platform/developer/applications/applicationVersions/{applicationVersionId}/packages/{packageId}/zip";
	NSDictionary* params = @{
		@"applicationVersionId" : @(applicationVersionId),
		@"packageId" : @(packageId),
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUHomePod useSSL:NO];
}


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

+(MOZUURLComponents*)URLComponentsForAddPackageOperationWithApplicationVersionId:(NSInteger)applicationVersionId {
	NSString* template = @"/api/platform/developer/applications/applicationVersions/{applicationVersionId}/packages";
	NSDictionary* params = @{
		@"applicationVersionId" : @(applicationVersionId),
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUHomePod useSSL:NO];
}

+(MOZUURLComponents*)URLComponentsForChangePackageFileNameOrPathOperationWithApplicationVersionId:(NSInteger)applicationVersionId packageId:(NSInteger)packageId {
	NSString* template = @"/api/platform/developer/applications/applicationVersions/{applicationVersionId}/packages/{packageId}/files/change-name-or-path";
	NSDictionary* params = @{
		@"applicationVersionId" : @(applicationVersionId),
		@"packageId" : @(packageId),
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUHomePod useSSL:NO];
}

+(MOZUURLComponents*)URLComponentsForAddPackageFileOperationWithApplicationVersionId:(NSInteger)applicationVersionId packageId:(NSInteger)packageId filepath:(NSString*)filepath {
	NSString* template = @"/api/platform/developer/applications/applicationVersions/{applicationVersionId}/packages/{packageId}/files?filePath={filepath}";
	NSDictionary* params = @{
		@"applicationVersionId" : @(applicationVersionId),
		@"packageId" : @(packageId),
		@"filepath" : filepath,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUHomePod useSSL:NO];
}


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

+(MOZUURLComponents*)URLComponentsForUpdatePackageFileOperationWithApplicationVersionId:(NSInteger)applicationVersionId packageId:(NSInteger)packageId filepath:(NSString*)filepath {
	NSString* template = @"/api/platform/developer/applications/applicationVersions/{applicationVersionId}/packages/{packageId}/files?filePath={filepath}";
	NSDictionary* params = @{
		@"applicationVersionId" : @(applicationVersionId),
		@"packageId" : @(packageId),
		@"filepath" : filepath,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUHomePod useSSL:NO];
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

+(MOZUURLComponents*)URLComponentsForDeletePackageFileOperationWithApplicationVersionId:(NSInteger)applicationVersionId packageId:(NSInteger)packageId filepath:(NSString*)filepath {
	NSString* template = @"/api/platform/developer/applications/applicationVersions/{applicationVersionId}/packages/{packageId}/files?filePath={filepath}";
	NSDictionary* params = @{
		@"applicationVersionId" : @(applicationVersionId),
		@"packageId" : @(packageId),
		@"filepath" : filepath,
	};

	return [[MOZUURLComponents alloc] initWithTemplate:template parameters:params location:MOZUHomePod useSSL:NO];
}



@end