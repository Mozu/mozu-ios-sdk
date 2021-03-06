
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
#import "MOZUAPIContext.h"

#import "MOZUExtensibleAttribute.h"
#import "MOZUExtensibleAttributeCollection.h"
#import "MOZUExtensibleAttributeVocabularyValue.h"


@interface MOZUCustomersAttributeResource : NSObject


@property(readonly, nonatomic) MOZUAPIContext * apiContext;

-(id)initWithAPIContext:(MOZUAPIContext *)apiContext;

-(id)cloneWithAPIContextModification:(MOZUAPIContextModificationBlock)apiContextModification;

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieves a list of customer attributes according to any filter and sort criteria specified in the request.
@param filter A set of expressions that consist of a field, operator, and value and represent search parameter syntax when filtering results of a query. Valid operators include equals (eq), does not equal (ne), greater than (gt), less than (lt), greater than or equal to (ge), less than or equal to (le), starts with (sw), or contains (cont). For example - "filter=IsDisplayed+eq+true"
@param pageSize The number of results to display on each page when creating paged results from a query. The maximum value is 200.
@param responseFields Use this field to include those fields which are not included by default.
@param sortBy The property by which to sort results and whether the results appear in ascending (a-z) order, represented by ASC or in descending (z-a) order, represented by DESC. The sortBy parameter follows an available property. For example: "sortBy=productCode+asc"
@param startIndex When creating paged results from a query, this value indicates the zero-based offset in the complete result set where the returned entities begin. For example, with a PageSize of 25, to get the 51st through the 75th items, use startIndex=3.
*/

- (void)attributesWithStartIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUExtensibleAttributeCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Retrieve a list of the vocabulary values defined for the customer attribute specified in the request.
@param attributeFQN The fully qualified name of the attribute, which is a user defined attribute identifier.
*/

- (void)attributeVocabularyValuesWithAttributeFQN:(NSString *)attributeFQN completionHandler:(void(^)(NSArray<MOZUExtensibleAttributeVocabularyValue> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Retrieve a customer attribute definition by supplying its fully qualified name.
@param attributeFQN The fully qualified name of the attribute, which is a user defined attribute identifier.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)attributeWithAttributeFQN:(NSString *)attributeFQN responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUExtensibleAttribute *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

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