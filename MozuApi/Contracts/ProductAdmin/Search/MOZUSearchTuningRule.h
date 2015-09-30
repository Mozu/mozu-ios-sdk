
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
#import "MOZUAuditInfo.h"
#import "MOZUSearchTuningRuleFilter.h"



@protocol MOZUSearchTuningRule
@end


/**
	Mozu.ProductAdmin.Contracts.Search.SearchTuningRule ApiType DOCUMENT_HERE 
*/
@interface MOZUSearchTuningRule : JSONModel<MOZUSearchTuningRule>

/**
Mozu.ProductAdmin.Contracts.Search.SearchTuningRule active ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) BOOL active;

/**
Mozu.ProductAdmin.Contracts.Search.SearchTuningRule activeEndDate ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSDate * activeEndDate;

/**
Mozu.ProductAdmin.Contracts.Search.SearchTuningRule activeStartDate ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSDate * activeStartDate;

/**
Mozu.ProductAdmin.Contracts.Search.SearchTuningRule blockedProductCodes ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSArray *blockedProductCodes;

/**
Mozu.ProductAdmin.Contracts.Search.SearchTuningRule boostedProductCodes ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSArray *boostedProductCodes;

/**
Indicates if the object is default. This indicator is used for product variations and site search settings. If true, the value/object is the default option. 
*/
@property(nonatomic) BOOL isDefault;

/**
Mozu.ProductAdmin.Contracts.Search.SearchTuningRule keywords ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSArray *keywords;

/**
Mozu.ProductAdmin.Contracts.Search.SearchTuningRule searchTuningRuleCode ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSString * searchTuningRuleCode;

/**
Mozu.ProductAdmin.Contracts.Search.SearchTuningRule searchTuningRuleName ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSString * searchTuningRuleName;

/**
Basic audit info about the object, including date, time, and user account. Identifier and datetime stamp information recorded when a user or application creates, updates, or deletes a resource entity. This value is system-supplied and read-only.
*/
@property(nonatomic) MOZUAuditInfo *auditInfo;

/**
Mozu.ProductAdmin.Contracts.Search.SearchTuningRule filters ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSArray<MOZUSearchTuningRuleFilter> *filters;

@end

