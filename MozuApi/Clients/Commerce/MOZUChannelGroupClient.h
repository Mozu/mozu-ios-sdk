
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import <Foundation/Foundation.h>
#import "MOZUClient.h"
#import "MOZUChannelGroup.h"
#import "MOZUChannelGroupCollection.h"


@interface MOZUChannelGroupClient : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieves a list of defined channel groups according to any filter and sort criteria specified in the request.
@param filter A set of expressions that consist of a field, operator, and value and represent search parameter syntax when filtering results of a query. Valid operators include equals (eq), does not equal (ne), greater than (gt), less than (lt), greater than or equal to (ge), less than or equal to (le), starts with (sw), or contains (cont). For example - "filter=IsDisplayed+eq+true"
@param pageSize The number of results to display on each page when creating paged results from a query. The maximum value is 200.
@param responseFields Use this field to include those fields which are not included by default.
@param sortBy The property by which to sort results and whether the results appear in ascending (a-z) order, represented by ASC or in descending (z-a) order, represented by DESC. The sortBy parameter follows an available property. For example: "sortBy=productCode+asc"
@param startIndex When creating paged results from a query, this value indicates the zero-based offset in the complete result set where the returned entities begin. For example, with a PageSize of 25, to get the 51st through the 75th items, use startIndex=3.
*/

+ (MOZUClient *)clientForGetChannelGroupsOperationWithStartIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter responseFields:(NSString *)responseFields;

/**
Retrieves the details of a defined channel group.
@param code User-defined code that uniqely identifies the channel group.
@param responseFields Use this field to include those fields which are not included by default.
*/

+ (MOZUClient *)clientForGetChannelGroupOperationWithCode:(NSString *)code responseFields:(NSString *)responseFields;


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

/**
Creates a new group of channels with common information.
@param body Properties of a group of channels that share common information.
@param responseFields Use this field to include those fields which are not included by default.
*/

+ (MOZUClient *)clientForCreateChannelGroupOperationWithBody:(MOZUChannelGroup *)body responseFields:(NSString *)responseFields;


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

/**
Updates one or more properties of a defined channel group.
@param body Properties of a group of channels that share common information.
@param code User-defined code that uniqely identifies the channel group.
@param responseFields Use this field to include those fields which are not included by default.
*/

+ (MOZUClient *)clientForUpdateChannelGroupOperationWithBody:(MOZUChannelGroup *)body code:(NSString *)code responseFields:(NSString *)responseFields;


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Deletes a defined group of channels, which removes the group association with each channel in the group but does not delete the channel definitions themselves.
@param code User-defined code that uniqely identifies the channel group.
*/

+ (MOZUClient *)clientForDeleteChannelGroupOperationWithCode:(NSString *)code;



@end