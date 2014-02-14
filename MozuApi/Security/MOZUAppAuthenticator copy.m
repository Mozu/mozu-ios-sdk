//
//  Authentication.m
//  Api
//
//  Created by Sanjay Mandadi on 10/3/13.
//  Copyright (c) 2013 Mozu. All rights reserved.
//

#import "MOZUAppAuthenticator.h"
#import "MOZUAppAuthInfo.h"
#import "MOZUAuthTicket.h"


@implementation MOZUAppAuthenticator


NSMutableData *_responseData;


-(id)init:(MOZUAppAuthInfo*)appAuthInfo withBaseUrl:(NSString*)url {
    self.authInfo = appAuthInfo;
    self.baseUrl = url;
    
    return self;
}

+(id)initializeWithAuthInfo:(MOZUAppAuthInfo *)appAuthInfo andBaseUrl:(NSString*)baseUrl {
    static MOZUAppAuthenticator* auth = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        auth = [[MOZUAppAuthenticator alloc] init:appAuthInfo withBaseUrl:baseUrl];
        [auth authenticate];
    });
    return auth;
}

+(void)addAuthToRequest:(NSMutableURLRequest *)request {
    //[request setValue: forHTTPHeaderField:[item value] ];
}

+(MOZUAuthTicket *)authTicket {
    return nil;
}

-(void)authenticate {
    if (self.authTicket == nil) {
        NSString* data = [self.authInfo toJSONString];
        NSString* url = [self.baseUrl stringByAppendingString:@"/api/platform/applications/authtickets/"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
        
        [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:[NSData dataWithBytes:[data UTF8String] length:strlen([data UTF8String])]];
        
        NSLog(@"%@",url);
        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        if (!connection) {
            _responseData = nil;
        }
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_responseData appendData:data];
    NSError* err = nil;
    self.authTicket = [[MOZUAuthTicket alloc] initWithString:[[NSString alloc] initWithData:_responseData encoding:NSUTF8StringEncoding] error:&err];

}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Connection finished");
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"%@",[error localizedDescription]);
}
@end
