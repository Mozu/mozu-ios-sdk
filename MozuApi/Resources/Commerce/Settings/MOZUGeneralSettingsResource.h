
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
#import "MOZUGeneralSettings.h"


@interface MOZUGeneralSettingsResource : NSObject
@property(readonly, nonatomic) MOZUAPIContext * apiContext;

-(id)initWithAPIContext:(MOZUAPIContext *)apiContext;

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieve a site's general global settings.
*/

-(void)generalSettings userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUGeneralSettings* result, MOZUApiError* error, NSHTTPURLResponse* response))handler;


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

/**
Updates a site's general global settings.
@param generalSettings The properties of the site's general settings to update.
*/

-(void)updateGeneralSettingsWithWithGeneralSettings:(MOZUGeneralSettings*)generalSettings userClaims:(MOZUUserAuthTicket*)userClaims completionHandler:(void(^)(MOZUGeneralSettings* result, MOZUApiError* error, NSHTTPURLResponse* response))handler;


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//



@end