
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

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

-(void)documentTypesWithDataViewMode:(MOZUDataViewMode)dataViewMode pageSize:(NSNumber*)pageSize startIndex:(NSNumber*)startIndex userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUDocumentTypeCollection* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUDocumentTypeClient clientForGetDocumentTypesOperationWithDataViewMode:dataViewMode pageSize:pageSize startIndex:startIndex userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

-(void)documentTypeWithDataViewMode:(MOZUDataViewMode)dataViewMode documentTypeName:(NSString*)documentTypeName userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUDocumentType* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUDocumentTypeClient clientForGetDocumentTypeOperationWithDataViewMode:dataViewMode documentTypeName:documentTypeName userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
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