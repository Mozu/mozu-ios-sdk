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

typedef void(^MOZUClientCompletionBlock)(id result, NSHTTPURLResponse *response, MOZUAPIError *error);
typedef id(^MOZUClientJSONParserBlock)(NSString *JSONResult);

typedef NS_ENUM(NSUInteger, MOZUClientSessionConfiguration)
{
    MOZUClientBackgroundSessionConfiguration,
    MOZUClientDefaultSessionConfiguration,
    MOZUClientEphemeralSessionConfiguration
};

static

@interface MOZUClient : NSObject

// These can be used to configure client behavior.
@property (nonatomic, strong) MOZUUserAuthTicket *userClaims;
@property (nonatomic, strong) MOZUAPIContext *context;
@property (nonatomic, strong) MOZUClientJSONParserBlock JSONParser; // Used to convert network response into "result" in completion handler.
@property (nonatomic, strong) id body;
@property (nonatomic, strong) NSInputStream *bodyStream;

@property (nonatomic, readonly) MOZUURLComponents *resourceURLComponents;
@property (nonatomic, readonly) NSDictionary *headers;

// These are valid when executeWithCompletionHandler calls it's completion handler.
@property (nonatomic, readonly) NSString *JSONResult;
@property (nonatomic, readonly) id result;
@property (nonatomic, readonly) NSInteger statusCode;
@property (nonatomic, readonly) MOZUAPIError *error;


@property (nonatomic, assign) MOZUClientSessionConfiguration sessionConfiguration; // Default is MOZUClientDefaultSessionConfiguration
@property (nonatomic, strong) NSString *backgroundSessionIdentifier; // Default is MOZUClientBackgroundSessionIdentifier


/**
	Creates a MOZUClient object.
	@param resourceURLComponents A MOZUURLComponents encapsulating the REST URL endpoint.
	@param verb HTTP verb. E.g. "GET", "POST", etc.
	@returns An instance of a MOZUClient object.
 */
- (instancetype)initWithResourceURLComponents:(MOZUURLComponents *)resourceURLComponents
                                         verb:(NSString *)verb;

/**
	Sets values for the HTTP headear of the URL request.
	@param header Header key. See MOZUHeaders.h for values.
	@param value Value for header key.
	@returns none
 */
- (void)setHeader:(NSString *)header value:(NSString *)value;

/**
	Makes a client asynchronous network request.
	@param completionHandler Completion handler called when network request completes.
	@returns none
 */
- (void)executeWithCompletionHandler:(MOZUClientCompletionBlock)completionHandler;


@end
