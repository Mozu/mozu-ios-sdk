
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



@protocol MOZUSubscribingSite
@end


@interface MOZUSubscribingSite : JSONModel<MOZUSubscribingSite>

@property(nonatomic) NSNumber * isActive;

@property(nonatomic) NSNumber * siteId;

@property(nonatomic) MOZUAuditInfo *auditInfo;

@end

