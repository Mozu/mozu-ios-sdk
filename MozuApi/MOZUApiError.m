//
//  MOZUApiError.m
//  MozuApi
//
//  Created by Kevin Wright on 10/29/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import "MOZUApiError.h"

//@implementation MOZUAPIExceptionDetail
//@end
//
//@implementation MOZUApiApplicationErrorData
//@end

//@implementation MOZUApiErrorItem
//@end

@implementation MOZUApiError

static NSString * const MOZUApiErrorDomain = @"MOZUAPIErrorDomain";

- (instancetype)initWithString:(NSString*)JSONData statusCode:(NSInteger)statusCode
{
//    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] initWithCapacity:2];
//    userInfo[@"httpStatusCode"] = @(statusCode);
    
//    JSONModelError *err = nil;
//    MOZUApiErrorItem *apiError = [[MOZUApiErrorItem alloc] initWithString:JSONData error:&err];
    
//    if (!err) {
//        userInfo[@"apiError"] = apiError;
//    }
    
    // TODO: Add these NSError keys to user info. See NSError documentation.
//    NSString * const NSLocalizedDescriptionKey;
//    NSString * const NSErrorFailingURLStringKey;
//    NSString * const NSFilePathErrorKey;
//    NSString * const NSStringEncodingErrorKey;
//    NSString * const NSUnderlyingErrorKey;
//    NSString * const NSURLErrorKey;
//    NSString * const NSLocalizedFailureReasonErrorKey;
//    NSString * const NSLocalizedRecoverySuggestionErrorKey;
//    NSString * const NSLocalizedRecoveryOptionsErrorKey;
//    NSString * const NSRecoveryAttempterErrorKey;
//    NSString * const NSHelpAnchorErrorKey;
//    NSString * const NSURLErrorFailingURLErrorKey;
//    NSString * const NSURLErrorFailingURLStringErrorKey;
//    NSString * const NSURLErrorFailingURLPeerTrustErrorKey;
    
//    self = [NSError errorWithDomain:MOZUAPIErrorDomain code:statusCode userInfo:[userInfo copy]];
//    if (self) {
//        _httpStatusCode = statusCode;
//        _apiError = apiError;
//    }
//    return self;
    
    
//    NSData* jsonData = [JSONData dataUsingEncoding:NSUTF8StringEncoding];
//    NSError *error = nil;
//    id dict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
//    
//    id exceptionDetail = [dict objectForKey:@"exceptionDetail"];
//    if (exceptionDetail == nil) {
//        exceptionDetail = [dict objectForKey:@"ExceptionDetail"];
//    }
    
    // convert exceptionDetail to JSONMOdel
    // if (exceptionDetail != nill {
    //    message = exceptionDetail.message;
    // }
    // else {
    //    look for message in dict
    // }
    
//    id items = [dict objectForKey:@"items"];
//    if (items == nil) {
//        exceptionDetail = [dict objectForKey:@"Items"];
//    }
    
    // convert items to JSONMOdel

    NSError *error = nil;
//    [MOZUApiAdditionalErrorData class];
    MOZUApiError* apiError = [[MOZUApiError alloc] initWithString:JSONData error:&error];
    apiError.httpStatusCode = statusCode;
    return apiError;
}

+(JSONKeyMapper*)keyMapper {
    NSDictionary *dict = @{
                           @"exceptionDetail" : @"exceptionDetail",
                           @"ExceptionDetail" : @"exceptionDetail",
                           @"items" : @"items",
                           @"Items" : @"items",
                           };
    return [[JSONKeyMapper alloc] initWithDictionary:dict];
}

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
	return YES;
}


@end

