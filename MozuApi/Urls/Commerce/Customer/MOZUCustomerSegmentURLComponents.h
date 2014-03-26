/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUURLComponents.h"

@interface MOZUCustomerSegmentURLComponents : NSObject

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Resource Url Components for getSegments
@param startIndex 
@param pageSize 
@param sortBy 
@param filter 
*/
+ (MOZUURLComponents *)URLComponentsForGetSegmentsOperationWithStartIndex:(NSNumber *)startIndex pageSize:(NSNumber *)pageSize sortBy:(NSString *)sortBy filter:(NSString *)filter;

/**
Resource Url Components for getSegment
@param identifier 
*/
+ (MOZUURLComponents *)URLComponentsForGetSegmentOperationWithIdentifier:(NSInteger)identifier;


//
#pragma mark -
#pragma mark POST Operations
#pragma mark -
//

/**
Resource Url Components for addSegment
*/
+ (MOZUURLComponents *)URLComponentsForAddSegmentOperation;

/**
Resource Url Components for addSegmentAccounts
@param accountIds 
@param identifier 
*/
+ (MOZUURLComponents *)URLComponentsForAddSegmentAccountsOperationWithAccountIds:(NSInteger)accountIds identifier:(NSInteger)identifier;


//
#pragma mark -
#pragma mark PUT Operations
#pragma mark -
//

/**
Resource Url Components for updateSegment
@param identifier 
*/
+ (MOZUURLComponents *)URLComponentsForUpdateSegmentOperationWithIdentifier:(NSInteger)identifier;


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Resource Url Components for deleteSegment
@param identifier 
*/
+ (MOZUURLComponents *)URLComponentsForDeleteSegmentOperationWithIdentifier:(NSInteger)identifier;

/**
Resource Url Components for deleteSegmentAccounts
@param accountIds 
@param identifier 
*/
+ (MOZUURLComponents *)URLComponentsForDeleteSegmentAccountsOperationWithAccountIds:(NSInteger)accountIds identifier:(NSInteger)identifier;



@end