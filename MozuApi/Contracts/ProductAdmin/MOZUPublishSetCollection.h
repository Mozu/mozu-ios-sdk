
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
#import "MOZUPublishSet.h"



@protocol MOZUPublishSetCollection
@end


/**
	Mozu.ProductAdmin.Contracts.PublishSetCollection ApiType DOCUMENT_HERE 
*/
@interface MOZUPublishSetCollection : JSONModel<MOZUPublishSetCollection>

/**
Total number of objects in am item collection. Total counts are calculated for numerous objects in Mozu, including location inventory, products, options, product types, product reservations, categories, addresses, carriers, tax rates, time zones, and much more.
*/
@property(nonatomic) NSInteger totalCount;

/**
Collection list of items. All returned data is provided in an items array. For a failed request, the returned response may be success with an empty item collection. Items are used throughout APIs for carts, wish lists, documents, payments, returns, properties, and more.
*/
@property(nonatomic) NSArray<MOZUPublishSet> *items;

@end

