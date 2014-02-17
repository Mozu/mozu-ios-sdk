
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUDocumentTreeClient.h"
#import "MOZUDocumentTreeResource.h"


@interface MOZUDocumentTreeResource()
@property(readwrite, nonatomic) MOZUApiContext * apiContext;
@end

@implementation MOZUDocumentTreeResource

-(id)initWithAPIContext:(MOZUAPIContext *)apiContext {
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

-(void)treeDocumentWithDataViewMode:(MOZUDataViewMode)dataViewMode documentListName:(NSString*)documentListName documentName:(NSString*)documentName userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUDocument* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUDocumentTreeClient clientForGetTreeDocumentOperationWithDataViewMode:dataViewMode documentListName:documentListName documentName:documentName userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil {
			handler(result, error, response);
		}
	}];
}

-(void)treeDocumentContentWithDataViewMode:(MOZUDataViewMode)dataViewMode documentListName:(NSString*)documentListName documentName:(NSString*)documentName userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(NSInputStream* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUDocumentTreeClient clientForGetTreeDocumentContentOperationWithDataViewMode:dataViewMode documentListName:documentListName documentName:documentName userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil {
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

-(void)updateTreeDocumentContentWithDataViewMode:(MOZUDataViewMode)dataViewMode stream:(NSInputStream*)stream documentListName:(NSString*)documentListName documentName:(NSString*)documentName userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUDocumentTreeClient clientForUpdateTreeDocumentContentOperationWithDataViewMode:dataViewMode stream:stream documentListName:documentListName documentName:documentName userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil {
			handler(error, response);
		}
	}];
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

-(void)deleteTreeDocumentContentWithDataViewMode:(MOZUDataViewMode)dataViewMode stream:(NSInputStream*)stream documentListName:(NSString*)documentListName documentName:(NSString*)documentName userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUDocumentTreeClient clientForDeleteTreeDocumentContentOperationWithDataViewMode:dataViewMode stream:stream documentListName:documentListName documentName:documentName userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil {
			handler(error, response);
		}
	}];
}



@end