
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



@protocol MOZUCoupon
@end


/**
	Mozu.ProductAdmin.Contracts.Coupon ApiType DOCUMENT_HERE 
*/
@interface MOZUCoupon : JSONModel<MOZUCoupon>

/**
Mozu.ProductAdmin.Contracts.Coupon canBeDeleted ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) BOOL canBeDeleted;

/**
Code of a discount coupon. This code can be used by a shopper when a coupon code is required to earn the associated discount on a purchase.
*/
@property(nonatomic) NSString * couponCode;

/**
Link to associated coupon
*/
@property(nonatomic) NSString * couponSetCode;

/**
ReadOnly system id for releated couponset.
*/
@property(nonatomic) NSInteger couponSetId;

/**
Total number of times this code has been redeemed. ReadOnly, calculated. Only returned with response group includeCounts
*/
@property(nonatomic) NSNumber * redemptionCount;

/**
Basic audit info about the object, including date, time, and user account. Identifier and datetime stamp information recorded when a user or application creates, updates, or deletes a resource entity. This value is system-supplied and read-only.
*/
@property(nonatomic) MOZUAuditInfo *auditInfo;

@end

