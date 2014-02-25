
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUApplicationClient.h"
#import "MOZUApplicationUrlComponents.h"
#import "MozuSiteSettingsApplication.h"


@implementation MOZUApplicationClient

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+(MOZUClient*)clientForThirdPartyGetApplicationOperationWithUserClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUApplicationURLComponents URLComponentsForThirdPartyGetApplicationOperation];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	client.userClaims = userClaims;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUSiteSettingsApplication alloc] initWithString:jsonResult error:nil];
	};

	return client;
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

+(MOZUClient*)clientForThirdPartyUpdateApplicationOperationWithBody:(MOZUSiteSettingsApplication*)body userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUApplicationURLComponents URLComponentsForThirdPartyUpdateApplicationOperation];
	id verb = @"PUT";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	client.body = body;
	client.userClaims = userClaims;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUSiteSettingsApplication alloc] initWithString:jsonResult error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//



@end