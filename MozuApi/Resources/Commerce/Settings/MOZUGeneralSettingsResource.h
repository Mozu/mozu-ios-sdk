
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

#import "MOZUGeneralSettings.h"


@interface MOZUGeneralSettingsResource : NSObject


@property(readonly, nonatomic) MOZUAPIContext * apiContext;

-(id)initWithAPIContext:(MOZUAPIContext *)apiContext;

-(id)cloneWithAPIContextModification:(MOZUAPIContextModificationBlock)apiContextModification;

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

/**
Retrieve a site's general global settings.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)generalSettingsWithResponseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUGeneralSettings *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
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

/**
Updates a site's general global settings.
@param body General settings used on the storefront site.
@param responseFields Use this field to include those fields which are not included by default.
*/

- (void)updateGeneralSettingsWithBody:(MOZUGeneralSettings *)body responseFields:(NSString *)responseFields completionHandler:(void(^)(MOZUGeneralSettings *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler
;

//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//



@end