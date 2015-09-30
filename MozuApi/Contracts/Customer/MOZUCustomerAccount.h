
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
#import "MOZUCustomerAttribute.h"
#import "MOZUAuditInfo.h"
#import "MOZUCommerceSummary.h"
#import "MOZUCustomerContact.h"
#import "MOZUCurrencyAmount.h"
#import "MOZUCustomerNote.h"
#import "MOZUCustomerSegment.h"



@protocol MOZUCustomerAccount
@end


/**
	Properties of the customer account.
*/
@interface MOZUCustomerAccount : JSONModel<MOZUCustomerAccount>

/**
Indicates if the customer account is opted to receive marketing materials. If true, the customer account is opted in for receiving the content. 
*/
@property(nonatomic) BOOL acceptsMarketing;

/**
The legal or doing business as (DBA) or tradestyle name of the business or organization. The maximum character length is 200.
*/
@property(nonatomic) NSString * companyOrOrganization;

/**
Mozu.Customer.Contracts.CustomerAccount customerSinceDate ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSDate * customerSinceDate;

/**
The email address for the customer account and contact. This email may be used for login to the storefront and for subscription mailing lists.
*/
@property(nonatomic) NSString * emailAddress;

/**
Unique identifier used by an external program to identify a Mozu order, customer account, or wish list.
*/
@property(nonatomic) NSString * externalId;

/**
The full first name of a customer or contact name.
*/
@property(nonatomic) NSString * firstName;

/**
Indicates if an external password is set on this account
*/
@property(nonatomic) BOOL hasExternalPassword;

/**
Unique identifier of the source product property. For a product field it will be the name of the field. For a product attribute it will be the Attribute FQN. 
*/
@property(nonatomic) NSInteger id;

/**
Indicates if the object or feature is active. This indicator is used for subscriptions (at the site or tenant level), customer accounts, products and variations.
*/
@property(nonatomic) BOOL isActive;

/**
If true, this customer account represents an anonymous shopper.
*/
@property(nonatomic) BOOL isAnonymous;

/**
Indicates if a customer account and associated data is locked. If true, the user account is locked due to multiple failed authentication attempts. The user cannot login until the account is unlocked.
*/
@property(nonatomic) BOOL isLocked;

/**
The full last name of a customer or contact name.
*/
@property(nonatomic) NSString * lastName;

/**
Mozu.Customer.Contracts.CustomerAccount lifeTimeValueSetDate ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSDate * lifeTimeValueSetDate;

/**
Language used for the entity. Currently, only "en-US" is supported.
*/
@property(nonatomic) NSString * localeCode;

/**
If true, this customer account has tax exempt status.
*/
@property(nonatomic) BOOL taxExempt;

/**
The tax identification number associated with the customer account.
*/
@property(nonatomic) NSString * taxId;

/**
Unique identifier of the customer account (shopper or system user). System-supplied and read-only. If the shopper user is anonymous, the user ID represents a system-generated user ID string.
*/
@property(nonatomic) NSString * userId;

/**
The user name associated with the user profile. The customer uses the user name to access the account.
*/
@property(nonatomic) NSString * userName;

/**
Collection of attributes that may be paged list or a list, depending on the usage per object and API type. 
*/
@property(nonatomic) NSArray<MOZUCustomerAttribute> *attributes;

/**
Identifier and datetime stamp information recorded when a user or application creates, updates, or deletes a resource entity. This value is system-supplied and read-only.
*/
@property(nonatomic) MOZUAuditInfo *auditInfo;

/**
Properties of the commerce summary associated with a customer account, which includes details about the shopper's most recent order, wish lists, and total order value over time.
*/
@property(nonatomic) MOZUCommerceSummary *commerceSummary;

/**
Contact information, including the contact's name, address, phone numbers, email addresses, and company (if supplied). Also indicates whether this is a billing, shipping, or billing and shipping contact.
*/
@property(nonatomic) NSArray<MOZUCustomerContact> *contacts;

/**
Mozu.Customer.Contracts.CustomerAccount lifetimeValue ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) MOZUCurrencyAmount *lifetimeValue;

/**
Paged list collection of note content for objects including customers, orders, and returns. 
*/
@property(nonatomic) NSArray<MOZUCustomerNote> *notes;

/**
List of customer segments associated with the customer account. Customer accounts can be members of any number of segments.
*/
@property(nonatomic) NSArray<MOZUCustomerSegment> *segments;

@end

