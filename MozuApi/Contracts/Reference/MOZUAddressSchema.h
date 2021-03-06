
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
#import "MOZUField.h"



@protocol MOZUAddressSchema
@end


/**
	Describes the structure of postal addresses based on the country specified. Because addresses vary from country to country, this schema allows a flexible storage structure.
*/
@interface MOZUAddressSchema : JSONModel<MOZUAddressSchema>

/**
The 2-letter geographic code representing the country for the physical or mailing address. Currently limited to the US.
*/
@property(nonatomic) NSString * countryCode;

/**
The label associated with this country.
*/
@property(nonatomic) NSString * countryLabel;

/**
Unique identifier of the source product property. For a product field it will be the name of the field. For a product attribute it will be the Attribute FQN. 
*/
@property(nonatomic) NSInteger id;

/**
The list of fields to display for a view or an associated schema. For example, the address schema would display fields for postal addresses.
*/
@property(nonatomic) NSArray<MOZUField> *fields;

@end

