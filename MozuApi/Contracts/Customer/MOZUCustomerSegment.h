
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



@protocol MOZUCustomerSegment
@end


@interface MOZUCustomerSegment : JSONModel<MOZUCustomerSegment>

@property(nonatomic) NSString * code;

@property(nonatomic) NSString * description;

@property(nonatomic) NSInteger id;

@property(nonatomic) NSString * name;

@property(nonatomic) MOZUAuditInfo *auditInfo;

@end
