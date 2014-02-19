
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZURuntimeCategoryClient.h"
#import "MOZURuntimeCategoryUrl.h"
#import "MozuRuntimeCategory.h"
#import "MozuRuntimeCategoryCollection.h"
#import "MozuRuntimeCategoryPagedCollection.h"


@implementation MOZURuntimeCategoryClient

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+(MOZUClient*)clientForGetCategoriesOperationWithFilter:(NSString*)filter startIndex:(NSNumber*)startIndex pageSize:(NSNumber*)pageSize sortBy:(NSString*)sortBy userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZURuntimeCategoryURL URLForGetCategoriesOperationWithFilter:filter startIndex:startIndex pageSize:pageSize sortBy:sortBy];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	if (userClaims != nil) {
		client.userClaims = userClaims;
	}

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZURuntimeCategoryPagedCollection alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+(MOZUClient*)clientForGetCategoryOperationWithCategoryId:(NSInteger)categoryId allowInactive:(NSNumber*)allowInactive userClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZURuntimeCategoryURL URLForGetCategoryOperationWithCategoryId:categoryId allowInactive:allowInactive];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	if (userClaims != nil) {
		client.userClaims = userClaims;
	}

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZURuntimeCategory alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+(MOZUClient*)clientForGetCategoryTreeOperationWithUserClaims:(MOZUUserAuthTicket*)userClaims {
	id url = [MOZURuntimeCategoryURL URLForGetCategoryTreeOperation];
	id verb = @"GET";
	MOZUClient* client = [[MOZUClient alloc] initWithResourceURL:url verb:verb];

	if (userClaims != nil) {
		client.userClaims = userClaims;
	}

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZURuntimeCategoryCollection alloc] initWithString:jsonResult error:nil];
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