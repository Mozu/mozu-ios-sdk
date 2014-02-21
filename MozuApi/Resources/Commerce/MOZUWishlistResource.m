
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUWishlistClient.h"
#import "MOZUWishlistResource.h"



@interface MOZUWishlistResource()
@property(readwrite, nonatomic) MOZUAPIContext * apiContext;
@end


@implementation MOZUWishlistResource


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

/**
Retrieves a list of shopper wish lists according to any filter and sort criteria.
@param filter A set of expressions that consist of a field, operator, and value and represent search parameter syntax when filtering results of a query. Valid operators include equals (eq), does not equal (ne), greater than (gt), less than (lt), greater than or equal to (ge), less than or equal to (le), starts with (sw), or contains (cont). For example - "filter=IsDisplayed+eq+true"
@param pageSize The number of results to display on each page when creating paged results from a query. The maximum value is 200.
@param q A list of search terms to use in the query when searching across wish list name. Separate multiple search terms with a space character.
@param qLimit The maximum number of search results to return in the response. You can limit any range between 1-100.
@param sortBy The property by which to sort results and whether the results appear in ascending (a-z) order, represented by ASC or in descending (z-a) order, represented by DESC. The sortBy parameter follows an available property. For example: "sortBy=productCode+asc"
@param startIndex When creating paged results from a query, this value indicates the zero-based offset in the complete result set where the returned entities begin. For example, with a PageSize of 25, to get the 51st through the 75th items, use startIndex=3.
*/

-(void)wishlistsWithStartIndex:(NSNumber*)startIndex pageSize:(NSNumber*)pageSize sortBy:(NSString*)sortBy filter:(NSString*)filter q:(NSString*)q qLimit:(NSNumber*)qLimit userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUWishlistCollection* result, MOZUApiError* error, NSHTTPURLResponse* response))handler
 {
	MOZUClient * client = [MOZUWishlistClient clientForGetWishlistsOperationWithStartIndex:startIndex pageSize:pageSize sortBy:sortBy filter:filter q:q qLimit:qLimit userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Retrieves the details of the shopper wish list specified in the request.
@param wishlistId Unique identifier of the shopper wish list to retrieve.
*/

-(void)wishlistWithWishlistId:(NSString*)wishlistId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUWishlist* result, MOZUApiError* error, NSHTTPURLResponse* response))handler
 {
	MOZUClient * client = [MOZUWishlistClient clientForGetWishlistOperationWithWishlistId:wishlistId userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Retrieves the details of a wish list by supplying the wish list name.
@param customerAccountId The unique identifier of the customer account for which to retrieve wish lists.
@param wishlistName The name of the wish list to retrieve.
*/

-(void)wishlistByNameWithCustomerAccountId:(NSInteger)customerAccountId wishlistName:(NSString*)wishlistName userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUWishlist* result, MOZUApiError* error, NSHTTPURLResponse* response))handler
 {
	MOZUClient * client = [MOZUWishlistClient clientForGetWishlistByNameOperationWithCustomerAccountId:customerAccountId wishlistName:wishlistName userClaims:userClaims];
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

/**
Creates a new shopper wish list for the associated customer account. Although customer accounts are maintained at the tenant level, the system stores wish lists at the site level. Newly created wish lists do not have any items.
@param body Properties of the wish list to create.
*/

-(void)createWishlistWithBody:(MOZUWishlist*)body userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUWishlist* result, MOZUApiError* error, NSHTTPURLResponse* response))handler
 {
	MOZUClient * client = [MOZUWishlistClient clientForCreateWishlistOperationWithBody:body userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
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
Updates one or more properties of a shopper wish list defined for a customer account.
@param body Properties of the shopper wish list to update.
@param wishlistId Unique identifier of the shopper wish list to update.
*/

-(void)updateWishlistWithBody:(MOZUWishlist*)body wishlistId:(NSString*)wishlistId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUWishlist* result, MOZUApiError* error, NSHTTPURLResponse* response))handler
 {
	MOZUClient * client = [MOZUWishlistClient clientForUpdateWishlistOperationWithBody:body wishlistId:wishlistId userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
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
Deletes the shopper wish list specified in the request and all items associated with it.
@param wishlistId Unique identifier of the wish list to delete.
*/

-(void)deleteWishlistWithWishlistId:(NSString*)wishlistId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUApiError* error, NSHTTPURLResponse* response))handler
 {
	MOZUClient * client = [MOZUWishlistClient clientForDeleteWishlistOperationWithWishlistId:wishlistId userClaims:userClaims];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, MOZUApiError *error, NSHTTPURLResponse *response) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}



@end