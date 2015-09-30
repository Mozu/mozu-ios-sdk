
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



@protocol MOZUCouponSet
@end


/**
	Mozu.ProductAdmin.Contracts.CouponSet ApiType DOCUMENT_HERE 
*/
@interface MOZUCouponSet : JSONModel<MOZUCouponSet>

/**
ReadOnly sum of all redemptions for this coupon. Use "counts" response group.
*/
@property(nonatomic) NSNumber * assignedDiscountCount;

/**
Signifies that the coupon has not been exported and can be updated ReadOnly
*/
@property(nonatomic) BOOL canBeDeleted;

/**
Count of associated couponCodes. Must use "counts" response group to get this value ReadOnly
*/
@property(nonatomic) NSNumber * couponCodeCount;

/**
Determines if the coupon is a persisted list of codes (static) or a list based on generated specification (dynamic).
*/
@property(nonatomic) NSString * couponCodeType;

/**
Unique tenant supplied identifier. Used as the prefix for generated sets. Required System generated if left null.
*/
@property(nonatomic) NSString * couponSetCode;

/**
Date and time that the coupon codes becomes expired
*/
@property(nonatomic) NSDate * endDate;

/**
Unique identifier of the source product property. For a product field it will be the name of the field. For a product attribute it will be the Attribute FQN. 
*/
@property(nonatomic) NSNumber * id;

/**
Maximum number of times any code can de used. Must be null, &gt;=1 or -1. Defaults to 1 on creation if null. -1 indicates unlimited.
*/
@property(nonatomic) NSNumber * maxRedemptionsPerCouponCode;

/**
Maximum number of times any single user can redeem any code. Must be null, &gt;=1 or -1. Defaults to 1 on creation if null. -1 indicates unlimited.
*/
@property(nonatomic) NSNumber * maxRedemptionsPerUser;

/**
The display name of the source product property. For a product field it will be the display name of the field. For a product attribute it will be the Attribute Name.
*/
@property(nonatomic) NSString * name;

/**
ReadOnly count of all redemptions for this coupon set.
*/
@property(nonatomic) NSNumber * redemptionCount;

/**
Sets the number of codes to generate for dynamic coupons Required when CouponCodeType is "Dynamic"
*/
@property(nonatomic) NSNumber * setSize;

/**
Date and time that the coupon codes becomes active
*/
@property(nonatomic) NSDate * startDate;

/**
The current status of an object. This status is specific to the object including payment (New, Authorized, Captured, Declined, Failed, Voided, Credited, CheckRequested, or RolledBack), discount (Active, Scheduled, or Expired), returns (ReturnAuthorized), tenant, package (Fulfilled or NotFulfilled), application, master and product catalogs, orders (Pending, Submitted, Processing, Pending Review, Closed, or Canceled), and order validation results (Pass, Fail, Error, or Review).
*/
@property(nonatomic) NSString * status;

/**
Basic audit info about the object, including date, time, and user account. Identifier and datetime stamp information recorded when a user or application creates, updates, or deletes a resource entity. This value is system-supplied and read-only.
*/
@property(nonatomic) MOZUAuditInfo *auditInfo;

@end

