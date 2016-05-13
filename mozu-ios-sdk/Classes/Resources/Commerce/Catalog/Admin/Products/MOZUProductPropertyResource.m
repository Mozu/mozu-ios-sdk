
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUProductPropertyClient.h"
#import "MOZUProductPropertyResource.h"


@interface MOZUProductPropertyResource()
@property(readwrite, nonatomic) MOZUAPIContext * apiContext;
@property(readwrite, nonatomic) MOZUDataViewMode dataViewMode;
@end

@implementation MOZUProductPropertyResource

-(id)initWithAPIContext:(MOZUAPIContext *)apiContext {
	if (self = [super init]) {
		self.apiContext = apiContext;
		return self;
	}
	else {
		return nil;
	}
}

-(id)initWithAPIContext:(MOZUAPIContext *)apiContext dataViewMode:(MOZUDataViewMode) dataViewMode {
	if (self = [super init]) {
		self.apiContext = apiContext;
		self.dataViewMode = dataViewMode;
		return self;
	}
	else {
		return nil;
	}
}

-(id)cloneWithAPIContextModification:(MOZUAPIContextModificationBlock)apiContextModification {
	MOZUAPIContext* cloned = [self.apiContext cloneWith:apiContextModification];
	return [self initWithAPIContext:cloned dataViewMode:self.dataViewMode];
}

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieves a list of the property attributes configured for the product specified in the request.
@param productCode The unique, user-defined product code of a product, used throughout Mozu to reference and associate to a product.
*/

- (void)propertiesWithProductCode:(NSString *)productCode completionHandler:(void(^)(NSArray<MOZUAdminProductProperty> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUProductPropertyClient clientForGetPropertiesOperationWithDataViewMode:self.dataViewMode productCode:productCode];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Retrieves a collection of property values for localized content. This content is set by the locale code. 
@param attributeFQN Fully qualified name for an attribute.
@param productCode The unique, user-defined product code of a product, used throughout Mozu to reference and associate to a product.
@param value The value string to create.
*/

- (void)propertyValueLocalizedContentsWithProductCode:(NSString *)productCode attributeFQN:(NSString *)attributeFQN value:(NSString *)value completionHandler:(void(^)(NSArray<MOZUProductPropertyValueLocalizedContent> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUProductPropertyClient clientForGetPropertyValueLocalizedContentsOperationWithDataViewMode:self.dataViewMode productCode:productCode attributeFQN:attributeFQN value:value];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Retrieves the property value for localized content. This content is set by the locale code. 
@param attributeFQN Fully qualified name for an attribute.
@param localeCode Language used for the entity. Currently, only "en-US" is supported.
@param productCode The unique, user-defined product code of a product, used throughout Mozu to reference and associate to a product.
@param responseFields Use this field to include those fields which are not included by default.
@param value The value string to create.
*/

- (void)propertyValueLocalizedContentWithProductCode:(NSString *)productCode attributeFQN:(NSString *)attributeFQN value:(NSString *)value localeCode:(NSString *)localeCode responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUProductPropertyValueLocalizedContent *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUProductPropertyClient clientForGetPropertyValueLocalizedContentOperationWithDataViewMode:self.dataViewMode productCode:productCode attributeFQN:attributeFQN value:value localeCode:localeCode responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Retrieves the details of a property attribute configuration for the product specified in the request.
@param attributeFQN The fully qualified name of the attribute, which is a user defined attribute identifier.
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)propertyWithProductCode:(NSString *)productCode attributeFQN:(NSString *)attributeFQN responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUAdminProductProperty *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUProductPropertyClient clientForGetPropertyOperationWithDataViewMode:self.dataViewMode productCode:productCode attributeFQN:attributeFQN responseFields:responseFields];
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
Adds a property value for localized content. This content is set by the locale code. 
@param body Use this field to include those fields which are not included by default.
@param attributeFQN Fully qualified name for an attribute.
@param productCode The unique, user-defined product code of a product, used throughout Mozu to reference and associate to a product.
@param responseFields Use this field to include those fields which are not included by default.
@param value The value string to create.
*/

