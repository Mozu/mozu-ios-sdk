
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

#import "MOZUAttributeInProductType.h"


@interface MOZUProductTypePropertyResource : NSObject


@property(readonly, nonatomic) MOZUAPIContext *apiContext;

- (instancetype)initWithAPIContext:(MOZUAPIContext *)apiContext;


//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieves a list of product property attributes defined for a product type.
@param productTypeId Identifier of the product type.
*/

- (void)propertiesWithDataViewMode:(MOZUDataViewMode)dataViewMode productTypeId:(NSInteger)productTypeId completionHandler:(void(^)(NSArray<MOZUAttributeInProductType> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Retrieves a product property attribute definition for the specified product type.
@param attributeFQN The fully qualified name of the attribute, which is a user defined attribute identifier.
@param productTypeId Identifier of the product type.
*/

- (void)propertyWithDataViewMode:(MOZUDataViewMode)dataViewMode productTypeId:(NSInteger)productTypeId attributeFQN:(NSString *)attributeFQN completionHandler:(void(^)(MOZUAttributeInProductType *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

/**
Assigns a property attribute to the specified product type, according to the information defined in the request.
@param body Properties of the property attribute to define for the specified product type.
@param productTypeId Identifier of the product type.
*/

- (void)addPropertyWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(MOZUAttributeInProductType *)body productTypeId:(NSInteger)productTypeId completionHandler:(void(^)(MOZUAttributeInProductType *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

/**
Updates the definition of a property attribute for the specified product type.
@param body Properties of the property attribute to define for the product type.
@param attributeFQN The fully qualified name of the attribute, which is a user defined attribute identifier.
@param productTypeId Identifier of the product type.
*/

- (void)updatePropertyWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(MOZUAttributeInProductType *)body productTypeId:(NSInteger)productTypeId attributeFQN:(NSString *)attributeFQN completionHandler:(void(^)(MOZUAttributeInProductType *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Removes a property attribute previously defined for the specified product type.
@param attributeFQN The fully qualified name of the attribute, which is a user defined attribute identifier.
@param productTypeId Identifier of the product type.
*/

- (void)deletePropertyWithDataViewMode:(MOZUDataViewMode)dataViewMode productTypeId:(NSInteger)productTypeId attributeFQN:(NSString *)attributeFQN completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
;


@end