
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


@interface MOZUSiteDataClient : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieves the value of a record in the Mozu database.
@param dbEntryQuery The database entry query string used to retrieve the record information.
*/

+(MOZUClient*)clientForGetDBValueOperationWithWithDbEntryQuery:(NSString*)dbEntryQuery;


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

/**
Creates a new record in the Mozu database based on the information supplied in the request.
@param value The value string to create.
@param dbEntryQuery The database entry string to create.
*/

+(MOZUClient*)clientForCreateDBValueOperationWithWithValue:(NSString*)value dbEntryQuery:(NSString*)dbEntryQuery;


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

/**
Updates a record in the Mozu database based on the information supplied in the request.
@param value The database value to update.
@param dbEntryQuery The database entry query string used to update the record information.
*/

+(MOZUClient*)clientForUpdateDBValueOperationWithWithValue:(NSString*)value dbEntryQuery:(NSString*)dbEntryQuery;


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Removes a previously defined record in the Mozu database.
@param dbEntryQuery The database entry string to delete.
*/

+(MOZUClient*)clientForDeleteDBValueOperationWithWithDbEntryQuery:(NSString*)dbEntryQuery;



@end