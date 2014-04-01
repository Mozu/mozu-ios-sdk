
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
#import "MOZUProductAttribute.h"
#import "MOZUPricingProductPropertyValue.h"



@protocol MOZUPricingProductProperty
@end


/**
	Details of a property defined for a product.
*/
@interface MOZUPricingProductProperty : JSONModel<MOZUPricingProductProperty>

/**
The fully qualified name of the attribute, which is a user defined attribute identifier.
*/
@property(nonatomic) NSString * attributeFQN;

/**
If true, this product property does not appear on the storefront.
*/
@property(nonatomic) NSNumber * isHidden;

/**
If true, the product property has multiple values.
*/
@property(nonatomic) NSNumber * isMultiValue;

/**
Details of a product attribute.
*/
@property(nonatomic) MOZUProductAttribute *attributeDetail;

/**
List of values predefined for the product property attribute.
*/
@property(nonatomic) NSArray<MOZUPricingProductPropertyValue> *values;

@end

