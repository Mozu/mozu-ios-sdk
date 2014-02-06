//
//  MOZUSite.h
//  MozuApi
//
//  Created by Kevin Wright on 11/24/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@protocol MOZUSite
@end

@interface MOZUSite : JSONModel<MOZUSite>

@property int catalogId;
@property NSString* countryCode;
@property NSDate* createDate;
@property NSString* currencyCode;
@property NSString* domain;
@property int id;
@property NSString* localeCode;
@property NSString* name;
@property NSString* primaryCustomDomain;
@property int tenantId;

@end
