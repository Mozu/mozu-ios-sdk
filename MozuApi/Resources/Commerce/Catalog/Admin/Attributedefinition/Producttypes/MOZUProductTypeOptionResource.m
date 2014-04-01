
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUProductTypeOptionClient.h"
#import "MOZUProductTypeOptionResource.h"



@interface MOZUProductTypeOptionResource()
@property(readwrite, nonatomic) MOZUAPIContext *apiContext;
@end


@implementation MOZUProductTypeOptionResource


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
Retrieves a list of option product attributes defined for the specified product type.
@param productTypeId Identifier of the product type to retrieve.
*/

- (void)optionsWithDataViewMode:(MOZUDataViewMode)dataViewMode productTypeId:(NSInteger)productTypeId userClaims:(MOZUUserAuthTicket *)userClaims completionHandler:(void(^)(NSArray<MOZUAttributeInProductType> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUProductTypeOptionClient clientForGetOptionsOperationWithDataViewMode:dataViewMode productTypeId:productTypeId userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Retrieves the details of an option attribute defined for the specified product type.
@param attributeFQN The fully qualified name of the attribute, which is a user defined attribute identifier.
@param productTypeId The identifier of the product type.
*/

- (void)optionWithDataViewMode:(MOZUDataViewMode)dataViewMode productTypeId:(NSInteger)productTypeId attributeFQN:(NSString *)attributeFQN userClaims:(MOZUUserAuthTicket *)userClaims completionHandler:(void(^)(MOZUAttributeInProductType *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUProductTypeOptionClient clientForGetOptionOperationWithDataViewMode:dataViewMode productTypeId:productTypeId attributeFQN:attributeFQN userClaims:userClaims];
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
Assigns an option attribute to the product type based on the information supplied in the request.
@param body Properties of the option attribute to define for the specified product type.
@param productTypeId Identifier of the product type.
*/

- (void)addOptionWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(MOZUAttributeInProductType *)body productTypeId:(NSInteger)productTypeId userClaims:(MOZUUserAuthTicket *)userClaims completionHandler:(void(^)(MOZUAttributeInProductType *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUProductTypeOptionClient clientForAddOptionOperationWithDataViewMode:dataViewMode body:body productTypeId:productTypeId userClaims:userClaims];
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
Updates an option attribute definition for the specified product type.
@param body Properties of the option product attribute to define for the specified product type.
@param attributeFQN The fully qualified name of the attribute, which is a user defined attribute identifier.
@param productTypeId Identifier of the product type.
*/

- (void)updateOptionWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(MOZUAttributeInProductType *)body productTypeId:(NSInteger)productTypeId attributeFQN:(NSString *)attributeFQN userClaims:(MOZUUserAuthTicket *)userClaims completionHandler:(void(^)(MOZUAttributeInProductType *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUProductTypeOptionClient clientForUpdateOptionOperationWithDataViewMode:dataViewMode body:body productTypeId:productTypeId attributeFQN:attributeFQN userClaims:userClaims];
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
Removes an option attribute definition for the specified product type.
@param attributeFQN The fully qualified name of the attribute, which is a user defined attribute identifier.
@param productTypeId Identifier of the product type.
*/

- (void)deleteOptionWithDataViewMode:(MOZUDataViewMode)dataViewMode productTypeId:(NSInteger)productTypeId attributeFQN:(NSString *)attributeFQN userClaims:(MOZUUserAuthTicket *)userClaims completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUProductTypeOptionClient clientForDeleteOptionOperationWithDataViewMode:dataViewMode productTypeId:productTypeId attributeFQN:attributeFQN userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}



@end