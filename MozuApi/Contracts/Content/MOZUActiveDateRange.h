
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



@protocol MOZUActiveDateRange
@end


/**
	Mozu.Content.Contracts.ActiveDateRange ApiType DOCUMENT_HERE 
*/
@interface MOZUActiveDateRange : JSONModel<MOZUActiveDateRange>

/**
The end of the active date range for this document
*/
@property(nonatomic) NSDate * endDate;

/**
The beginning of the active date range of this document
*/
@property(nonatomic) NSDate * startDate;

@end

