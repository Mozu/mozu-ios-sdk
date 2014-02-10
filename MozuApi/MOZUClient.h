//
//  MozuClient.h
//  Api
//
//  Created by Sanjay Mandadi on 10/15/13.
//  Copyright (c) 2013 Mozu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "MOZUApiError.h"
#import "MOZUApiContext.h"
#import "MOZUAuthTicket.h"

// add http response and get rid of headers
//
typedef void(^MOZUClientCompletionBlock)(id result, MOZUApiError* error, NSHTTPURLResponse* response);
typedef id(^MOZUClientJsonParserBlock)(NSString* jsonResult);

@interface MOZUClient : NSObject

@property(readonly) NSString* jsonResult;
@property(readonly) id result;
@property(readonly) int statusCode;
@property(readonly) MOZUApiError* error;
@property(readonly) NSDictionary* headers;

// move required propteries to constructor

-(MOZUClient*)withContext:(id<MOZUApiContext>)context;  // required
-(MOZUClient*)withUserClaims:(MOZUAuthTicket*)authTicket;  // optional
-(MOZUClient*)withHeader:(NSString*)header andValue:(NSString*)value; // optional
-(MOZUClient*)withBody:(JSONModel *)body;  // optional
-(MOZUClient*)withVerb:(NSString *)verb;  // required
-(MOZUClient*)withResourceUrl:(MOZUURL*)resourceURL;  // required
-(MOZUClient*)withJsonParser:(MOZUClientJsonParserBlock)jsonParser;  // optional
-(MOZUClient*)completionHandler:(MOZUClientCompletionBlock)handler; // required ad to execute method
-(void)execute;

@end
