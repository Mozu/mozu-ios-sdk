
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import <Foundation/Foundation.h>
#import "MOZUClient.h"
#import "MOZUAPIContext.h"

#import "MOZUDocumentType.h"
#import "MOZUDocumentTypeCollection.h"


@interface MOZUDocumentTypeResource : NSObject


@property(readonly, nonatomic) MOZUDataViewMode dataViewMode;
@property(readonly, nonatomic) MOZUAPIContext * apiContext;

-(id)initWithAPIContext:(MOZUAPIContext *)apiContext;
-(id)initWithAPIContext:(MOZUAPIContext *)apiContext dataViewMode:(MOZUDataViewMode)dataViewMode;

-(id)cloneWithAPIContextModification:(MOZUAPIContextModificationBlock)apiContextModification;

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
;
/**
Retrieves a system-defined document type.
@param documentTypeName The name of the document type to retrieve.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)documentTypeWithDocumentTypeName:(NSString *)documentTypeName responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUDocumentType *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

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
;

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
;

//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//



@end