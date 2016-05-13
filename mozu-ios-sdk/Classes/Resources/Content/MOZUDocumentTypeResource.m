
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUDocumentTypeClient.h"
#import "MOZUDocumentTypeResource.h"


@interface MOZUDocumentTypeResource()
@property(readwrite, nonatomic) MOZUAPIContext * apiContext;
@property(readwrite, nonatomic) MOZUDataViewMode dataViewMode;
@end

@implementation MOZUDocumentTypeResource

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
Retrieves a paged list of the system-defined document types.
@param pageSize The number of results to display on each page when creating paged results from a query. The maximum value is 200.
@param responseFields Use this field to include those fields which are not included by default.
@param startIndex When creating paged results from a query, this value indicates the zero-based offset in the complete result set where the returned entities begin. For example, with a PageSize of 25, to get the 51st through the 75th items, use startIndex=3.
*/

- (void)documentTypesWithPageSize:(NSNumber *)pageSize startIndex:(NSNumber *)startIndex responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUDocumentTypeCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUDocumentTypeClient clientForGetDocumentTypesOperationWithDataViewMode:self.dataViewMode pageSize:pageSize startIndex:startIndex responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Retrieves a system-defined document type.
@param documentTypeName The name of the document type to retrieve.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)documentTypeWithDocumentTypeName:(NSString *)documentTypeName responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUDocumentType *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUDocumentTypeClient clientForGetDocumentTypeOperationWithDataViewMode:self.dataViewMode documentTypeName:documentTypeName responseFields:responseFields];
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
Creates a new DocumentType
@param body The type of documents used in the CMS such as "web_page" or "template" or "image_url".
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)createDocumentTypeWithBody:(MOZUDocumentType *)body responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUDocumentType *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUDocumentTypeClient clientForCreateDocumentTypeOperationWithDataViewMode:self.dataViewMode body:body responseFields:responseFields];
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
Updates a DocumentType
@param body The type of documents used in the CMS such as "web_page" or "template" or "image_url".
@param documentTypeName The name of the document type to retrieve.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)updateDocumentTypeWithBody:(MOZUDocumentType *)body documentTypeName:(NSString *)documentTypeName responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUDocumentType *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUDocumentTypeClient clientForUpdateDocumentTypeOperationWithBody:body documentTypeName:documentTypeName responseFields:responseFields];
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



@end