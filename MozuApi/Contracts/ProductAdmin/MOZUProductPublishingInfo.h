
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import <Foundation/Foundation.h>
#import "JSONModel.h"



@protocol MOZUProductPublishingInfo
@end


/**
	Properties of the publishing status of the product, including its current state and the details of the last product change published to the catalog.
*/
@interface MOZUProductPublishingInfo : JSONModel<MOZUProductPublishingInfo>

/**
The user ID of the user who last published changes for this product in the catalog.
*/
@property(nonatomic) NSString * lastPublishedBy;

/**
The date and time a draft change for this product was published to the catalog.
*/
@property(nonatomic) NSDate * lastPublishedDate;

/**
The current publishing state of this product in the catalog, which is Live, New, or Draft. Live products appear on the storefront and have no pending changes. New products have been created but do not yet appear on the storefront. Draft products appear on the storefront but have pending changes that have not yet been published.
*/
@property(nonatomic) NSString * publishedState;

@end

