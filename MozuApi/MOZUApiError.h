//
//  MOZUApiError.h
//  MozuApi
//
//  Created by Kevin Wright on 10/29/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "MOZUAPIContext.h"

@protocol MOZUApiExceptionDetail
@end

@interface MOZUApiExceptionDetail : JSONModel

@property (nonatomic) NSString *message;
@property (nonatomic) NSString *source;
@property (nonatomic) NSString *stackTrace;
@property (nonatomic) NSString *targetSite;
@property (nonatomic) NSString *type;

@end

@protocol MOZUApiApplicationErrorData
@end

@interface MOZUApiApplicationErrorData : JSONModel

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *value;

@end

@protocol MOZUApiAdditionalErrorData
@end

@interface MOZUApiAdditionalErrorData : JSONModel

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *value;

@end

@protocol MOZUApiErrorItem
@end

@interface MOZUApiErrorItem : JSONModel

@property (nonatomic) NSArray<MOZUApiApplicationErrorData>* applicationErrorData;
@property (nonatomic) NSString *applicationName;
@property (nonatomic) NSString *errorCode;
@property (nonatomic) NSString *message;


@end

@protocol MOZUApiError
@end

@class MOZUApiAdditionalErrorData;

@interface MOZUApiError : JSONModel
@property (nonatomic) NSString *message;
@property (nonatomic) NSString *applicationName;
@property (nonatomic) NSString *errorCode;
@property (nonatomic) MOZUAPIContext *apiContext;
@property (nonatomic) NSString *correlationId;
@property (nonatomic) MOZUApiExceptionDetail *exceptionDetail;
@property (nonatomic) NSArray<MOZUApiErrorItem> *items;
@property (nonatomic) NSArray<MOZUApiAdditionalErrorData> *additionalErrorData;
@property (nonatomic) NSInteger httpStatusCode;

- (id)initWithString:(NSString*)JSONData statusCode:(NSInteger)statusCode;

@end
