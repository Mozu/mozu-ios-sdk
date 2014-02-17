
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUApplicationVersionClient.h"
#import "MOZUApplicationVersionResource.h"


@interface MOZUApplicationVersionResource()
@property(readwrite, nonatomic) MOZUApiContext * apiContext;
@end

@implementation MOZUApplicationVersionResource

-(id)initWithAPIContext:(MOZUAPIContext *)apiContext {
	if (self = [super init]) {
		self.apiContext = apiContext;
		return self;
	}
	else {
		return nil;
	}
}

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

-(void)allApplications userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUApplicationCollection* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUApplicationVersionClient clientForGetAllApplicationsOperation userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil {
			handler(result, error, response);
		}
	}];
}

-(void)applicationWithWithApplicationId:(NSNumber*)applicationId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUAppDevApplication* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUApplicationVersionClient clientForGetApplicationOperationWithWithApplicationId:applicationId userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil {
			handler(result, error, response);
		}
	}];
}

-(void)applicationVersionWithWithApplicationVersionId:(NSInteger)applicationVersionId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUApplicationVersion* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUApplicationVersionClient clientForGetApplicationVersionOperationWithWithApplicationVersionId:applicationVersionId userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil {
			handler(result, error, response);
		}
	}];
}

-(void)packagesWithWithApplicationVersionId:(NSInteger)applicationVersionId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUPackageCollection* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUApplicationVersionClient clientForGetPackagesOperationWithWithApplicationVersionId:applicationVersionId userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil {
			handler(result, error, response);
		}
	}];
}

-(void)packageWithWithApplicationVersionId:(NSInteger)applicationVersionId packageId:(NSInteger)packageId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUAppDevPackage* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUApplicationVersionClient clientForGetPackageOperationWithWithApplicationVersionId:applicationVersionId packageId:packageId userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil {
			handler(result, error, response);
		}
	}];
}

-(void)packageItemsMetadataWithWithApplicationVersionId:(NSInteger)applicationVersionId packageId:(NSInteger)packageId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUFolderMetadata* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUApplicationVersionClient clientForGetPackageItemsMetadataOperationWithWithApplicationVersionId:applicationVersionId packageId:packageId userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil {
			handler(result, error, response);
		}
	}];
}

-(void)packageItemMetadataWithWithApplicationVersionId:(NSInteger)applicationVersionId packageId:(NSInteger)packageId itempath:(NSString*)itempath userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUFileMetadata* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUApplicationVersionClient clientForGetPackageItemMetadataOperationWithWithApplicationVersionId:applicationVersionId packageId:packageId itempath:itempath userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil {
			handler(result, error, response);
		}
	}];
}

-(void)packageFilesZipWithWithApplicationVersionId:(NSInteger)applicationVersionId packageId:(NSInteger)packageId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(NSInputStream* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUApplicationVersionClient clientForGetPackageFilesZipOperationWithWithApplicationVersionId:applicationVersionId packageId:packageId userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil {
			handler(result, error, response);
		}
	}];
}


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

-(void)addPackageWithWithPackage:(MOZUAppDevPackage*)package applicationVersionId:(NSInteger)applicationVersionId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUAppDevPackage* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUApplicationVersionClient clientForAddPackageOperationWithWithpackage:package applicationVersionId:applicationVersionId userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil {
			handler(result, error, response);
		}
	}];
}

-(void)changePackageFileNameOrPathWithWithRenameInfo:(MOZURenameInfo*)renameInfo applicationVersionId:(NSInteger)applicationVersionId packageId:(NSInteger)packageId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUFileMetadata* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUApplicationVersionClient clientForChangePackageFileNameOrPathOperationWithWithrenameInfo:renameInfo applicationVersionId:applicationVersionId packageId:packageId userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil {
			handler(result, error, response);
		}
	}];
}

-(void)addPackageFileWithWithStream:(NSInputStream*)stream applicationVersionId:(NSInteger)applicationVersionId packageId:(NSInteger)packageId filepath:(NSString*)filepath userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUFileMetadata* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUApplicationVersionClient clientForAddPackageFileOperationWithWithstream:stream applicationVersionId:applicationVersionId packageId:packageId filepath:filepath userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil {
			handler(result, error, response);
		}
	}];
}


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

-(void)updatePackageFileWithWithStream:(NSInputStream*)stream applicationVersionId:(NSInteger)applicationVersionId packageId:(NSInteger)packageId filepath:(NSString*)filepath userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUFileMetadata* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUApplicationVersionClient clientForUpdatePackageFileOperationWithWithstream:stream applicationVersionId:applicationVersionId packageId:packageId filepath:filepath userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil {
			handler(result, error, response);
		}
	}];
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

-(void)deletePackageFileWithWithApplicationVersionId:(NSInteger)applicationVersionId packageId:(NSInteger)packageId filepath:(NSString*)filepath userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUApplicationVersionClient clientForDeletePackageFileOperationWithWithApplicationVersionId:applicationVersionId packageId:packageId filepath:filepath userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil {
			handler(error, response);
		}
	}];
}



@end