//
//  MOZUCrypto.h
//  MozuApi
//
//  Created by Kevin Wright on 11/20/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MOZUCrypto : NSObject
+(NSString*)hashWithSecretKey:(NSString *)secretKey body:(NSString *)body;
@end
