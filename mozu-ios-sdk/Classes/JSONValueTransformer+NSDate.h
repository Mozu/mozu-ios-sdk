//
//  JSONValueTransformer+NSDate.h
//  MozuApi
//
//  Created by Kevin Wright on 11/1/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import "JSONValueTransformer.h"

@interface JSONValueTransformer (NSDate)

-(NSDate*)NSDateFromNSString:(NSString*)string;
-(NSString*)JSONObjectFromNSDate:(NSDate*)date;

@end
