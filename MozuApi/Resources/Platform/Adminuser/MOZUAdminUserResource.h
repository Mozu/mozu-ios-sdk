
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

#import "MOZUTenantCollection.h"
#import "MOZUUser.h"


@interface MOZUAdminUserResource : NSObject



//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieves a list of the Mozu tenants or development stores for which the specified user has an assigned role.
@param responseFields Use this field to include those fields which are not included by default.
@param userId Unique identifier of the user whose tenant scopes you want to retrieve.
*/

- (void)tenantScopesForUserWithUserId:(NSString *)userId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUTenantCollection *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;
/**
Retrieves the details of the specified administrator user account.
@param responseFields Use this field to include those fields which are not included by default.
@param userId Unique identifier of the user whose tenant scopes you want to retrieve.
*/

- (void)userWithUserId:(NSString *)userId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUUser *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
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