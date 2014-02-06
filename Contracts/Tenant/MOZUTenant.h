//
//  MOZUTenant.h
//  MozuApi
//
//  Created by Kevin Wright on 11/24/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "MOZUMasterCatalog.h"
#import "MOZUSite.h"

@protocol MOZUTenant
@end

@interface MOZUTenant : JSONModel<MOZUTenant>

@property NSString* domain;
@property int id;
@property BOOL isDevTenant;
@property NSString* name;
@property NSArray<MOZUMasterCatalog>* masterCatalogs;
@property NSArray<MOZUSite>* sites;

@end
