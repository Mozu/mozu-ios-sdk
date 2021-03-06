
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



@protocol MOZUPasswordInfo
@end


/**
	The information required to modify a shopper account password.
*/
@interface MOZUPasswordInfo : JSONModel<MOZUPasswordInfo>

/**
The External Password, typically used for imports in conjunction with a custom action
*/
@property(nonatomic) NSString * externalPassword;

/**
The new password entered and saved by the user of the account. 
*/
@property(nonatomic) NSString * theNewPassword;

/**
The previous shopper account password value.
*/
@property(nonatomic) NSString * oldPassword;

@end

