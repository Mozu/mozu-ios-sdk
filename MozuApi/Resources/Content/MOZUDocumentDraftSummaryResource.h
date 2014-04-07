
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

#import "MOZUDocumentDraftSummaryPagedCollection.h"


@interface MOZUDocumentDraftSummaryResource : NSObject


@property(readonly, nonatomic) MOZUAPIContext *apiContext;

- (instancetype)initWithAPIContext:(MOZUAPIContext *)apiContext;


//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieves a list of the documents currently in draft state, according to any defined filter and sort criteria.
@param documentLists Lists that contain the document drafts.
@param pageSize The number of results to display on each page when creating paged results from a query. The maximum value is 200.
@param startIndex When creating paged results from a query, this value indicates the zero-based offset in the complete result set where the returned entities begin. For example, with a PageSize of 25, to get the 51st through the 75th items, use startIndex=3.
*/

- (void)listDocumentDraftSummariesWithDataViewMode:(MOZUDataViewMode)dataViewMode pageSize:(NSNumber *)pageSize startIndex:(NSNumber *)startIndex documentLists:(NSString *)documentLists completionHandler:(void(^)(MOZUDocumentDraftSummaryPagedCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

/**
Deletes the drafts of the specified documents. Published documents cannot be deleted.
@param body Unique identifiers of the documents to delete.
@param documentLists List of document lists that contain documents to delete.
*/

- (void)deleteDocumentDraftsWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(NSString *)body documentLists:(NSString *)documentLists completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

/**
Publish one or more document drafts to live content on the site.
@param body List of unique identifiers of the document drafts to publish.
@param documentLists List of document lists that contain documents to publish.
*/

- (void)publishDocumentsWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(NSString *)body documentLists:(NSString *)documentLists completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//



@end