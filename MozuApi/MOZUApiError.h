//
//  MOZUApiError.h
//  MozuApi
//
//  Created by Kevin Wright on 10/29/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface MOZUApiExceptionDetail : JSONModel
@property NSString *message;
@property NSString *source;
@property NSString *stackTrace;
@property NSString *targetSite;
@property NSString *type;
@end

@protocol MOZUApiApplicationErrorData
@end

@interface MOZUApiApplicationErrorData : JSONModel
@property NSString *name;
@property NSString *value;
@end

@protocol MOZUApiErrorItem
@end

@interface MOZUApiErrorItem : JSONModel
@property MOZUApiExceptionDetail *exceptionDetail;
@property NSString *applicationName;
@property NSString *errorCode;
@property NSString *message;
@property NSArray<MOZUApiApplicationErrorData> *additionalErrorData;
//@property NSArray<MOZUApiApplicationErrorData> *items;
@end

@interface MOZUApiError : NSObject
@property int httpStatusCode;
@property MOZUApiErrorItem *apiError;

- (id) initWithString: (NSString*)jsonData andStatusCode: (int) statusCode;

@end
