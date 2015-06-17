
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



@protocol MOZURuntimeProductPricingBehaviorInfo
@end


/**
	Properties that describe the behavior the system uses when determining the price of the product.
*/
@interface MOZURuntimeProductPricingBehaviorInfo : JSONModel<MOZURuntimeProductPricingBehaviorInfo>

/**
Indicates if the discount is restricted. If true, the system cannot apply any discounts to this product. Discount restrictions are defined at the master catalog level. Client administrators cannot override discount restrictions at the catalog level, but they can limit the restriction to a defined time interval.
*/
@property(nonatomic) NSNumber * discountsRestricted;

/**
The date and time on which the discount restriction period ends.
*/
@property(nonatomic) NSDate * discountsRestrictedEndDate;

/**
The date and time on which the discount restriction period starts.
*/
@property(nonatomic) NSDate * discountsRestrictedStartDate;

@end

