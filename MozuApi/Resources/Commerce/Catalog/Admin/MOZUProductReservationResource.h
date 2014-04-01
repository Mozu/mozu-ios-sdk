
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

#import "MOZUAuthTicket.h"
#import "MOZUProductReservation.h"
#import "MOZUProductReservationCollection.h"


@interface MOZUProductReservationResource : NSObject


@property(readonly, nonatomic) MOZUAPIContext *apiContext;

- (instancetype)initWithAPIContext:(MOZUAPIContext *)apiContext;


//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieves a list of product reservations according to any specified filter criteria and sort options.
@param filter A set of expressions that consist of a field, operator, and value and represent search parameter syntax when filtering results of a query. Valid operators include equals (eq), does not equal (ne), greater than (gt), less than (lt), greater than or equal to (ge), less than or equal to (le), starts with (sw), or contains (cont). For example - "filter=IsDisplayed+eq+true"
@param pageSize The number of results to display on each page when creating paged results from a query. The maximum value is 200.
@param sortBy 
@param startIndex 
*/

- (void)productReservationsWithDataViewMode:(MOZUDataViewMode)dataViewMode startIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter userClaims:(MOZUUserAuthTicket *)userClaims completionHandler:(void(^)(MOZUProductReservationCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Retrieves the details of a product reservation.
@param productReservationId Unique identifier of the product reservation.
*/

- (void)productReservationWithDataViewMode:(MOZUDataViewMode)dataViewMode productReservationId:(NSInteger)productReservationId userClaims:(MOZUUserAuthTicket *)userClaims completionHandler:(void(^)(MOZUProductReservation *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

/**

@param body 
@param skipInventoryCheck 
*/

- (void)addProductReservationsWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(NSArray<MOZUProductReservation> *)body skipInventoryCheck:(NSNumber *)skipInventoryCheck userClaims:(MOZUUserAuthTicket *)userClaims completionHandler:(void(^)(NSArray<MOZUProductReservation> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**

@param body 
*/

- (void)commitReservationsWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(NSArray<MOZUProductReservation> *)body userClaims:(MOZUUserAuthTicket *)userClaims completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

/**

@param body 
@param skipInventoryCheck 
*/

- (void)updateProductReservationsWithDataViewMode:(MOZUDataViewMode)dataViewMode body:(NSArray<MOZUProductReservation> *)body skipInventoryCheck:(NSNumber *)skipInventoryCheck userClaims:(MOZUUserAuthTicket *)userClaims completionHandler:(void(^)(NSArray<MOZUProductReservation> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Deletes a product reservation. For example, delete a reservation when an order is not processed to return the product quantity back to inventory.
@param productReservationId Unique identifier of the reservation.
*/

- (void)deleteProductReservationWithDataViewMode:(MOZUDataViewMode)dataViewMode productReservationId:(NSInteger)productReservationId userClaims:(MOZUUserAuthTicket *)userClaims completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
;


@end