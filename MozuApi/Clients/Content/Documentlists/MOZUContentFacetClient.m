
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUContentFacetClient.h"
#import "MOZUContentFacetUrl.h"
#import "MozuContentFacet.h"


@implementation MOZUContentFacetClient

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+(MOZUClient*)clientForGetFacetsOperationWithDataViewMode:(MOZUDataViewMode)dataViewMode documentListName:(NSString*)documentListName propertyName:(NSString*)propertyName userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZUContentFacetURL URLForGetFacetsOperationWithDocumentListName:documentListName propertyName:propertyName];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	NSString *dataViewModeString = [@(dataViewMode) stringValue];
	[client setHeader:MOZU_X_VOL_DATAVIEW_MODE value:dataViewModeString];

	if (userClaims != nil) {
		client.userClaims = userClaims;
	}

	client.JSONParser = ^id(NSString *jsonResult) {
		NSArray * jsonAsArray = [NSJSONSerialization JSONObjectWithData:[jsonResult dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
		return [MOZUContentFacet arrayOfModelsFromDictionaries:jsonAsArray error:nil];
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


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//



@end