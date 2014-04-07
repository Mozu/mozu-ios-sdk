
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUPublishingScopeClient.h"
#import "MOZUPublishingScopeResource.h"



@interface MOZUPublishingScopeResource()
@property(readwrite, nonatomic) MOZUAPIContext *apiContext;
@end


@implementation MOZUPublishingScopeResource


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


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

/**
Deletes the draft version of product changes for each product code specified in the request.
@param body Properties of the pending product changes to include in this operation.
*/

- (void)discardDraftsWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(MOZUPublishingScope *)body completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUPublishingScopeClient clientForDiscardDraftsOperationWithDataViewMode:dataViewMode body:body];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}

/**
Publishes the draft version of product changes for each product code specified in the request, and changes the product publish state to "live".
@param body Properties of the pending product changes to include in this operation.
*/

- (void)publishDraftsWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(MOZUPublishingScope *)body completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUPublishingScopeClient clientForPublishDraftsOperationWithDataViewMode:dataViewMode body:body];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}


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