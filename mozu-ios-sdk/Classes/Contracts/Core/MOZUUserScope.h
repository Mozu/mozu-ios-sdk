
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



@protocol MOZUUserScope
@end


/**
	Properties of the scope in which a user operates, which represents a developer account or Mozu production tenant.
*/
@interface MOZUUserScope : JSONModel<MOZUUserScope>

/**
Unique identifier of the source product property. For a product field it will be the name of the field. For a product attribute it will be the Attribute FQN. 
*/
@property(nonatomic) NSNumber * id;

/**
The display name of the source product property. For a product field it will be the display name of the field. For a product attribute it will be the Attribute Name.
*/
@property(nonatomic) NSString * name;

/**
The type of scope, which is a developer account or production tenant.
*/
@property(nonatomic) NSString * type;

@end
