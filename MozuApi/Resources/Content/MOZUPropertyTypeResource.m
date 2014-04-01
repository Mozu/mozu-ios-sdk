
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUPropertyTypeClient.h"
#import "MOZUPropertyTypeResource.h"



@interface MOZUPropertyTypeResource()
@property(readwrite, nonatomic) MOZUAPIContext *apiContext;
@end


@implementation MOZUPropertyTypeResource


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

@param pageSize 
@param startIndex 
*/

- (void)propertyTypesWithDataViewMode:(MOZUDataViewMode)dataViewMode pageSize:(NSNumber *)pageSize startIndex:(NSNumber *)startIndex userClaims:(MOZUUserAuthTicket *)userClaims completionHandler:(void(^)(MOZUPropertyTypeCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUPropertyTypeClient clientForGetPropertyTypesOperationWithDataViewMode:dataViewMode pageSize:pageSize startIndex:startIndex userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**

@param propertyTypeName 
*/

- (void)propertyTypeWithDataViewMode:(MOZUDataViewMode)dataViewMode propertyTypeName:(NSString *)propertyTypeName userClaims:(MOZUUserAuthTicket *)userClaims completionHandler:(void(^)(MOZUPropertyType *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUPropertyTypeClient clientForGetPropertyTypeOperationWithDataViewMode:dataViewMode propertyTypeName:propertyTypeName userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Retrieves the value types associated with a content property.
*/

- (void)propertyValueTypesWithDataViewMode:(MOZUDataViewMode)dataViewMode userClaims:(MOZUUserAuthTicket *)userClaims completionHandler:(void(^)(NSArray<MOZUPropertyValueType> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUPropertyTypeClient clientForPropertyValueTypesOperationWithDataViewMode:dataViewMode userClaims:userClaims];
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