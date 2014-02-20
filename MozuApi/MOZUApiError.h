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

@interface MOZUAPIExceptionDetail : JSONModel

@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *stackTrace;
@property (nonatomic, strong) NSString *targetSite;
@property (nonatomic, strong) NSString *type;

@end

@interface MOZUApiApplicationErrorData : JSONModel

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *value;

@end

@interface MOZUApiAdditionalErrorData : JSONModel

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *value;

@end

//@interface MOZUApiErrorItem : JSONModel
//
//@property (nonatomic, strong) MOZUAPIExceptionDetail *exceptionDetail;
//@property (nonatomic, strong) NSString *applicationName;
//@property (nonatomic, strong) NSString *errorCode;
//@property (nonatomic, strong) NSString *message;
//@property (nonatomic, strong) NSArray *additionalApplicationErrorData;
//
//
//@end

@interface MOZUApiError : NSError
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *applicationName;
@property (nonatomic, strong) NSString *errorCode;
@property (nonatomic, strong) MOZUAPIContext *apiContext;
@property (nonatomic, strong) NSString *correlationId;
@property (nonatomic, strong) MOZUAPIExceptionDetail *exceptionDetail;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSArray *additionalErrorData;
@property (nonatomic, assign) NSInteger httpStatusCode;

- (id)initWithString:(NSString*)JSONData statusCode:(NSInteger)statusCode;

@end
