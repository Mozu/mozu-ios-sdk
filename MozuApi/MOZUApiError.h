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

@interface MOZUApiExceptionDetail : JSONModel <MOZUApiExceptionDetail>

@property (nonatomic) NSString *message;
@property (nonatomic) NSString *source;
@property (nonatomic) NSString *stackTrace;
@property (nonatomic) NSString *targetSite;
@property (nonatomic) NSString *type;

@end

@protocol MOZUApiApplicationErrorData
@end

@interface MOZUApiApplicationErrorData : JSONModel <MOZUApiApplicationErrorData>

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *value;

@end

@protocol MOZUApiAdditionalErrorData
@end

@interface MOZUApiAdditionalErrorData : JSONModel <MOZUApiAdditionalErrorData>

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *value;

@end

@protocol MOZUApiErrorItem
@end

@interface MOZUApiErrorItem : JSONModel <MOZUApiErrorItem>

@property (nonatomic) NSArray<MOZUApiApplicationErrorData>* applicationErrorData;
@property (nonatomic) NSString *applicationName;
@property (nonatomic) NSString *errorCode;
@property (nonatomic) NSString *message;


@end

@protocol MOZUApiError
@end

@interface MOZUApiError : NSError <MOZUApiError>
@property (nonatomic, readonly) NSString *message;
@property (nonatomic, readonly) NSString *applicationName;
@property (nonatomic, readonly) NSString *errorCode;
@property (nonatomic, readonly) MOZUAPIContext *apiContext;
@property (nonatomic, readonly) NSString *correlationId;
@property (nonatomic, readonly) MOZUApiExceptionDetail *exceptionDetail;
@property (nonatomic, readonly) NSArray<MOZUApiErrorItem> *items;
@property (nonatomic, readonly) NSArray<MOZUApiAdditionalErrorData> *additionalErrorData;
@property (nonatomic, readonly) NSInteger httpStatusCode;

- (id)initWithString:(NSString*)JSONData statusCode:(NSInteger)statusCode;

@end
