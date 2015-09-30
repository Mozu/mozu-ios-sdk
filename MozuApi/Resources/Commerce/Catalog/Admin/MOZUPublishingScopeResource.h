
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

#import "MOZUPublishingScope.h"
#import "MOZUPublishSet.h"
#import "MOZUPublishSetCollection.h"


@interface MOZUPublishingScopeResource : NSObject


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
Retrieves the details of a single PublishSet.
@param publishSetCode 
@param responseFields A list or array of fields returned for a call. These fields may be customized and may be used for various types of data calls in Mozu. For example, responseFields are returned for retrieving or updating attributes, carts, and messages in Mozu.
*/

- (void)publishSetWithPublishSetCode:(NSString *)publishSetCode responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUPublishSet *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Retrieves a list of PublishSets including the product counts.
@param responseFields A list or array of fields returned for a call. These fields may be customized and may be used for various types of data calls in Mozu. For example, responseFields are returned for retrieving or updating attributes, carts, and messages in Mozu.
*/

- (void)publishSetsWithResponseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUPublishSetCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

/**
Deletes the draft version of product changes for each product code specified in the request.
@param body Describes the scope of the product publishing update, which can include individual product codes or all pending changes.
*/

- (void)discardDraftsWithBody:(MOZUPublishingScope *)body completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Publishes the draft version of product changes for each product code specified in the request, and changes the product publish state to "live".
@param body Describes the scope of the product publishing update, which can include individual product codes or all pending changes.
*/

- (void)publishDraftsWithBody:(MOZUPublishingScope *)body completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
admin-publishing Post AssignProductsToPublishSet description DOCUMENT_HERE 
@param body Mozu.ProductAdmin.Contracts.PublishSet ApiType DOCUMENT_HERE 
@param responseFields A list or array of fields returned for a call. These fields may be customized and may be used for various types of data calls in Mozu. For example, responseFields are returned for retrieving or updating attributes, carts, and messages in Mozu.
*/

- (void)assignProductsToPublishSetWithBody:(MOZUPublishSet *)body responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUPublishSet *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

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

/**
Removes all details about a PublishSet from the product service. If the discardDrafts param is true, it also deletes the product drafts.
@param discardDrafts 
@param publishSetCode 
*/

- (void)deletePublishSetWithPublishSetCode:(NSString *)publishSetCode discardDrafts:(NSNumber *)discardDrafts completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
;


@end