
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUFulfillmentActionClient.h"
#import "MOZUFulfillmentActionResource.h"


@interface MOZUFulfillmentActionResource()
@property(readwrite, nonatomic) MOZUApiContext * apiContext;
@end

@implementation MOZUFulfillmentActionResource

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

-(void)fulfillmentInfoWithWithOrderId:(NSString*)orderId draft:(NSNumber*)draft userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUFulfillmentInfo* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUFulfillmentActionClient clientForGetFulfillmentInfoOperationWithWithOrderId:orderId draft:draft userClaims:userClaims];
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

-(void)performFulfillmentActionWithWithAction:(MOZUFulfillmentAction*)action orderId:(NSString*)orderId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUOrder* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUFulfillmentActionClient clientForPerformFulfillmentActionOperationWithWithaction:action orderId:orderId userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil {
			handler(result, error, response);
		}
	}];
}


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

-(void)setFulFillmentInfoWithWithFulfillmentInfo:(MOZUFulfillmentInfo*)fulfillmentInfo orderId:(NSString*)orderId updateMode:(NSString*)updateMode version:(NSString*)version userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUFulfillmentInfo* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUFulfillmentActionClient clientForSetFulFillmentInfoOperationWithWithfulfillmentInfo:fulfillmentInfo orderId:orderId updateMode:updateMode version:version userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil {
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