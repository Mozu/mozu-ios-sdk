
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUSoftAllocationClient.h"
#import "MOZUSoftAllocationResource.h"


@interface MOZUSoftAllocationResource()
@property(readwrite, nonatomic) MOZUAPIContext * apiContext;
@end

@implementation MOZUSoftAllocationResource

-(id)initWithAPIContext:(MOZUAPIContext *)apiContext {
	if (self = [super init]) {
		self.apiContext = apiContext;
		return self;
	}
	else {
		return nil;
	}
}


-(id)cloneWithAPIContextModification:(MOZUAPIContextModificationBlock)apiContextModification {
	MOZUAPIContext* cloned = [self.apiContext cloneWith:apiContextModification];
	return [self initWithAPIContext:cloned];
}

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieves a list of sof allocations according to any specified filter criteria and sort options.
@param filter A set of filter expressions representing the search parameters for a query: eq=equals, ne=not equals, gt=greater than, lt = less than or equals, gt = greater than or equals, lt = less than or equals, sw = starts with, or cont = contains. Optional.
@param pageSize The number of results to display on each page when creating paged results from a query. The amount is divided and displayed on the `pageCount `amount of pages. The default is 20 and maximum value is 200 per page.
@param responseFields A list or array of fields returned for a call. These fields may be customized and may be used for various types of data calls in Mozu. For example, responseFields are returned for retrieving or updating attributes, carts, and messages in Mozu.
@param sortBy The element to sort the results by and the channel in which the results appear. Either ascending (a-z) or descending (z-a) channel. Optional.
@param startIndex When creating paged results from a query, this value indicates the zero-based offset in the complete result set where the returned entities begin. For example, with a `pageSize `of 25, to get the 51st through the 75th items, use `startIndex=3`.
*/

- (void)softAllocationsWithStartIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUSoftAllocationCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUSoftAllocationClient clientForGetSoftAllocationsOperationWithStartIndex:startIndex pageSize:pageSize sortBy:sortBy filter:filter responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Retrieves the details of a soft allocation.
@param responseFields A list or array of fields returned for a call. These fields may be customized and may be used for various types of data calls in Mozu. For example, responseFields are returned for retrieving or updating attributes, carts, and messages in Mozu.
@param softAllocationId 
*/

- (void)softAllocationWithSoftAllocationId:(NSInteger)softAllocationId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUSoftAllocation *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUSoftAllocationClient clientForGetSoftAllocationOperationWithSoftAllocationId:softAllocationId responseFields:responseFields];
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
Creates a new product reservation for a product. This places a hold on the product inventory for the quantity specified during the ordering process.
@param body Mozu.ProductAdmin.Contracts.SoftAllocation ApiType DOCUMENT_HERE 
*/

- (void)addSoftAllocationsWithBody:(NSArray<MOZUSoftAllocation> *)body completionHandler:(void(^)(NSArray<MOZUSoftAllocation> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUSoftAllocationClient clientForAddSoftAllocationsOperationWithBody:body];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Converts a set of existing softAllocations into productReservations
@param body Mozu.ProductAdmin.Contracts.SoftAllocation ApiType DOCUMENT_HERE 
*/

- (void)convertToProductReservationWithBody:(NSArray<MOZUSoftAllocation> *)body completionHandler:(void(^)(NSArray<MOZUProductReservation> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUSoftAllocationClient clientForConvertToProductReservationOperationWithBody:body];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Updates a set of softAllocations expiration time in a non trassactional batch
@param body Mozu.ProductAdmin.Contracts.SoftAllocationRenew ApiType DOCUMENT_HERE 
*/

- (void)renewSoftAllocationsWithBody:(MOZUSoftAllocationRenew *)body completionHandler:(void(^)(NSArray<MOZUSoftAllocation> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUSoftAllocationClient clientForRenewSoftAllocationsOperationWithBody:body];
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
Updates a soft allocationt. This updates a hold on the product inventory for the quantity specified during the ordering process.
@param body Mozu.ProductAdmin.Contracts.SoftAllocation ApiType DOCUMENT_HERE 
*/

- (void)updateSoftAllocationsWithBody:(NSArray<MOZUSoftAllocation> *)body completionHandler:(void(^)(NSArray<MOZUSoftAllocation> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUSoftAllocationClient clientForUpdateSoftAllocationsOperationWithBody:body];
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
Deletes a soft allocation. You might delete a allocation when an order or cart is not processed to return the product quantity back to inventory.
@param softAllocationId 
*/

- (void)deleteSoftAllocationWithSoftAllocationId:(NSInteger)softAllocationId completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUSoftAllocationClient clientForDeleteSoftAllocationOperationWithSoftAllocationId:softAllocationId];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}



@end