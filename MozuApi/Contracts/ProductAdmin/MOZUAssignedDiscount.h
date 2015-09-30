
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



@protocol MOZUAssignedDiscount
@end


/**
	Mozu.ProductAdmin.Contracts.AssignedDiscount ApiType DOCUMENT_HERE 
*/
@interface MOZUAssignedDiscount : JSONModel<MOZUAssignedDiscount>

/**
ReadOnly, CouponSetCode copied from URI
*/
@property(nonatomic) NSString * couponSetCode;

/**
ReadOnly, CouponSetId
*/
@property(nonatomic) NSInteger couponSetId;

/**
Unique identifier for the discount in the storefront.
*/
@property(nonatomic) NSInteger discountId;

/**
Basic audit info about the object, including date, time, and user account. Identifier and datetime stamp information recorded when a user or application creates, updates, or deletes a resource entity. This value is system-supplied and read-only.
*/
@property(nonatomic) MOZUAuditInfo *auditInfo;

@end

