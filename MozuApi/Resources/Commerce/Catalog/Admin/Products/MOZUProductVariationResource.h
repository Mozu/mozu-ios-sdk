
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

#import "MOZUProductVariation.h"
#import "MOZUProductVariationPagedCollection.h"
#import "MOZUProductVariationCollection.h"


@interface MOZUProductVariationResource : NSObject


@property(readonly, nonatomic) MOZUAPIContext *apiContext;

- (instancetype)initWithAPIContext:(MOZUAPIContext *)apiContext;


//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieves the details of a product variation based on the supplied product code and variation key.
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
@param variationKey System-generated key that represents the attribute values that uniquely identify a specific product variation.
*/

- (void)productVariationWithDataViewMode:(MOZUDataViewMode)dataViewMode productCode:(NSString *)productCode variationKey:(NSString *)variationKey completionHandler:(void(^)(MOZUProductVariation *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Retrieves a list of the product variations configured for the specified product code.
@param filter A set of expressions that consist of a field, operator, and value and represent search parameter syntax when filtering results of a query. Valid operators include equals (eq), does not equal (ne), greater than (gt), less than (lt), greater than or equal to (ge), less than or equal to (le), starts with (sw), or contains (cont). For example - "filter=IsDisplayed+eq+true"
@param pageSize The number of results to display on each page when creating paged results from a query. The maximum value is 200.
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
@param sortBy The property by which to sort results and whether the results appear in ascending (a-z) order, represented by ASC or in descending (z-a) order, represented by DESC. The sortBy parameter follows an available property. For example: "sortBy=productCode+asc"
@param startIndex When creating paged results from a query, this value indicates the zero-based offset in the complete result set where the returned entities begin. For example, with a PageSize of 25, to get the 51st through the 75th items, use startIndex=3.
*/

- (void)productVariationsWithDataViewMode:(MOZUDataViewMode)dataViewMode productCode:(NSString *)productCode startIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter completionHandler:(void(^)(MOZUProductVariationPagedCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
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

/**
Modifies the collection of variations for the specified product code. Because this PUT replaces the existing resource, supply all information necessary to maintain for the product variation.
@param body Wrapper for the collection of variations configured for the specified product code.
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
*/

- (void)updateProductVariationsWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(MOZUProductVariationCollection *)body productCode:(NSString *)productCode completionHandler:(void(^)(MOZUProductVariationCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Modifies the details of a variation, based on the supplied variation key, for the specified product code.
@param body Wrapper for the properties of the specified product variation.
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
@param variationKey System-generated key that represents the attribute values that uniquely identify a specific product variation.
*/

- (void)updateProductVariationWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(MOZUProductVariation *)body productCode:(NSString *)productCode variationKey:(NSString *)variationKey completionHandler:(void(^)(MOZUProductVariation *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Deletes a variation, based on the supplied variation key, for the specified product code.
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
@param variationKey System-generated key that represents the attribute values that uniquely identify a specific product variation.
*/

- (void)deleteProductVariationWithDataViewMode:(MOZUDataViewMode)dataViewMode productCode:(NSString *)productCode variationKey:(NSString *)variationKey completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
;


@end