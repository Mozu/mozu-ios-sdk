
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
#import "MOZUAuthTicket.h"
#import "MOZUCommercePackage.h"


@interface MOZUCommerceReturnsPackageClient : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieves the details of a package of return replacement items.
@param packageId Unique identifier of the return replacement package to retrieve.
@param returnId Unique identifier of the return associated with the replacement package to retrieve.
*/

+(MOZUClient*)clientForGetPackageOperationWithReturnId:(NSString*)returnId packageId:(NSString*)packageId userClaims:(MOZUUserAuthTicket*)userClaims;

/**
Retrieves the package label image supplied by the carrier for a return replacement.
@param packageId Unique identifier of the return replacement package for which to retrieve the label.
@param returnId Unique identifier of the return associated with the replacement package label to retrieve.
*/

+(MOZUClient*)clientForGetPackageLabelOperationWithReturnId:(NSString*)returnId packageId:(NSString*)packageId userClaims:(MOZUUserAuthTicket*)userClaims;


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

/**
Creates a new physical package of return replacement items.
@param package Properties of the physical package for a return replacement.
@param returnId Unique identifier of the return for which to create a replacement package.
*/

+(MOZUClient*)clientForCreatePackageOperationWithPackage:(MOZUCommercePackage*)package returnId:(NSString*)returnId userClaims:(MOZUUserAuthTicket*)userClaims;


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

/**
Updates one or more properties of a package associated with a return replacement.
@param package Properties of the return replacement package to update.
@param packageId Unique identifier of the return replacement package to update.
@param returnId Unique identifier of the return associated with the replacement package to update.
*/

+(MOZUClient*)clientForUpdatePackageOperationWithPackage:(MOZUCommercePackage*)package returnId:(NSString*)returnId packageId:(NSString*)packageId userClaims:(MOZUUserAuthTicket*)userClaims;


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Deletes a package associated with a return replacement.
@param packageId Unique identifier of the return replacement package to delete.
@param returnId Unique identifier of the return associated with the replacement package to delete.
*/

+(MOZUClient*)clientForDeletePackageOperationWithReturnId:(NSString*)returnId packageId:(NSString*)packageId userClaims:(MOZUUserAuthTicket*)userClaims;



@end