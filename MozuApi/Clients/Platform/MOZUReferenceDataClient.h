
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
#import "MOZUTopLevelDomainCollection.h"
#import "MOZUContentLocaleCollection.h"
#import "MOZUBehaviorCollection.h"
#import "MOZUCountryCollection.h"
#import "MOZUTimeZoneCollection.h"
#import "MOZUBehaviorCategoryCollection.h"
#import "MOZUBehaviorCategory.h"
#import "MOZUCurrencyCollection.h"
#import "MOZUAddressSchemaCollection.h"
#import "MOZUBehavior.h"
#import "MOZUUnitOfMeasureCollection.h"
#import "MOZUAddressSchema.h"
#import "MOZUCountryWithStatesCollection.h"


@interface MOZUReferenceDataClient : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieves a specific address schema based on the country code provided. This operation allows the creation of custom shipping and billing address fields.
@param countryCode The 2-letter geographic code representing the country for the physical or mailing address. Currently limited to the US.
@param responseFields Use this field to include those fields which are not included by default.
*/

+ (MOZUClient *)clientForGetAddressSchemaOperationWithCountryCode:(NSString *)countryCode responseFields:(NSString *)responseFields;

/**
Retrieves the entire list of address schemas that the system supports.
@param responseFields Use this field to include those fields which are not included by default.
*/

+ (MOZUClient *)clientForGetAddressSchemasOperationWithResponseFields:(NSString *)responseFields;

/**
Retrieves the details of a behavior based on the behavior ID specified in the request.
@param behaviorId Unique identifier of the behavior.
@param responseFields Use this field to include those fields which are not included by default.
*/

+ (MOZUClient *)clientForGetBehaviorOperationWithBehaviorId:(NSInteger)behaviorId responseFields:(NSString *)responseFields;

/**
Retrieves the details of the behavior category specified in the request.
@param categoryId Unique identifier of the category to modify.
@param responseFields Use this field to include those fields which are not included by default.
*/

+ (MOZUClient *)clientForGetBehaviorCategoryOperationWithCategoryId:(NSInteger)categoryId responseFields:(NSString *)responseFields;

/**
Retrieves the list of behavior categories.
@param responseFields Use this field to include those fields which are not included by default.
*/

+ (MOZUClient *)clientForGetBehaviorCategoriesOperationWithResponseFields:(NSString *)responseFields;

/**
Retrieves a list of application behaviors.
@param responseFields Use this field to include those fields which are not included by default.
@param userType The user type associated with the behaviors to retrieve.
*/

+ (MOZUClient *)clientForGetBehaviorsOperationWithUserType:(NSString *)userType responseFields:(NSString *)responseFields;

/**
Retrieves the list of content locales the system supports. Content locales indicate the language used and the country where the language is used.
@param responseFields Use this field to include those fields which are not included by default.
*/

+ (MOZUClient *)clientForGetContentLocalesOperationWithResponseFields:(NSString *)responseFields;

/**
Retrieves the entire list of countries that the system supports.
@param responseFields Use this field to include those fields which are not included by default.
*/

+ (MOZUClient *)clientForGetCountriesOperationWithResponseFields:(NSString *)responseFields;

/**
Retrieves the entire list of countries that the system supports.
@param responseFields A list or array of fields returned for a call. These fields may be customized and may be used for various types of data calls in Mozu. For example, responseFields are returned for retrieving or updating attributes, carts, and messages in Mozu.
*/

+ (MOZUClient *)clientForGetCountriesWithStatesOperationWithResponseFields:(NSString *)responseFields;

/**
Retrieves the entire list of currencies that the system supports.
@param responseFields Use this field to include those fields which are not included by default.
*/

+ (MOZUClient *)clientForGetCurrenciesOperationWithResponseFields:(NSString *)responseFields;

/**
Retrieves the entire list of time zones that the system supports.
@param responseFields Use this field to include those fields which are not included by default.
*/

+ (MOZUClient *)clientForGetTimeZonesOperationWithResponseFields:(NSString *)responseFields;

/**
Retrieves the entire list of top-level internet domains that the system supports.
@param responseFields Use this field to include those fields which are not included by default.
*/

+ (MOZUClient *)clientForGetTopLevelDomainsOperationWithResponseFields:(NSString *)responseFields;

/**
Retrieves an array list of all units of measure the system supports.
@param filter A set of expressions that consist of a field, operator, and value and represent search parameter syntax when filtering results of a query. Valid operators include equals (eq), does not equal (ne), greater than (gt), less than (lt), greater than or equal to (ge), less than or equal to (le), starts with (sw), or contains (cont). For example - "filter=IsDisplayed+eq+true"
@param responseFields Use this field to include those fields which are not included by default.
*/

+ (MOZUClient *)clientForGetUnitsOfMeasureOperationWithFilter:(NSString *)filter responseFields:(NSString *)responseFields;


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