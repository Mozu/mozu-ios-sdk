//
//  MOZUTenantUrl.h
//  MozuApi
//
//  Created by Kevin Wright on 11/24/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import "MOZUUrl.h"

@interface MOZUTenantUrl : NSObject 
+(MOZUUrl*)getTenantUrl:(int)tenantId;
@end
