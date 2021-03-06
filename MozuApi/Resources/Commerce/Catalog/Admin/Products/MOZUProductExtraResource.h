
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

#import "MOZUProductExtraValueDeltaPrice.h"
#import "MOZUProductExtra.h"


@interface MOZUProductExtraResource : NSObject


@property(readonly, nonatomic) MOZUDataViewMode dataViewMode;
@property(readonly, nonatomic) MOZUAPIContext * apiContext;

-(id)initWithAPIContext:(MOZUAPIContext *)apiContext;
-(id)initWithAPIContext:(MOZUAPIContext *)apiContext dataViewMode:(MOZUDataViewMode)dataViewMode;

-(id)cloneWithAPIContextModification:(MOZUAPIContextModificationBlock)apiContextModification;

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieves a list of extras configured for the product according to any defined filter and sort criteria.
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
*/

- (void)extrasWithProductCode:(NSString *)productCode completionHandler:(void(^)(NSArray<MOZUProductExtra> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Retrieves a collection of all localized delta price values for a product extra. Localized delta prices are deltas between two differing monetary conversion amounts between countries, such as US Dollar vs Euro.
@param attributeFQN Fully qualified name for an attribute.
@param productCode The unique, user-defined product code of a product, used throughout Mozu to reference and associate to a product.
@param value The value string to create.
*/

- (void)extraValueLocalizedDeltaPricesWithProductCode:(NSString *)productCode attributeFQN:(NSString *)attributeFQN value:(NSString *)value completionHandler:(void(^)(NSArray<MOZUProductExtraValueDeltaPrice> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Retrieves the localized delta price value for a product extra. Localized delta prices are deltas between two differing monetary conversion amounts between countries, such as US Dollar vs Euro.
@param attributeFQN Fully qualified name for an attribute.
@param currencyCode The three character ISO currency code, such as USD for US Dollars.
@param productCode The unique, user-defined product code of a product, used throughout Mozu to reference and associate to a product.
@param responseFields Use this field to include those fields which are not included by default.
@param value The value string to create.
*/

- (void)extraValueLocalizedDeltaPriceWithProductCode:(NSString *)productCode attributeFQN:(NSString *)attributeFQN value:(NSString *)value currencyCode:(NSString *)currencyCode responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUProductExtraValueDeltaPrice *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Retrieves the details of an extra attribute configuration for the product specified in the request.
@param attributeFQN The fully qualified name of the attribute, which is a user defined attribute identifier.
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)extraWithProductCode:(NSString *)productCode attributeFQN:(NSString *)attributeFQN responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUProductExtra *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

/**
Adds a localized delta price value for a product extra. Localized delta prices are deltas between two differing monetary conversion amounts between countries, such as US Dollar vs Euro.
@param body The properties of the price difference between the product extra and the base product.
@param attributeFQN Fully qualified name for an attribute.
@param productCode The unique, user-defined product code of a product, used throughout Mozu to reference and associate to a product.
@param responseFields Use this field to include those fields which are not included by default.
@param value The value string to create.
*/

- (void)addExtraValueLocalizedDeltaPriceWithBody:(MOZUProductExtraValueDeltaPrice *)body productCode:(NSString *)productCode attributeFQN:(NSString *)attributeFQN value:(NSString *)value responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUProductExtraValueDeltaPrice *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Configure an extra attribute for the product specified in the request.
@param body Properties of an extra attribute to defined for a product that is associated with a product type that uses the extra. Setting up extras for a product enables shopper-entered information, such as initials for a monogram.
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)addExtraWithBody:(MOZUProductExtra *)body productCode:(NSString *)productCode responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUProductExtra *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

/**
Updates all localized delta price values for a product extra. Localized delta prices are deltas between two differing monetary conversion amounts between countries, such as US Dollar vs Euro.
@param body The properties of the price difference between the product extra and the base product.
@param attributeFQN Fully qualified name for an attribute.
@param productCode The unique, user-defined product code of a product, used throughout Mozu to reference and associate to a product.
@param value The value string to create.
*/

- (void)updateExtraValueLocalizedDeltaPricesWithBody:(NSArray<MOZUProductExtraValueDeltaPrice> *)body productCode:(NSString *)productCode attributeFQN:(NSString *)attributeFQN value:(NSString *)value completionHandler:(void(^)(NSArray<MOZUProductExtraValueDeltaPrice> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Updates the localized delta price value for a product extra. Localized delta prices are deltas between two differing monetary conversion amounts between countries, such as US Dollar vs Euro.
@param body The properties of the price difference between the product extra and the base product.
@param attributeFQN Fully qualified name for an attribute.
@param currencyCode The three character ISO currency code, such as USD for US Dollars.
@param productCode The unique, user-defined product code of a product, used throughout Mozu to reference and associate to a product.
@param responseFields Use this field to include those fields which are not included by default.
@param value The value string to create.
*/

- (void)updateExtraValueLocalizedDeltaPriceWithBody:(MOZUProductExtraValueDeltaPrice *)body productCode:(NSString *)productCode attributeFQN:(NSString *)attributeFQN value:(NSString *)value currencyCode:(NSString *)currencyCode responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUProductExtraValueDeltaPrice *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Updates the configuration of an extra attribute for the product specified in the request.
@param body Properties of an extra attribute to defined for a product that is associated with a product type that uses the extra. Setting up extras for a product enables shopper-entered information, such as initials for a monogram.
@param attributeFQN The fully qualified name of the attribute, which is a user defined attribute identifier.
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)updateExtraWithBody:(MOZUProductExtra *)body productCode:(NSString *)productCode attributeFQN:(NSString *)attributeFQN responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUProductExtra *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Delete a product extra configuration for the product specified in the request.
@param attributeFQN The fully qualified name of the attribute, which is a user defined attribute identifier.
@param productCode Merchant-created code that uniquely identifies the product such as a SKU or item number. Once created, the product code is read-only.
*/

- (void)deleteExtraWithProductCode:(NSString *)productCode attributeFQN:(NSString *)attributeFQN completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Deletes the localized delta price value for a product extra. Localized delta prices are deltas between two differing monetary conversion amounts between countries, such as US Dollar vs Euro.
@param attributeFQN Fully qualified name for an attribute.
@param currencyCode The three character ISO currency code, such as USD for US Dollars.
@param productCode The unique, user-defined product code of a product, used throughout Mozu to reference and associate to a product.
@param value Use this field to include those fields which are not included by default.
*/

- (void)deleteExtraValueLocalizedDeltaPriceWithProductCode:(NSString *)productCode attributeFQN:(NSString *)attributeFQN value:(NSString *)value currencyCode:(NSString *)currencyCode completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
;


@end