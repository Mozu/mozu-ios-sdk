
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



@protocol MOZUSearchTuningRuleFilter
@end


/**
	Mozu.ProductAdmin.Contracts.Search.SearchTuningRuleFilter ApiType DOCUMENT_HERE 
*/
@interface MOZUSearchTuningRuleFilter : JSONModel<MOZUSearchTuningRuleFilter>

/**
Mozu.ProductAdmin.Contracts.Search.SearchTuningRuleFilter field ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSString * field;

/**
The value of a property, used by numerous objects within Mozu including facets, attributes, products, localized content, metadata, capabilities (Mozu and third-party), location inventory adjustment, and more. The value may be a string, integer, or double. Validation may be run against the entered and saved values depending on the object type.
*/
@property(nonatomic) NSString * value;

@end

