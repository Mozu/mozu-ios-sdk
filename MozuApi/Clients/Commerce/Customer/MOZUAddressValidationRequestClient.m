
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUAddressValidationRequestClient.h"
#import "MOZUAddressValidationRequestUrl.h"
#import "MozuAddressValidationResponse.h"


@implementation MOZUAddressValidationRequestClient

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

+(MOZUClient*)clientForValidateAddressOperationWithWithAddressValidationRequest:(MOZUAddressValidationRequest*)addressValidationRequest userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUAddressValidationRequestURL URLForValidateAddressOperation];
	id verb = @"POST";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	if (userClaims != nil) {
		client.userClaims = userClaims;
	}

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUAddressValidationResponse alloc] initWithString:jsonResult error:nil];
	}

	return client;
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