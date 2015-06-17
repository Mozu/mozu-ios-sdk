
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
#import "MOZUEventExtendedProperty.h"



@protocol MOZUEvent
@end


/**
	Properties of an event the system creates each time a create, read, update, or delete operation is performed.
*/
@interface MOZUEvent : JSONModel<MOZUEvent>

/**
The unique identifier of the catalog of products used by a site.
*/
@property(nonatomic) NSNumber * catalogId;

/**
The unique identifier of the API request associated with the event action, which might contain multiple actions.
*/
@property(nonatomic) NSString * correlationId;

/**
The unique identifier of the entity that caused the event. For example, if the event is "product.created", the entity ID value represents the product code of the product that was created.
*/
@property(nonatomic) NSString * entityId;

/**
Unique identifier of the source product property. For a product field it will be the name of the field. For a product attribute it will be the Attribute FQN. 
*/
@property(nonatomic) NSString * id;

/**
Indicates if the event is a test request or test entity. If true, the generated and captured event record was generated as a test request for an application.
*/
@property(nonatomic) NSNumber * isTest;

/**
The unique identifier of the master catalog associated with the entity.
*/
@property(nonatomic) NSNumber * masterCatalogId;

@property(nonatomic) NSNumber * siteId;

/**
Unique identifier of the Mozu tenant.
*/
@property(nonatomic) NSNumber * tenantId;

/**
The type of event that was performed, such as "product.created" or "category.deleted".
*/
@property(nonatomic) NSString * topic;

/**
Identifier and datetime stamp information recorded when a user or application creates, updates, or deletes a resource entity. This value is system-supplied and read-only.
*/
@property(nonatomic) MOZUAuditInfo *auditInfo;

/**
Extended properties. Note: This is purposefully not a CollectionBase type wrapper so consumers start to get used to not having counts returned.
*/
@property(nonatomic) NSArray<MOZUEventExtendedProperty> *extendedProperties;

@property(nonatomic) NSString * eventId;

@end

