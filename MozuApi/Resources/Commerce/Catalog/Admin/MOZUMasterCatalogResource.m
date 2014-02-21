
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUMasterCatalogClient.h"
#import "MOZUMasterCatalogResource.h"



@interface MOZUMasterCatalogResource()
@property(readwrite, nonatomic) MOZUAPIContext * apiContext;
@end


@implementation MOZUMasterCatalogResource


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

/**
Retrieve the details of all master catalog associated with a tenant.
*/

-(void)masterCatalogsWithUserClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUMasterCatalogCollection* result, MOZUApiError* error, NSHTTPURLResponse* response))handler
 {
	MOZUClient * client = [MOZUMasterCatalogClient clientForGetMasterCatalogsOperationWithUserClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Retrieve the details of the master catalog specified in the request.
@param masterCatalogId The unique identifier of the master catalog associated with the entity.
*/

-(void)masterCatalogWithDataViewMode:(MOZUDataViewMode)dataViewMode masterCatalogId:(NSInteger)masterCatalogId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUAdminMasterCatalog* result, MOZUApiError* error, NSHTTPURLResponse* response))handler
 {
	MOZUClient * client = [MOZUMasterCatalogClient clientForGetMasterCatalogOperationWithDataViewMode:dataViewMode masterCatalogId:masterCatalogId userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
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

/**
Updates the product publishing mode for the master catalog specified in the request.
@param body Properties of the master catalog to update, which consists of the product publishing mode. Possible values are "Pending" which saves product updates in draft mode until they are published, and "Live" which publishes all product changes immediately.
@param masterCatalogId 
*/

-(void)updateMasterCatalogWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(MOZUAdminMasterCatalog*)body masterCatalogId:(NSInteger)masterCatalogId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUAdminMasterCatalog* result, MOZUApiError* error, NSHTTPURLResponse* response))handler
 {
	MOZUClient * client = [MOZUMasterCatalogClient clientForUpdateMasterCatalogOperationWithDataViewMode:dataViewMode body:body masterCatalogId:masterCatalogId userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//



@end