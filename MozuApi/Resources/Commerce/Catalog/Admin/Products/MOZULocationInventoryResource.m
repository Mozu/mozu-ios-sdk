
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZULocationInventoryClient.h"
#import "MOZULocationInventoryResource.h"


@interface MOZULocationInventoryResource()
@property(readwrite, nonatomic) MOZUAPIContext * apiContext;
@end

@implementation MOZULocationInventoryResource

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

-(void)locationInventoriesWithDataViewMode:(MOZUDataViewMode)dataViewMode productCode:(NSString*)productCode startIndex:(NSNumber*)startIndex pageSize:(NSNumber*)pageSize sortBy:(NSString*)sortBy filter:(NSString*)filter userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUAdminLocationInventoryCollection* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZULocationInventoryClient clientForGetLocationInventoriesOperationWithDataViewMode:dataViewMode productCode:productCode startIndex:startIndex pageSize:pageSize sortBy:sortBy filter:filter userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

-(void)locationInventoryWithDataViewMode:(MOZUDataViewMode)dataViewMode productCode:(NSString*)productCode locationCode:(NSString*)locationCode userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUAdminLocationInventory* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZULocationInventoryClient clientForGetLocationInventoryOperationWithDataViewMode:dataViewMode productCode:productCode locationCode:locationCode userClaims:userClaims];
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

-(void)addLocationInventoryWithDataViewMode:(MOZUDataViewMode)dataViewMode locationInventoryList:(NSArray<MOZUAdminLocationInventory>*)locationInventoryList productCode:(NSString*)productCode userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(NSArray<MOZUAdminLocationInventory>* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZULocationInventoryClient clientForAddLocationInventoryOperationWithDataViewMode:dataViewMode locationInventoryList:locationInventoryList productCode:productCode userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

-(void)updateLocationInventoryWithDataViewMode:(MOZUDataViewMode)dataViewMode locationInventoryAdjustments:(NSArray<MOZULocationInventoryAdjustment>*)locationInventoryAdjustments productCode:(NSString*)productCode userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(NSArray<MOZUAdminLocationInventory>* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZULocationInventoryClient clientForUpdateLocationInventoryOperationWithDataViewMode:dataViewMode locationInventoryAdjustments:locationInventoryAdjustments productCode:productCode userClaims:userClaims];
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

-(void)deleteLocationInventoryWithDataViewMode:(MOZUDataViewMode)dataViewMode productCode:(NSString*)productCode locationCode:(NSString*)locationCode userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZULocationInventoryClient clientForDeleteLocationInventoryOperationWithDataViewMode:dataViewMode productCode:productCode locationCode:locationCode userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}



@end