
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



@protocol MOZUAddOrDeletePublishItem
@end


/**
	Mozu.Content.Contracts.AddOrDeletePublishItem ApiType DOCUMENT_HERE 
*/
@interface MOZUAddOrDeletePublishItem : JSONModel<MOZUAddOrDeletePublishItem>

/**
Mozu.Content.Contracts.AddOrDeletePublishItem docListFQN ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSString * docListFQN;

/**
Mozu.Content.Contracts.AddOrDeletePublishItem documentId ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSString * documentId;

/**
The ID of the specific scope for the object. 
*/
@property(nonatomic) NSInteger scopeId;

/**
The scope at which the object exists, such as "Tenant", "MasterCatalog", or "Site". Scope delineates the level and area of Mozu the object exists within or affects.
*/
@property(nonatomic) NSString * scopeType;

@end
