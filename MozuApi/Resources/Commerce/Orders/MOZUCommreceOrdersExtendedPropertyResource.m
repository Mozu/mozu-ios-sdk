
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUCommreceOrdersExtendedPropertyClient.h"
#import "MOZUCommreceOrdersExtendedPropertyResource.h"


@interface MOZUCommreceOrdersExtendedPropertyResource()
@property(readwrite, nonatomic) MOZUAPIContext * apiContext;
@end

@implementation MOZUCommreceOrdersExtendedPropertyResource

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
Retrieves the extended property string associated with the order. 
@param draft If true, retrieve the draft version of the order, which might include uncommitted changes to the order or its components.
@param orderId Unique identifier of the order.
*/

- (void)extendedPropertiesWithOrderId:(NSString *)orderId draft:(NSNumber *)draft completionHandler:(void(^)(NSArray<MOZUExtendedProperty> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCommreceOrdersExtendedPropertyClient clientForGetExtendedPropertiesOperationWithOrderId:orderId draft:draft];
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
Create an extended property for the order.
@param body Mozu.CommerceRuntime.Contracts.Commerce.ExtendedProperty ApiType DOCUMENT_HERE 
@param orderId Unique identifier of the order.
@param updateMode Specifies whether to update the original order, update the order in draft mode, or update the order in draft mode and then commit the changes to the original. Draft mode enables users to make incremental order changes before committing the changes to the original order. Valid values are "ApplyToOriginal," "ApplyToDraft," or "ApplyAndCommit."
@param version Determines whether or not to check versioning of items for concurrency purposes.
*/

- (void)addExtendedPropertiesWithBody:(NSArray<MOZUExtendedProperty> *)body orderId:(NSString *)orderId updateMode:(NSString *)updateMode version:(NSString *)version completionHandler:(void(^)(NSArray<MOZUExtendedProperty> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCommreceOrdersExtendedPropertyClient clientForAddExtendedPropertiesOperationWithBody:body orderId:orderId updateMode:updateMode version:version];
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
Updates one ore more extended properties.
@param body Mozu.CommerceRuntime.Contracts.Commerce.ExtendedProperty ApiType DOCUMENT_HERE 
@param key 
@param orderId Unique identifier of the order.
@param responseFields A list or array of fields returned for a call. These fields may be customized and may be used for various types of data calls in Mozu. For example, responseFields are returned for retrieving or updating attributes, carts, and messages in Mozu.
@param updateMode Specifies whether to update the original order, update the order in draft mode, or update the order in draft mode and then commit the changes to the original. Draft mode enables users to make incremental order changes before committing the changes to the original order. Valid values are "ApplyToOriginal," "ApplyToDraft," or "ApplyAndCommit."
@param upsert Inserts and updates an extended property.
        
@param version Determines whether or not to check versioning of items for concurrency purposes.
*/

- (void)updateExtendedPropertyWithBody:(MOZUExtendedProperty *)body orderId:(NSString *)orderId key:(NSString *)key updateMode:(NSString *)updateMode version:(NSString *)version upsert:(NSNumber *)upsert responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUExtendedProperty *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCommreceOrdersExtendedPropertyClient clientForUpdateExtendedPropertyOperationWithBody:body orderId:orderId key:key updateMode:updateMode version:version upsert:upsert responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Updates one or more extended properties.
@param body Mozu.CommerceRuntime.Contracts.Commerce.ExtendedProperty ApiType DOCUMENT_HERE 
@param orderId Unique identifier of the order.
@param updateMode Specifies whether to update the original order, update the order in draft mode, or update the order in draft mode and then commit the changes to the original. Draft mode enables users to make incremental order changes before committing the changes to the original order. Valid values are "ApplyToOriginal," "ApplyToDraft," or "ApplyAndCommit."
@param upsert Inserts and updates the extended property.
        
@param version Determines whether or not to check versioning of items for concurrency purposes.
*/

- (void)updateExtendedPropertiesWithBody:(NSArray<MOZUExtendedProperty> *)body orderId:(NSString *)orderId updateMode:(NSString *)updateMode version:(NSString *)version upsert:(NSNumber *)upsert completionHandler:(void(^)(NSArray<MOZUExtendedProperty> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCommreceOrdersExtendedPropertyClient clientForUpdateExtendedPropertiesOperationWithBody:body orderId:orderId updateMode:updateMode version:version upsert:upsert];
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
Deletes one or more extended properties.
@param key 
@param orderId Unique identifier of the order.
@param updateMode Specifies whether to update the original order, update the order in draft mode, or update the order in draft mode and then commit the changes to the original. Draft mode enables users to make incremental order changes before committing the changes to the original order. Valid values are "ApplyToOriginal," "ApplyToDraft," or "ApplyAndCommit."
@param version Determines whether or not to check versioning of items for concurrency purposes.
*/

- (void)deleteExtendedPropertyWithOrderId:(NSString *)orderId key:(NSString *)key updateMode:(NSString *)updateMode version:(NSString *)version completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCommreceOrdersExtendedPropertyClient clientForDeleteExtendedPropertyOperationWithOrderId:orderId key:key updateMode:updateMode version:version];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}

/**
Deletes the extended property associated with the order. 
@param body 
@param orderId Unique identifier of the order.
@param updateMode Specifies whether to update the original order, update the order in draft mode, or update the order in draft mode and then commit the changes to the original. Draft mode enables users to make incremental order changes before committing the changes to the original order. Valid values are "ApplyToOriginal," "ApplyToDraft," or "ApplyAndCommit."
@param version Determines whether or not to check versioning of items for concurrency purposes.
*/

- (void)deleteExtendedPropertiesWithBody:(NSArray *)body orderId:(NSString *)orderId updateMode:(NSString *)updateMode version:(NSString *)version completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCommreceOrdersExtendedPropertyClient clientForDeleteExtendedPropertiesOperationWithBody:body orderId:orderId updateMode:updateMode version:version];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}



@end