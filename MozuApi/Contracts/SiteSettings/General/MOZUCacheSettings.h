
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



@protocol MOZUCacheSettings
@end


/**
	Mozu.SiteSettings.General.Contracts.CacheSettings ApiType DOCUMENT_HERE 
*/
@interface MOZUCacheSettings : JSONModel<MOZUCacheSettings>

/**
The a query string value that can be used to invalidate a client browser cache/ cdn cache.
*/
@property(nonatomic) NSString * cdnCacheBustKey;

@end