- (void)addPropertyValueLocalizedContentWithBody:(MOZUProductPropertyValueLocalizedContent *)body productCode:(NSString *)productCode attributeFQN:(NSString *)attributeFQN value:(NSString *)value responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUProductPropertyValueLocalizedContent *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUProductPropertyClient clientForAddPropertyValueLocalizedContentOperationWithDataViewMode:self.dataViewMode body:body productCode:productCode attributeFQN:attributeFQN value:value responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Configures a property attribute for the product specified in the request.
@param body Details of a property defined for a product.
@param productCode The unique, user-defined product code of a product, used throughout Mozu to reference and associate to a product.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)addPropertyWithBody:(MOZUAdminProductProperty *)body productCode:(NSString *)productCode responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUAdminProductProperty *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUProductPropertyClient clientForAddPropertyOperationWithDataViewMode:self.dataViewMode body:body productCode:productCode responseFields:responseFields];
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
Updates all property values for localized content. This content is set by the locale code. 
@param body Content of the product property value in the language defined for the locale code.
@param attributeFQN Fully qualified name for an attribute.
@param productCode The unique, user-defined product code of a product, used throughout Mozu to reference and associate to a product.
@param value The value string to create.
*/

- (void)updatePropertyValueLocalizedContentsWithBody:(NSArray<MOZUProductPropertyValueLocalizedContent> *)body productCode:(NSString *)productCode attributeFQN:(NSString *)attributeFQN value:(NSString *)value completionHandler:(void(^)(NSArray<MOZUProductPropertyValueLocalizedContent> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUProductPropertyClient clientForUpdatePropertyValueLocalizedContentsOperationWithDataViewMode:self.dataViewMode body:body productCode:productCode attributeFQN:attributeFQN value:value];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Updates the property value for localized content. This content is set by the locale code. 
@param body Content of the product property value in the language defined for the locale code.
@param attributeFQN Fully qualified name for an attribute.
@param localeCode Language used for the entity. Currently, only "en-US" is supported.
@param productCode The unique, user-defined product code of a product, used throughout Mozu to reference and associate to a product.
@param responseFields Use this field to include those fields which are not included by default.
@param value The value string to create.
*/

- (void)updatePropertyValueLocalizedContentWithBody:(MOZUProductPropertyValueLocalizedContent *)body productCode:(NSString *)productCode attributeFQN:(NSString *)attributeFQN value:(NSString *)value localeCode:(NSString *)localeCode responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUProductPropertyValueLocalizedContent *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUProductPropertyClient clientForUpdatePropertyValueLocalizedContentOperationWithDataViewMode:self.dataViewMode body:body productCode:productCode attributeFQN:attributeFQN value:value localeCode:localeCode responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Update one or more details of a property attribute configuration for the product specified in the request.
@param body Details of a property defined for a product.
@param attributeFQN The fully qualified name of the attribute, which is a user defined attribute identifier.
@param productCode The unique, user-defined product code of a product, used throughout Mozu to reference and associate to a product.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)updatePropertyWithBody:(MOZUAdminProductProperty *)body productCode:(NSString *)productCode attributeFQN:(NSString *)attributeFQN responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUAdminProductProperty *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUProductPropertyClient clientForUpdatePropertyOperationWithDataViewMode:self.dataViewMode body:body productCode:productCode attributeFQN:attributeFQN responseFields:responseFields];
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
Deletes the configuration of a property attribute for the product specified in the request.
@param attributeFQN The fully qualified name of the attribute, which is a user defined attribute identifier.
@param productCode The unique, user-defined product code of a product, used throughout Mozu to reference and associate to a product.
*/

- (void)deletePropertyWithProductCode:(NSString *)productCode attributeFQN:(NSString *)attributeFQN completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUProductPropertyClient clientForDeletePropertyOperationWithDataViewMode:self.dataViewMode productCode:productCode attributeFQN:attributeFQN];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}

/**
Deletes the property value for localized content. This content is set by the locale code. 
@param attributeFQN Fully qualified name for an attribute.
@param localeCode Language used for the entity. Currently, only "en-US" is supported.
@param productCode The unique, user-defined product code of a product, used throughout Mozu to reference and associate to a product.
@param value The value string to create.
*/

- (void)deletePropertyValueLocalizedContentWithProductCode:(NSString *)productCode attributeFQN:(NSString *)attributeFQN value:(NSString *)value localeCode:(NSString *)localeCode completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUProductPropertyClient clientForDeletePropertyValueLocalizedContentOperationWithDataViewMode:self.dataViewMode productCode:productCode attributeFQN:attributeFQN value:value localeCode:localeCode];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}



@end