//
//  MozuClient.m
//  Api
//
//  Created by Sanjay Mandadi on 10/15/13.
//  Copyright (c) 2013 Mozu. All rights reserved.
//

#import "MozuClient.h"

@implementation MozuClient



- (id)withHeader:(NSString*)header withValue:(NSString *)value {
    if (self._headers == NULL) {
       self._headers =  [[NSMutableDictionary alloc] init];
    }
    
    
    [self._headers setObject:value forKey:header];
    return self;
}

- (id)withBody:(JSONModel *)body {
    self._body = [body toJSONString];
    return self;
}

- (id)withBaseAddress:(NSString *)baseUrl {
    self._baseUrl = baseUrl;
    return self;
}

- (id)withVerb:(NSString *)verb {
    self._verb = verb;
    return self;
}

- (id)withResourceUrl:(NSString *)resourceUrl {
    self._resourceUrl = resourceUrl;
    return self;
}

- (id)execute {
    
    NSString* url = [self._baseUrl stringByAppendingString:self._resourceUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    for (NSDictionary *item in self._headers) {
        [request setValue:[item value] forHTTPHeaderField:[item key] ];
    }
    
    [request setHTTPMethod:self._verb];
    
    
    if ( ![self._verb isEqualToString:@"GET"]) {
        [request setHTTPBody:[NSData dataWithBytes:[self._body UTF8String] length:strlen([self._body UTF8String])]];
    }
    
    NSLog(@"%@",url);
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (!connection) {
        self._responseData = nil;
    }
    return self;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
    self._httpStatusCode = [httpResponse statusCode];
    self._responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self._responseData appendData:data];
    self._jsonData = [[NSString alloc] initWithData:self._responseData encoding:NSUTF8StringEncoding];
    [self.delegate requestCompleted:self];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Connection finished");
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    self._error = error;
    [self.delegate requestFailed:self];
    
}

-(NSString*)result {
    return self._jsonData;
}

-(int)statusCode {
    return self._httpStatusCode;
}

-(NSError *)error {
    return self._error;
}

@end
