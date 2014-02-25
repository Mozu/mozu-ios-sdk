
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUTaxableTerritoryClient.h"
#import "MOZUTaxableTerritoryUrlComponents.h"
#import "MozuTaxableTerritory.h"


@implementation MOZUTaxableTerritoryClient

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+(MOZUClient*)clientForGetTaxableTerritoriesOperationWithUserClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUTaxableTerritoryURLComponents URLComponentsForGetTaxableTerritoriesOperation];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	client.userClaims = userClaims;

	client.JSONParser = ^id(NSString *jsonResult) {
		NSArray * jsonAsArray = [NSJSONSerialization JSONObjectWithData:[jsonResult dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
		return [MOZUTaxableTerritory arrayOfModelsFromDictionaries:jsonAsArray error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

+(MOZUClient*)clientForAddTaxableTerritoryOperationWithBody:(MOZUTaxableTerritory*)body userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUTaxableTerritoryURLComponents URLComponentsForAddTaxableTerritoryOperation];
	id verb = @"POST";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	client.body = body;
	client.userClaims = userClaims;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUTaxableTerritory alloc] initWithString:jsonResult error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

+(MOZUClient*)clientForUpdateTaxableTerritoriesOperationWithBody:(NSArray<MOZUTaxableTerritory>*)body userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUTaxableTerritoryURLComponents URLComponentsForUpdateTaxableTerritoriesOperation];
	id verb = @"PUT";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	client.body = body;
	client.userClaims = userClaims;

	client.JSONParser = ^id(NSString *jsonResult) {
		NSArray * jsonAsArray = [NSJSONSerialization JSONObjectWithData:[jsonResult dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
		return [MOZUTaxableTerritory arrayOfModelsFromDictionaries:jsonAsArray error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//



@end