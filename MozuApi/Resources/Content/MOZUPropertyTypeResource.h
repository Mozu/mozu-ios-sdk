
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

#import "MOZUPropertyTypeCollection.h"
#import "MOZUPropertyValueType.h"
#import "MOZUPropertyType.h"


@interface MOZUPropertyTypeResource : NSObject


@property(readonly, nonatomic) MOZUAPIContext *apiContext;

- (instancetype)initWithAPIContext:(MOZUAPIContext *)apiContext;


//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**

@param pageSize 
@param startIndex 
*/

- (void)propertyTypesWithDataViewMode:(MOZUDataViewMode)dataViewMode pageSize:(NSNumber *)pageSize startIndex:(NSNumber *)startIndex completionHandler:(void(^)(MOZUPropertyTypeCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**

@param propertyTypeName 
*/

- (void)propertyTypeWithDataViewMode:(MOZUDataViewMode)dataViewMode propertyTypeName:(NSString *)propertyTypeName completionHandler:(void(^)(MOZUPropertyType *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Retrieves the value types associated with a content property.
*/

- (void)propertyValueTypesWithDataViewMode:(MOZUDataViewMode)dataViewMode completionHandler:(void(^)(NSArray<MOZUPropertyValueType> *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
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