
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
#import "MOZUAppDevPackage.h"



@protocol MOZUPackageCollection
@end


/**
	Mozu.AppDev.Contracts.PackageCollection ApiType DOCUMENT_HERE 
*/
@interface MOZUPackageCollection : JSONModel<MOZUPackageCollection>

/**
The total number of pages of the results divided per the `pageSize`.
*/
@property(nonatomic) NSInteger pageCount;

/**
The number of results to display on each page when creating paged results from a query. The amount is divided and displayed on the `pageCount `amount of pages. The default is 20 and maximum value is 200 per page.
*/
@property(nonatomic) NSInteger pageSize;

/**
When creating paged results from a query, this value indicates the zero-based offset in the complete result set where the returned entities begin. For example, with a `pageSize `of 25, to get the 51st through the 75th items, use `startIndex=3`.
*/
@property(nonatomic) NSInteger startIndex;

/**
Total number of objects in am item collection. Total counts are calculated for numerous objects in Mozu, including location inventory, products, options, product types, product reservations, categories, addresses, carriers, tax rates, time zones, and much more.
*/
@property(nonatomic) NSInteger totalCount;

/**
Collection list of items. All returned data is provided in an items array. For a failed request, the returned response may be success with an empty item collection. Items are used throughout APIs for carts, wish lists, documents, payments, returns, properties, and more.
*/
@property(nonatomic) NSArray<MOZUAppDevPackage> *items;

@end

