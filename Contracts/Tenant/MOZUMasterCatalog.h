//
//  MOZUMasterCatalog.h
//  MozuApi
//
//  Created by Kevin Wright on 11/24/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "MOZUCatalog.h"

@protocol MOZUMasterCatalog
@end

@interface MOZUMasterCatalog : JSONModel<MOZUMasterCatalog>

@property NSDate* createDate;
@property NSString* defaultCurrencyCode;
@property NSString* defaultLocaleCode;
@property NSDate* deleteDate;
@property int id;
@property BOOL isDeleted;
@property NSString* name;
@property NSDate* updateDate;
@property NSArray<MOZUCatalog>* catalogs;

@end
