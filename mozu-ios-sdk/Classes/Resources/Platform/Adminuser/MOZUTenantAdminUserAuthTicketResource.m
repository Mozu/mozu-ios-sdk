
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUTenantAdminUserAuthTicketClient.h"
#import "MOZUTenantAdminUserAuthTicketResource.h"



@implementation MOZUTenantAdminUserAuthTicketResource


//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

/**
Creates an authentication ticket for the supplied user to specify in API requests associated with the supplied tenant.
@param body Information required to authenticate a user.
@param responseFields Use this field to include those fields which are not included by default.
@param tenantId Unique identifier of the development or production tenant for which to generate the user authentication ticket.
*/

- (void)createUserAuthTicketWithBody:(MOZUUserAuthInfo *)body tenantId:(NSNumber *)tenantId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUTenantAdminUserAuthTicket *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUTenantAdminUserAuthTicketClient clientForCreateUserAuthTicketOperationWithBody:body tenantId:tenantId responseFields:responseFields];
     client.context = self.apiContext;
	[client executeAppAuthWithCompletion:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

/**
Generates a new user authentication ticket for the specified tenant by supplying the user's existing refresh token information.
@param body Properties of the authentication ticket to be used in user claims with the Mozu API.
@param responseFields Use this field to include those fields which are not included by default.
@param tenantId 
*/

- (void)refreshAuthTicketWithBody:(MOZUTenantAdminUserAuthTicket *)body tenantId:(NSNumber *)tenantId responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUTenantAdminUserAuthTicket *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUTenantAdminUserAuthTicketClient clientForRefreshAuthTicketOperationWithBody:body tenantId:tenantId responseFields:responseFields];
     client.context = self.apiContext;
	[client executeAppAuthWithCompletion:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(result, error, response);
		}
	}];
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

/**
Deletes the authentication ticket for the user by supplying the refresh token.
@param refreshToken Alphanumeric string used for access tokens. This token refreshes access for accounts by generating a new developer or application account authentication ticket after an access token expires.
*/

- (void)deleteUserAuthTicketWithRefreshToken:(NSString *)refreshToken completionHandler:(void(^)(MOZUAPIError *error, NSHTTPURLResponse *response))handler
 {
	MOZUClient *client = [MOZUTenantAdminUserAuthTicketClient clientForDeleteUserAuthTicketOperationWithRefreshToken:refreshToken];
	[client executeAppAuthWithCompletion:^(id result, NSHTTPURLResponse *response, MOZUAPIError *error) {
		if (handler != nil) {
			handler(error, response);
		}
	}];
}



@end