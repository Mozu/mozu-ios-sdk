
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
#import "MOZUApplicationCapability.h"
#import "MOZUApplicationCapabilityDomain.h"



@protocol MOZUApplicationCapabilityType
@end


/**
	Mozu.AppDev.Contracts.ApplicationCapabilityType ApiType DOCUMENT_HERE 
*/
@interface MOZUApplicationCapabilityType : JSONModel<MOZUApplicationCapabilityType>

/**
Mozu.AppDev.Contracts.ApplicationCapabilityType applicationCapabilityTypeId ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSInteger applicationCapabilityTypeId;

/**
Mozu.AppDev.Contracts.ApplicationCapabilityType applicationId ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSInteger applicationId;

/**
Mozu.AppDev.Contracts.ApplicationCapabilityType capabilityTypeId ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSInteger capabilityTypeId;

/**
Mozu.AppDev.Contracts.ApplicationCapabilityType capabilityTypeName ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSString * capabilityTypeName;

/**
Mozu.AppDev.Contracts.ApplicationCapabilityType isImplemented ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) BOOL isImplemented;

/**
Mozu.AppDev.Contracts.ApplicationCapabilityType isInitializedByDefault ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) BOOL isInitializedByDefault;

/**
Mozu.AppDev.Contracts.ApplicationCapabilityType packageId ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSInteger packageId;

/**
Mozu.AppDev.Contracts.ApplicationCapabilityType applicationCapabilities ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSArray<MOZUApplicationCapability> *applicationCapabilities;

/**
Mozu.AppDev.Contracts.ApplicationCapabilityType applicationCapabilityDomains ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSArray<MOZUApplicationCapabilityDomain> *applicationCapabilityDomains;

@end

