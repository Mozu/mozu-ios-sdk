
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



@protocol MOZUAttribute
@end


/**
	Properties of an attribute used to describe customers or orders.
*/
@interface MOZUAttribute : JSONModel<MOZUAttribute>

/**
The administrator name associated with the object/data.
*/
@property(nonatomic) NSString * adminName;

/**
Mozu.AppDev.Contracts.Attribute applicationAttributeId ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSInteger applicationAttributeId;

/**
Mozu.AppDev.Contracts.Attribute attributeId ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSInteger attributeId;

/**
Mozu.AppDev.Contracts.Attribute code ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSString * code;

/**
Mozu.AppDev.Contracts.Attribute fqn ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSString * fqn;

/**
The type of input selection used to define a value for the attribute, including Yes/No, Date, DateTime, List, TextBox, or TextArea.
*/
@property(nonatomic) NSString * inputType;

/**
The display name of the source product property. For a product field it will be the display name of the field. For a product attribute it will be the Attribute Name.
*/
@property(nonatomic) NSString * name;

/**
The numeric order of objects, used by a vocabulary value defined for an extensible attribute, images, and categories.
*/
@property(nonatomic) NSInteger sequence;

/**
Mozu.AppDev.Contracts.Attribute type ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSString * type;

/**
Mozu.AppDev.Contracts.Attribute vocabularyJson ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSString * vocabularyJson;

/**
List of valid vocabulary values defined for an attribute.
*/
@property(nonatomic) NSString * vocabularyValues;

@end

