
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
#import "MOZUTenant.h"


@interface MOZUTenantResource : NSObject


//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieve details about a specific tenant by providing the tenant ID.
@param tenantId Unique identifier of the Mozu tenant.
*/

-(void)tenantWithTenantId:(NSInteger)tenantId userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUTenant* result, MOZUApiError* error, NSHTTPURLResponse* response))handler
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