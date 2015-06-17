
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUTaxableTerritoryClient.h"
#import "MOZUTaxableTerritoryResource.h"


@interface MOZUTaxableTerritoryResource()
@property(readwrite, nonatomic) MOZUAPIContext * apiContext;
@end

@implementation MOZUTaxableTerritoryResource

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
Retrieves a list of the taxable territories configured for the site.
*/

- (void)taxableTerritoriesWithCompletionHandler:(void(^)(NSArray<MOZUTaxableTerritory> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUTaxableTerritoryClient clientForGetTaxableTerritoriesOperation];
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
Creates a new territory for which to calculate sales tax.
@param body Properties of the territory which is subject to sales tax.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)addTaxableTerritoryWithBody:(MOZUTaxableTerritory *)body responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUTaxableTerritory *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUTaxableTerritoryClient clientForAddTaxableTerritoryOperationWithBody:body responseFields:responseFields];
	client.context = self.apiContext;
	[client executeWithCompletionHandler:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
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
Updates one or more taxable territories configured for a site.
@param body Properties of the territory which is subject to sales tax.
*/

- (void)updateTaxableTerritoriesWithBody:(NSArray<MOZUTaxableTerritory> *)body completionHandler:(void(^)(NSArray<MOZUTaxableTerritory> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUTaxableTerritoryClient clientForUpdateTaxableTerritoriesOperationWithBody:body];
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



@end