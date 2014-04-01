
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
#import "MOZUApplicationVersion.h"



@protocol MOZUAppDevApplication
@end


/**
	Properties of an application registered in Dev Center.
*/
@interface MOZUAppDevApplication : JSONModel<MOZUAppDevApplication>

/**
The type of application, which is "Capability" or "Extension."
*/
@property(nonatomic) NSString * applicationType;

/**
Unique identifier of the application. The application ID is required to generate an authentication ticket.
*/
@property(nonatomic) NSInteger id;

/**
The name of the application.
*/
@property(nonatomic) NSString * name;

/**
Identifier and datetime stamp information recorded when a user or application creates, updates, or deletes a resource entity. This value is system-supplied and read-only.
*/
@property(nonatomic) MOZUAuditInfo *auditInfo;

/**
Array list of the versions defined for an application.
*/
@property(nonatomic) NSArray<MOZUApplicationVersion> *versions;

@end

