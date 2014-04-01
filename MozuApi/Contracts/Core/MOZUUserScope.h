
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
Identifier of the scope, which represents a developer account ID or tenant ID.
*/
@property(nonatomic) NSNumber * id;

/**
The name of the developer account or tenant.
*/
@property(nonatomic) NSString * name;

/**
The type of scope, which is a developer account or production tenant.
*/
@property(nonatomic) NSString * type;

@end

