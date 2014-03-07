 //
//  MOZUAPIError.m
//  MozuApi
//
//  Created by Kevin Wright on 10/29/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import "MOZUAPIError.h"
#import "MOZUAPILogger.h"

@implementation MOZUAPIExceptionDetail
+(BOOL)propertyIsOptional:(NSString*)propertyName
{
	return YES;
}

@end

@implementation MOZUAPIApplicationErrorData
+(BOOL)propertyIsOptional:(NSString*)propertyName
{
	return YES;
}

@end

@implementation MOZUAPIErrorItem
+(BOOL)propertyIsOptional:(NSString*)propertyName
{
	return YES;
}

@end

@implementation MOZUAPIAdditionalErrorData
+(BOOL)propertyIsOptional:(NSString*)propertyName
{
	return YES;
}

@end

// Private json model.
@interface MOZUAPIErrorPrivate : JSONModel
@property (nonatomic) NSString *message;
@property (nonatomic) NSString *applicationName;
@property (nonatomic) NSString *errorCode;
@property (nonatomic) MOZUAPIContext *apiContext;
@property (nonatomic) NSString *correlationId;
@property (nonatomic) MOZUAPIExceptionDetail *exceptionDetail;
@property (nonatomic) NSArray<MOZUAPIErrorItem> *items;
@property (nonatomic) NSArray<MOZUAPIAdditionalErrorData> *additionalErrorData;
@property (nonatomic) NSInteger httpStatusCode;

@end

@implementation MOZUAPIErrorPrivate

-(id)initWithString:(NSString*)string error:(JSONModelError**)err
{
    self = [super initWithString:string error:err];
    if (self) {
        
    }
    return self;
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

@implementation MOZUAPIError

static NSString * const MOZUAPIErrorDomain = @"MOZUAPIErrorDomain";

- (instancetype)initWithString:(NSString*)JSONData statusCode:(NSInteger)statusCode
{
    JSONModelError *jsonModelError = nil;
    MOZUAPIErrorPrivate* apiErrorPrivate = [[MOZUAPIErrorPrivate alloc] initWithString:JSONData error:&jsonModelError];
        NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] initWithCapacity:9];
    
    if (apiErrorPrivate) {
        userInfo[@"httpStatusCode"] = @(statusCode);
        
        if (apiErrorPrivate.message) {
            userInfo[@"message"] = apiErrorPrivate.message;
            userInfo[NSLocalizedDescriptionKey] = apiErrorPrivate.message;
        }
        if (apiErrorPrivate.applicationName) {
            userInfo[@"applicationName"] = apiErrorPrivate.applicationName;
        }
        if (apiErrorPrivate.errorCode) {
            userInfo[@"errorCode"] = apiErrorPrivate.errorCode;
        }
        if (apiErrorPrivate.apiContext) {
            userInfo[@"apiContext"] = apiErrorPrivate.apiContext;
        }
        if (apiErrorPrivate.correlationId) {
            userInfo[@"correlationId"] = apiErrorPrivate.correlationId;
        }
        if (apiErrorPrivate.exceptionDetail) {
            userInfo[@"exceptionDetail"] = apiErrorPrivate.exceptionDetail;
        }
        if (apiErrorPrivate.items) {
            userInfo[@"items"] = apiErrorPrivate.items;
        }
        if (apiErrorPrivate.additionalErrorData) {
            userInfo[@"additionalErrorData"] = apiErrorPrivate.additionalErrorData;
        }
        
        
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
        
        self = [super initWithDomain:MOZUAPIErrorDomain code:statusCode userInfo:[userInfo copy]];
        if (self) {
            [self.userInfo enumerateKeysAndObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(NSString *key, id obj, BOOL *stop) {
                if ([key isEqualToString:@"httpStatusCode"]) {
                    _httpStatusCode = [obj integerValue];;
                } else if ([key isEqualToString:@"message"]) {
                    _message = obj;
                } else if ([key isEqualToString:@"applicationName"]) {
                    _applicationName = obj;
                } else if ([key isEqualToString:@"errorCode"]) {
                    _errorCode = obj;
                } else if ([key isEqualToString:@"apiContext"]) {
                    _apiContext = obj;
                } else if ([key isEqualToString:@"correlationId"]) {
                    _correlationId = obj;
                } else if ([key isEqualToString:@"exceptionDetail"]) {
                    _exceptionDetail = obj;
                } else if ([key isEqualToString:@"items"]) {
                    _items = obj;
                } else if ([key isEqualToString:@"additionalErrorData"]) {
                    _additionalErrorData = obj;
                }
            }];
        }
        return self;

    } else {
        DDLogError(@"%@", jsonModelError.localizedDescription);
        return nil;
    }
}




@end


