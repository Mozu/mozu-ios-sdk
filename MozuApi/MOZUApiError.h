//
//  MOZUAPIError.h
//  MozuApi
//
//  Created by Kevin Wright on 10/29/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "MOZUAPIContext.h"

@protocol MOZUAPIExceptionDetail
@end

@interface MOZUAPIExceptionDetail : JSONModel <MOZUAPIExceptionDetail>

@property (nonatomic) NSString *message;
@property (nonatomic) NSString *source;
@property (nonatomic) NSString *stackTrace;
@property (nonatomic) NSString *targetSite;
@property (nonatomic) NSString *type;

@end

@protocol MOZUAPIApplicationErrorData
@end

@interface MOZUAPIApplicationErrorData : JSONModel <MOZUAPIApplicationErrorData>

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *value;

@end

@protocol MOZUAPIAdditionalErrorData
@end

@interface MOZUAPIAdditionalErrorData : JSONModel <MOZUAPIAdditionalErrorData>

@property (nonatomic) NSString *name;
@property (nonatomic) NSObject *value;

@end

@protocol MOZUAPIErrorItem
@end

@interface MOZUAPIErrorItem : JSONModel <MOZUAPIErrorItem>

@property (nonatomic) NSArray<MOZUAPIApplicationErrorData>* applicationErrorData;
@property (nonatomic) NSString *applicationName;
@property (nonatomic) NSString *errorCode;
@property (nonatomic) NSString *message;


@end

@protocol MOZUAPIError
@end

@interface MOZUAPIError : NSError <MOZUAPIError>
@property (nonatomic, readonly) NSString *message;
@property (nonatomic, readonly) NSString *applicationName;
@property (nonatomic, readonly) NSString *errorCode;
@property (nonatomic, readonly) MOZUAPIContext *apiContext;
@property (nonatomic, readonly) NSString *correlationId;
@property (nonatomic, readonly) MOZUAPIExceptionDetail *exceptionDetail;
@property (nonatomic, readonly) NSArray<MOZUAPIErrorItem> *items;
@property (nonatomic, readonly) NSArray<MOZUAPIAdditionalErrorData> *additionalErrorData;
@property (nonatomic, readonly) NSInteger httpStatusCode;

- (id)initWithString:(NSString *)JSONData statusCode:(NSInteger)statusCode;

@end
