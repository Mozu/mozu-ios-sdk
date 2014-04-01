
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUAdminProductsLocationInventoryClient.h"
#import "MOZUAdminProductsLocationInventoryResource.h"



@interface MOZUAdminProductsLocationInventoryResource()
@property(readwrite, nonatomic) MOZUAPIContext *apiContext;
@end


@implementation MOZUAdminProductsLocationInventoryResource


- (instancetype)initWithAPIContext:(MOZUAPIContext *)apiContext {
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
Retrieves all locations for which a product has inventory defined and displays the inventory definition properties of each location.
@param filter A set of expressions that consist of a field, operator, and value and represent search parameter syntax when filtering results of a query. Valid operators include equals (eq), does not equal (ne), greater than (gt), less than (lt), greater than or equal to (ge), less than or equal to (le), starts with (sw), or contains (cont). For example - "filter=IsDisplayed+eq+true"
@param pageSize The number of results to display on each page when creating paged results from a query. The maximum value is 200.
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
@param sortBy The property by which to sort results and whether the results appear in ascending (a-z) order, represented by ASC or in descending (z-a) order, represented by DESC. The sortBy parameter follows an available property. For example: "sortBy=productCode+asc"
@param startIndex When creating paged results from a query, this value indicates the zero-based offset in the complete result set where the returned entities begin. For example, with a PageSize of 25, to get the 51st through the 75th items, use startIndex=3.
*/

- (void)locationInventoriesWithDataViewMode:(MOZUDataViewMode)dataViewMode productCode:(NSString *)productCode startIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter userClaims:(MOZUUserAuthTicket *)userClaims completionHandler:(void(^)(MOZUAdminLocationInventoryCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUAdminProductsLocationInventoryClient clientForGetLocationInventoriesOperationWithDataViewMode:dataViewMode productCode:productCode startIndex:startIndex pageSize:pageSize sortBy:sortBy filter:filter userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Retrieves the details of the inventory of the product in the location specified in the request.
@param locationCode User-defined code that identifies the location.
@param productCode 
*/

- (void)locationInventoryWithDataViewMode:(MOZUDataViewMode)dataViewMode productCode:(NSString *)productCode locationCode:(NSString *)locationCode userClaims:(MOZUUserAuthTicket *)userClaims completionHandler:(void(^)(MOZUAdminLocationInventory *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUAdminProductsLocationInventoryClient clientForGetLocationInventoryOperationWithDataViewMode:dataViewMode productCode:productCode locationCode:locationCode userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
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

/**
Creates a new location inventory definition for the product code specified in the request.
@param body Array list of the location inventory definitions associated with the product code specified in the request. For each location, you must define the locationCode value and the stockOnHand value. All other properties in the array are system-supplied and read only.
@param productCode ProductCodeBase
*/

- (void)addLocationInventoryWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(NSArray<MOZUAdminLocationInventory> *)body productCode:(NSString *)productCode userClaims:(MOZUUserAuthTicket *)userClaims completionHandler:(void(^)(NSArray<MOZUAdminLocationInventory> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUAdminProductsLocationInventoryClient clientForAddLocationInventoryOperationWithDataViewMode:dataViewMode body:body productCode:productCode userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
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

/**
Updates the current level of stock at each location associated with the product code specified in the request.
@param body 
@param productCode The product code of the product for which to update active stock on hand inventory at a specified location.
*/

- (void)updateLocationInventoryWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(NSArray<MOZULocationInventoryAdjustment> *)body productCode:(NSString *)productCode userClaims:(MOZUUserAuthTicket *)userClaims completionHandler:(void(^)(NSArray<MOZUAdminLocationInventory> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUAdminProductsLocationInventoryClient clientForUpdateLocationInventoryOperationWithDataViewMode:dataViewMode body:body productCode:productCode userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
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

/**
Deletes the location inventory definition for the product code specified in the request.
@param locationCode The code that identifies the location for which to delete product inventory.
@param productCode The product code for which to delete a location's inventory.
*/

- (void)deleteLocationInventoryWithDataViewMode:(MOZUDataViewMode)dataViewMode productCode:(NSString *)productCode locationCode:(NSString *)locationCode userClaims:(MOZUUserAuthTicket *)userClaims completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUAdminProductsLocationInventoryClient clientForDeleteLocationInventoryOperationWithDataViewMode:dataViewMode productCode:productCode locationCode:locationCode userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}



@end