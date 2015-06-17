
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUCustomerSegmentClient.h"
#import "MOZUCustomerSegmentResource.h"


@interface MOZUCustomerSegmentResource()
@property(readwrite, nonatomic) MOZUAPIContext * apiContext;
@end

@implementation MOZUCustomerSegmentResource

-(id)initWithAPIContext:(MOZUAPIContext *)apiContext {
	if (self = [super init]) {
		self.apiContext = apiContext;
		return self;
	}
	else {
		return nil;
	}
}


-(id)cloneWithAPIContextModification:(MOZUAPIContextModificationBlock)apiContextModification {
	MOZUAPIContext* cloned = [self.apiContext cloneWith:apiContextModification];
	return [self initWithAPIContext:cloned];
}

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieves a list of defined customer segments according to any filter and sort criteria.
@param filter A set of expressions that consist of a field, operator, and value and represent search parameter syntax when filtering results of a query. Valid operators include equals (eq), does not equal (ne), greater than (gt), less than (lt), greater than or equal to (ge), less than or equal to (le), starts with (sw), or contains (cont). For example - "filter=IsDisplayed+eq+true"
@param pageSize The number of results to display on each page when creating paged results from a query. The maximum value is 200.
@param responseFields Use this field to include those fields which are not included by default.
@param sortBy The property by which to sort results and whether the results appear in ascending (a-z) order, represented by ASC or in descending (z-a) order, represented by DESC. The sortBy parameter follows an available property. For example: "sortBy=productCode+asc"
@param startIndex When creating paged results from a query, this value indicates the zero-based offset in the complete result set where the returned entities begin. For example, with a PageSize of 25, to get the 51st through the 75th items, use startIndex=3.
*/

- (void)segmentsWithStartIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUCustomerSegmentCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerSegmentClient clientForGetSegmentsOperationWithStartIndex:startIndex pageSize:pageSize sortBy:sortBy filter:filter responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Retrieves the details of the customer segment specified in the request. This operation does not return a list of the customer accounts associated with the segment.
@param identifier Unique identifier of the customer segment to retrieve.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)segmentWithIdentifier:(NSInteger)identifier responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUCustomerSegment *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerSegmentClient clientForGetSegmentOperationWithIdentifier:identifier responseFields:responseFields];
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
Creates a new customer segments. New customer segments do not have any associated customer accounts.
@param body The Customer Segment object includes properties of a defined customer segment used to group customer accounts.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)addSegmentWithBody:(MOZUCustomerSegment *)body responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUCustomerSegment *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerSegmentClient clientForAddSegmentOperationWithBody:body responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}

/**
Adds one or more customer accounts to a defined customer segment.
@param body List of customer account IDs to add to the customer segment specified in the request.
@param identifier Unique identifier of the customer segment to retrieve.
*/

- (void)addSegmentAccountsWithBody:(NSArray *)body identifier:(NSInteger)identifier completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerSegmentClient clientForAddSegmentAccountsOperationWithBody:body identifier:identifier];
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

/**
Updates the details of the customer segment specified in the request.
@param body The Customer Segment object includes properties of a defined customer segment used to group customer accounts.
@param identifier Unique identifier of the customer segment to retrieve.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)updateSegmentWithBody:(MOZUCustomerSegment *)body identifier:(NSInteger)identifier responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUCustomerSegment *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerSegmentClient clientForUpdateSegmentOperationWithBody:body identifier:identifier responseFields:responseFields];
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

/**
Deletes a customer segment specified by its unique identifier. Deleting a segment removes any customer account associations, but does not delete the customer account itself.
@param identifier Unique identifier of the customer segment to retrieve.
*/

- (void)deleteSegmentWithIdentifier:(NSInteger)identifier completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerSegmentClient clientForDeleteSegmentOperationWithIdentifier:identifier];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}

/**
Removes single account from a segment.
@param accountId Unique identifier of the customer account.
@param identifier Unique identifier of the customer segment to retrieve.
*/

- (void)removeSegmentAccountWithIdentifier:(NSInteger)identifier accountId:(NSInteger)accountId completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUCustomerSegmentClient clientForRemoveSegmentAccountOperationWithIdentifier:identifier accountId:accountId];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}



@end