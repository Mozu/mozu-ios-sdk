//
//  MozuClient.m
//  Api
//
//  Created by Sanjay Mandadi on 10/15/13.
//  Copyright (c) 2013 Mozu. All rights reserved.
//

#import "MOZUAppAuthenticator.h"
#import "MOZUClient.h"
#import "MOZUHeaders.h"
#import "MOZUResponseHelper.h"
#import "MOZUUserAuthenticator.h"
#import "MOZUUrl.h"
#import "MOZUTenantResource.h"

@interface MOZUClient()

@property(nonatomic, strong) NSString* JSONResult;
@property(nonatomic, strong) id result; // Is this needed?
@property(nonatomic, assign) NSInteger statusCode;
@property(nonatomic, strong) MOZUApiError* error;
@property(nonatomic, strong) NSDictionary* headers;

@property (nonatomic, strong) NSMutableDictionary *mutableHeaders;
@property (nonatomic, strong) MOZUAPIContext * APIContext;
@property (nonatomic, strong) NSString * baseURLString;
@property (nonatomic, strong) MOZUURL * resourceURL;
@property (nonatomic, strong) NSString * verb;
@property (nonatomic, strong) MOZUClientCompletionBlock completionHandler;

@end

@implementation MOZUClient

-(id)init
{
    if (self = [super init])
    {
        
    }
    
    return self;
}

- (instancetype)initWithContext:(MOZUAPIContext *)context verb:(NSString *)verb resourceURL:(MOZUURL *)resourceURL
{
    if (self = [self init]) {
        NSAssert(context, @"MOZUClient context is missing!");
        NSAssert(verb, @"MOZUClient verb is missing!");
        NSAssert(resourceURL, @"MOZUClient resourceURL is missing!");
    }
    
    return self;
}

-(MOZUClient*)withContext:(id<MOZUApiContext>)apiContext {
    self->_apiContext = apiContext;
    
    if (_apiContext.tenantId > 0) {
        [self withHeader:kX_VOL_TENANT andValue:[@(_apiContext.tenantId) description]];
    }
    
    if (_apiContext.siteId != nil && [_apiContext.siteId intValue] > 0) {
        [self withHeader:kX_VOL_SITE andValue:[_apiContext.siteId stringValue]];
    }
    
    if (_apiContext.masterCatalogId != nil && [_apiContext.masterCatalogId intValue] > 0) {
        [self withHeader:kX_VOL_MASTER_CATALOG andValue:[_apiContext.masterCatalogId stringValue]];
    }
    
    if (_apiContext.catalogId != nil && [_apiContext.catalogId intValue] > 0)
    {
        [self withHeader:kX_VOL_CATALOG andValue:[_apiContext.catalogId stringValue]];
    }

    return self;
}

-(MOZUClient*)withUserClaims:(MOZUAuthTicket*)authTicket {
    MOZUAuthenticationProfile* userInfo = [MOZUUserAuthenticator ensureAuthTicket:authTicket];
    if (userInfo != nil)
    {
        authTicket.accessToken = userInfo.authTicket.accessToken;
        authTicket.accessTokenExpiration = userInfo.authTicket.accessTokenExpiration;
    }
    
    [self withHeader:kX_VOL_USER_CLAIMS andValue:authTicket.accessToken];
    return self;
}

-(MOZUClient*)withHeader:(NSString*)header andValue:(NSString *)value {
    [self->_headers setValue:value forKey:header];
    return self;
}

-(MOZUClient*)withBody:(JSONModel *)body {
    self->_body = [body toJSONString];
    return self;
}

-(MOZUClient*)withBaseAddress:(NSString *)baseUrl {
    self->_baseUrl = baseUrl;
    return self;
}

-(MOZUClient*)withVerb:(NSString *)verb {
    self->_verb = [verb lowercaseString];
    return self;
}

-(MOZUClient*)withResourceUrl:(MOZUUrl *)resourceUrl {
    self->_resourceUrl = resourceUrl;
    return self;
}

-(MOZUClient*)withJsonParser:(MOZUClientJsonParserBlock)jsonParser {
    self->_jsonParser = jsonParser;
    return self;
}

-(MOZUClient*)withHandler:(MOZUClientCompletionBlock)handler {
    self->_handler = handler;
    return self;
}

-(NSString*) getHttpMethod {
    return self->_verb;
}

-(void)validateContext {
    if (self.resourceURL.location == kTenantPod) {
        if (self.APIContext == nil) {
            [NSException raise:@"MOZUClient apiContext is missing!" format:@""];
        }
        
        if (self->_apiContext.tenantId < 0) {
            [NSException raise:@"MOZUClient apiContext.tenantId is missing!" format:@""];
        }
        
        if ([self->_apiContext.tenantUrl length] == 0) {
            [MOZUTenantResource getTenant:self->_apiContext.tenantId withAuthTicket:nil withResultHandler:^(MOZUTenant *result) {
                if (result == nil) {
                    [NSException raise:@"Tenant not found!" format:@"tenantId = %d", self->_apiContext.tenantId];
                }
                
                self->_baseUrl = [self->_apiContext getUrlForDomain:result.domain];
            }];
        }
        else {
            self->_baseUrl = self->_apiContext.tenantUrl;
        }
    }
    else {
        if ([[MOZUAppAuthenticator baseUrl] length] == 0) {
            [NSException raise:@"MOZUAppAuthenticator baseUrl is missing!" format:@""];
        }
        
        self->_baseUrl = [MOZUAppAuthenticator baseUrl];
    }
}

-(void)executeWithCompletionHandler:(MOZUClientCompletionBlock)completionHandler {
    
    [self validateContext];
    NSString* url = [self->_baseUrl stringByAppendingString:self->_resourceUrl.url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setAllHTTPHeaderFields:self->_headers];
    [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    [request setHTTPMethod:self->_verb];
    
    if ( ![self->_verb isEqualToString:@"GET"]) {
        NSData* body = [self->_body dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:body];
    }
    
    //NSLog(@"%@",url);
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
                                                    self.statusCode = [httpResponse statusCode];
                                                    self.jsonResult = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                    self.error = [MOZUResponseHelper ensureSuccessOfResponse:httpResponse JSONResult:self.jsonResult];
  
                                                    if (self.jsonResult != nil) {
                                                        self.result = self->_jsonParser(self.jsonResult);
                                                    }
                                                    
                                                    if (self->_handler != nil) {
                                                        self->_handler(self.result, self.error, httpResponse);
                                                    }
                                                }];
    [dataTask resume];
}


@end
