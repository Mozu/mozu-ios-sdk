
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUInStockNotificationSubscriptionClient.h"
#import "MOZUInStockNotificationSubscriptionResource.h"


@interface MOZUInStockNotificationSubscriptionResource()
@property(readwrite, nonatomic) MOZUApiContext * apiContext;
@end

@implementation MOZUInStockNotificationSubscriptionResource

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

-(void)inStockNotificationSubscriptionsWithWithStartIndex:(NSNumber*)startIndex pageSize:(NSNumber*)pageSize sortBy:(NSString*)sortBy filter:(NSString*)filter userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUInStockNotificationSubscriptionCollection* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUInStockNotificationSubscriptionClient clientForGetInStockNotificationSubscriptionsOperationWithWithStartIndex:startIndex pageSize:pageSize sortBy:sortBy filter:filter userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil {
			handler(result, error, response);
		}
	}];
}

-(void)inStockNotificationSubscriptionWithWithId:(NSInteger)id userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUInStockNotificationSubscription* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUInStockNotificationSubscriptionClient clientForGetInStockNotificationSubscriptionOperationWithWithId:id userClaims:userClaims];
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

-(void)addInStockNotificationSubscriptionWithWithInStockNotificationSubscription:(MOZUInStockNotificationSubscription*)inStockNotificationSubscription userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUInStockNotificationSubscription* result, MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUInStockNotificationSubscriptionClient clientForAddInStockNotificationSubscriptionOperationWithWithinStockNotificationSubscription:inStockNotificationSubscription userClaims:userClaims];
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


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

-(void)deleteInStockNotificationSubscriptionWithWithId:(NSInteger)id userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUApiError* error, NSHTTPURLResponse* response))handler {
	MOZUClient * client = [MOZUInStockNotificationSubscriptionClient clientForDeleteInStockNotificationSubscriptionOperationWithWithId:id userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil {
			handler(error, response);
		}
	}];
}



@end