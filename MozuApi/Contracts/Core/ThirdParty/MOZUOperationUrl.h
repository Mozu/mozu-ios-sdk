
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



@protocol MOZUOperationUrl
@end


/**
	Properties of a URL endpoint associated with a capability operation.
*/
@interface MOZUOperationUrl : JSONModel<MOZUOperationUrl>

/**
The name of the URL endpoint.
*/
@property(nonatomic) NSString * name;

/**
The URL endpoint address.
*/
@property(nonatomic) NSString * url;

@end

