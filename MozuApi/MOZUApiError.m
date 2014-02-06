//
//  MOZUApiError.m
//  MozuApi
//
//  Created by Kevin Wright on 10/29/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import "MOZUApiError.h"

@implementation MOZUApiExceptionDetail
@end

@implementation MOZUApiApplicationErrorData
@end

@implementation MOZUApiErrorItem
@end

@implementation MOZUApiError

- (id) initWithString: (NSString*)jsonData andStatusCode: (int) statusCode {
    self.httpStatusCode = statusCode;

    JSONModelError *err = nil;
    self.apiError = [[MOZUApiErrorItem alloc] initWithString:jsonData error:&err];
    return self;
}


@end

