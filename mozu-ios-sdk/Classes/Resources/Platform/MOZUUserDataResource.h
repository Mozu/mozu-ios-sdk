
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



@interface MOZUUserDataResource : NSObject


@property(readonly, nonatomic) MOZUAPIContext * apiContext;

-(id)initWithAPIContext:(MOZUAPIContext *)apiContext;

-(id)cloneWithAPIContextModification:(MOZUAPIContextModificationBlock)apiContextModification;

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieves the value of a record in the Mozu database.
@param dbEntryQuery The database entry string to create.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)dBValueWithDbEntryQuery:(NSString *)dbEntryQuery responseFields:(NSString *)responseFields completionHandler:(void(^)(NSString *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

/**
Creates a new record in the Mozu database based on the information supplied in the request.
@param body The value string to create.
@param dbEntryQuery The database entry string to create.
*/

- (void)createDBValueWithBody:(NSString *)body dbEntryQuery:(NSString *)dbEntryQuery completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

/**
Updates a record in the Mozu database based on the information supplied in the request.
@param body The value string to create.
@param dbEntryQuery The database entry string to create.
*/

- (void)updateDBValueWithBody:(NSString *)body dbEntryQuery:(NSString *)dbEntryQuery completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Removes a previously defined record in the Mozu database.
@param dbEntryQuery The database entry string to create.
*/

- (void)deleteDBValueWithDbEntryQuery:(NSString *)dbEntryQuery completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
;


@end