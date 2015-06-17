
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUSettingsApplicationClient.h"
#import "MOZUSettingsApplicationResource.h"


@interface MOZUSettingsApplicationResource()
@property(readwrite, nonatomic) MOZUAPIContext * apiContext;
@end

@implementation MOZUSettingsApplicationResource

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
Retrieve the settings of a third-party application.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)thirdPartyGetApplicationWithResponseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUSiteSettingsApplication *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUSettingsApplicationClient clientForThirdPartyGetApplicationOperationWithResponseFields:responseFields];
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


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

/**
Initializes an application with the necessary configured settings.
@param body Properties of an application installed in a tenant.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)thirdPartyUpdateApplicationWithBody:(MOZUSiteSettingsApplication *)body responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUSiteSettingsApplication *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUSettingsApplicationClient clientForThirdPartyUpdateApplicationOperationWithBody:body responseFields:responseFields];
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