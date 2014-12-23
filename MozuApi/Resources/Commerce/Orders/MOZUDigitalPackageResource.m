
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUDigitalPackageClient.h"
#import "MOZUDigitalPackageResource.h"


@interface MOZUDigitalPackageResource()
@property(readwrite, nonatomic) MOZUAPIContext * apiContext;
@end

@implementation MOZUDigitalPackageResource

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

@param digitalPackageId This parameter supplies package ID to get fulfillment actions for the digital package.
@param orderId This parameter provides the unique identifier of the order on which to get a list of available actions.
*/

- (void)availableDigitalPackageFulfillmentActionsWithOrderId:(NSString *)orderId digitalPackageId:(NSString *)digitalPackageId completionHandler:(void(^)(NSArray *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUDigitalPackageClient clientForGetAvailableDigitalPackageFulfillmentActionsOperationWithOrderId:orderId digitalPackageId:digitalPackageId];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
This operation retreives a digital package within an order and it requires two parameters: orderId and digitalPackageId.
@param digitalPackageId This parameter provides the digital package Id.
@param orderId This parameter provides the unique identifier of the order with which to associate the digital package.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)digitalPackageWithOrderId:(NSString *)orderId digitalPackageId:(NSString *)digitalPackageId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUDigitalPackage *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUDigitalPackageClient clientForGetDigitalPackageOperationWithOrderId:orderId digitalPackageId:digitalPackageId responseFields:responseFields];
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
Lets you apply a digital package to the order using the orderId and digitalPackage parameters.
@param body The digitalPackage parameter is a required parameter for the CreateDigitalPackages operation. The digitalPackage is the digital package to create and add to the order.
@param orderId The orderID is a required paramter for the digitalpackages operation. The orderId is a unique identifier of the order with which to associate the digital package.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)createDigitalPackageWithBody:(MOZUDigitalPackage *)body orderId:(NSString *)orderId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUDigitalPackage *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUDigitalPackageClient clientForCreateDigitalPackageOperationWithBody:body orderId:orderId responseFields:responseFields];
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
This method operates on one digital package, specified by the id given. This method ensures that the digital package ID provided is in the order with the id given, and then updates the properties of that package with the properties of the one passed in using the ‘digitalpackage’ parameter.
@param body This parameter provides the package content to update in the order.
@param digitalPackageId This parameter specifies the digital package to update in the order.
@param orderId This parameter provides the unique identifier of the order with which to associate the digital package.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)updateDigitalPackageWithBody:(MOZUDigitalPackage *)body orderId:(NSString *)orderId digitalPackageId:(NSString *)digitalPackageId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUDigitalPackage *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUDigitalPackageClient clientForUpdateDigitalPackageOperationWithBody:body orderId:orderId digitalPackageId:digitalPackageId responseFields:responseFields];
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
This operation deletes a digital package from an order. This operation requires three parameters: orderId, digitalPackageId, and digitalPackage.
@param digitalPackageId The digitalPackage ID is unique package ID to update on the order.
@param orderId The orderId is unique identifier of the order with which to associate the package.
*/

- (void)deleteDigitalPackageWithOrderId:(NSString *)orderId digitalPackageId:(NSString *)digitalPackageId completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUDigitalPackageClient clientForDeleteDigitalPackageOperationWithOrderId:orderId digitalPackageId:digitalPackageId];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}



@end