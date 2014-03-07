//
//  MozuClient.h
//  Api
//
//  Created by Sanjay Mandadi on 10/15/13.
//  Copyright (c) 2013 Mozu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "MOZUAPIError.h"
#import "MOZUAPIContext.h"
#import "MOZUUserAuthenticator.h"
#import "MOZUURLComponents.h"
#import "MOZUHeaders.h"

typedef NS_ENUM(NSUInteger, MOZUDataViewMode) {
    MOZULive,
    MOZUPending
};

typedef NS_ENUM(NSUInteger, MOZUClientError)
{
    MOZUClientErrorMissingHost,
};

typedef void(^MOZUClientCompletionBlock)(id result, MOZUAPIError* error, NSHTTPURLResponse* response);
typedef id(^MOZUClientJSONParserBlock)(NSString* JSONResult);

typedef NS_ENUM(NSUInteger, MOZUClientSessionConfiguration)
{
    MOZUClientBackgroundSessionConfiguration,
    MOZUClientDefaultSessionConfiguration,
    MOZUClientEphemeralSessionConfiguration
};

static

@interface MOZUClient : NSObject

@property (nonatomic, readonly) NSString* JSONResult;
@property (nonatomic, readonly) id result; // Is this needed?
@property (nonatomic, readonly) NSInteger statusCode;
@property (nonatomic, readonly) MOZUAPIError* error;
@property (nonatomic, readonly) NSDictionary* headers;

@property (nonatomic, strong) MOZUUserAuthTicket * userClaims;
@property (nonatomic, strong) id body;
@property (nonatomic, strong) NSInputStream * bodyStream;
@property (nonatomic, strong) MOZUClientJSONParserBlock JSONParser;
@property (nonatomic, strong) MOZUAPIContext  *context;
@property (nonatomic, assign) MOZUClientSessionConfiguration sessionConfiguration; // Default is MOZUClientDefaultSessionConfiguration
@property (nonatomic, strong) NSString *backgroundSessionIdentifier; // Default is MOZUClientBackgroundSessionIdentifier


- (instancetype)initWithResourceURLComponents:(MOZUURLComponents *)resourceURLComponents
                               verb:(NSString *)verb;
- (void)setHeader:(NSString *)header value:(NSString *)value;
- (void)executeWithCompletionHandler:(MOZUClientCompletionBlock)completionHandler;

@end
