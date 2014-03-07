//
//  NSString+SHA256.m
//  MozuApi
//
//  Created by Kevin Wright on 11/20/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "NSString+SHA256.h"
#import "Base64.h"

@implementation NSString (SHA256)
- (NSString *)SHA256AsBase64 {
	unsigned int outputLength = CC_SHA256_DIGEST_LENGTH;
	unsigned char output[outputLength];
	
	CC_SHA256(self.UTF8String, [self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], output);
    NSData* data = [NSData dataWithBytes:(const void *)output length:outputLength];
	return [data base64EncodedString];
    
}

@end
