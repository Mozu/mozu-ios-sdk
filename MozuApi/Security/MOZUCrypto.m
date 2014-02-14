//
//  MOZUCrypto.m
//  MozuApi
//
//  Created by Kevin Wright on 11/20/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//


#import "MOZUCrypto.h"
#import "NSString+SHA256.h"

@implementation MOZUCrypto
+(NSString*)hashWithSecretKey: (NSString*)secretKey body: (NSString*)body {
    NSString *payload = [secretKey stringByAppendingString:body];
    return [payload SHA256AsBase64];
}

@end
