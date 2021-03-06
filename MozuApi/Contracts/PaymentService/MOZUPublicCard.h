
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



@protocol MOZUPublicCard
@end


/**
	Mozu.PaymentService.Contracts.PublicCard ApiType DOCUMENT_HERE 
*/
@interface MOZUPublicCard : JSONModel<MOZUPublicCard>

/**
Mozu.PaymentService.Contracts.PublicCard cardHolderName ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSString * cardHolderName;

/**
Mozu.PaymentService.Contracts.PublicCard cardIssueMonth ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSInteger cardIssueMonth;

/**
For Amex Cards, this is an additional field for verification that is used in conjunction with a CVV
*/
@property(nonatomic) NSString * cardIssueNumber;

/**
Mozu.PaymentService.Contracts.PublicCard cardIssueYear ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSInteger cardIssueYear;

/**
This is the full number of the card.
*/
@property(nonatomic) NSString * cardNumber;

/**
Mozu.PaymentService.Contracts.PublicCard cardType ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSString * cardType;

/**
Mozu.PaymentService.Contracts.PublicCard cvv ApiTypeMember DOCUMENT_HERE 
*/
@property(nonatomic) NSString * cvv;

/**
The two-digit month a credit card expires for a payment method.
*/
@property(nonatomic) NSInteger expireMonth;

/**
The four-digit year the credit card expires for a payment method.
*/
@property(nonatomic) NSInteger expireYear;

@end

