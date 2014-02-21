
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
#import "MOZUDocumentType.h"
#import "MOZUDocumentTypeCollection.h"


@interface MOZUDocumentTypeResource : NSObject


@property(readonly, nonatomic) MOZUAPIContext * apiContext;

-(id)initWithAPIContext:(MOZUAPIContext *)apiContext;


//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**

@param pageSize 
@param startIndex 
*/

-(void)documentTypesWithDataViewMode:(MOZUDataViewMode)dataViewMode pageSize:(NSNumber*)pageSize startIndex:(NSNumber*)startIndex userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUDocumentTypeCollection* result, MOZUApiError* error, NSHTTPURLResponse* response))handler
;
/**

@param documentTypeName 
*/

-(void)documentTypeWithDataViewMode:(MOZUDataViewMode)dataViewMode documentTypeName:(NSString*)documentTypeName userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUDocumentType* result, MOZUApiError* error, NSHTTPURLResponse* response))handler
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