//
//  MOZUCatalog.h
//  MozuApi
//
//  Created by Kevin Wright on 11/24/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@protocol MOZUCatalog
@end

@interface MOZUCatalog : JSONModel<MOZUCatalog>

@property NSDate* createDate;
@property NSString* defaultCurrencyCode;
@property NSString* defaultLocaleCode;
@property NSDate* deleteDate;
@property int id;
@property BOOL isDeleted;
@property int masterCatalogId;
@property NSString* name;
@property NSDate* updateDate;

@end
