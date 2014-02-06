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

typedef void(^MOZUClientCompletionBlock)(id result, MOZUApiError* error, NSDictionary* headers);
typedef id(^MOZUClientJsonParserBlock)(NSString* jsonResult);

@interface MOZUClient : NSObject

@property(readonly) NSString* jsonResult;
@property(readonly) id result;
@property(readonly) int statusCode;
@property(readonly) MOZUApiError* error;
@property(readonly) NSDictionary* headers;

-(MOZUClient*)withContext:(id<MOZUApiContext>)context;
-(MOZUClient*)withUserClaims:(MOZUAuthTicket*)authTicket;
-(MOZUClient*)withHeader:(NSString*)header andValue:(NSString*)value;
-(MOZUClient*)withBody:(JSONModel *)body;
-(MOZUClient*)withBaseAddress:(NSString*)baseUrl;
-(MOZUClient*)withVerb:(NSString *)verb;
-(MOZUClient*)withResourceUrl:(NSString*)resourceUrl;
-(MOZUClient*)withJsonParser:(MOZUClientJsonParserBlock)jsonParser;
-(MOZUClient*)withHandler:(MOZUClientCompletionBlock)handler;
-(void)execute;

@end
