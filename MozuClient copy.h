//
//  MozuClient.h
//  Api
//
//  Created by Sanjay Mandadi on 10/15/13.
//  Copyright (c) 2013 Mozu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Header.h"
#import "JSONModel.h"
#import "MozuDelegate.h"


@interface MozuClient : NSObject
{
    id <MozuDelegate> _delegate;
    
}

@property (nonatomic, retain) NSString* _baseUrl;
@property (nonatomic, retain) NSString* _body;
@property (nonatomic, retain) NSString* _verb;
@property (nonatomic, retain) NSString* _resourceUrl;
@property (nonatomic, retain) NSMutableData* _responseData;
@property (nonatomic, retain) NSString* _jsonData;
@property (nonatomic) int _httpStatusCode;
@property (nonatomic, retain) NSMutableDictionary* _headers;
@property (nonatomic, retain) id delegate;
@property (nonatomic, retain) NSError* _error;

- (id)withHeader:(NSString*)header withValue:(NSString *)value;
- (id)withBody:(JSONModel *)body;
- (id)withBaseAddress:(NSString *)baseUrl;
- (id)withVerb:(NSString *)verb;
- (id)withResourceUrl:(NSString *)resourceUrl;
- (id)execute;
- (NSString*)result;
- (int)statusCode;
- (NSError*)error;

@end
