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
@property (nonatomic, strong) NSString *bodyString;

@end

@implementation MOZUClient

-(instancetype)init
{
    if (self = [super init])
    {
        _mutableHeaders = [NSMutableDictionary new];
        NSString *baseURL = [MOZUAppAuthenticator baseUrl];
        if (!baseURL || [baseURL isEqualToString:@""]) {
            [NSException raise:@"MOZUMissingBaseURLException" format:@"MOZUAppAuthenticator baseUrl is missing!"];
        }
        if ([[MOZUAppAuthenticator baseUrl] length] == 0) {
            
        }
        
        _baseURLString = baseURL;

    }
    
    return self;
}

- (instancetype)initWithResourceURL:(MOZUURL *)resourceURL
                               verb:(NSString *)verb;
{
    if (self = [self init]) {
        NSAssert(verb, @"MOZUClient verb is missing!");
        NSAssert(resourceURL, @"MOZUClient resourceURL is missing!");
        _resourceURL = resourceURL;
        _verb = [verb lowercaseString];
    }
    
    return self;
}

- (void)setAPIContext:(MOZUAPIContext *)APIContext
{
    [self validateContext:APIContext];
    
    _APIContext = APIContext;
    
    if (APIContext.tenantId > 0) {
        [self setHeader:kX_VOL_TENANT value:[@(APIContext.tenantId) description]];
    }
    
    if (APIContext.siteId != nil && [APIContext.siteId intValue] > 0) {
        [self setHeader:kX_VOL_SITE value:[APIContext.siteId stringValue]];
    }
    
    if (APIContext.masterCatalogId != nil && [APIContext.masterCatalogId intValue] > 0) {
        [self setHeader:kX_VOL_MASTER_CATALOG value:[APIContext.masterCatalogId stringValue]];
    }
    
    if (APIContext.catalogId != nil && [APIContext.catalogId intValue] > 0)
    {
        [self setHeader:kX_VOL_CATALOG value:[APIContext.catalogId stringValue]];
    }
}

/*
-(MOZUClient*)withUserClaims:(MOZUAuthTicket*)authTicket {
    MOZUAuthenticationProfile* userInfo = [MOZUUserAuthenticator ensureAuthTicket:authTicket];
    if (userInfo != nil)
    {
        authTicket.accessToken = userInfo.authTicket.accessToken;
        authTicket.accessTokenExpiration = userInfo.authTicket.accessTokenExpiration;
    }
    
    [self setHeader:kX_VOL_USER_CLAIMS value:authTicket.accessToken];
    return self;
}
*/
- (void)setHeader:(NSString *)header value:(NSString *)value
{
    NSAssert(header, @"Header cannot be nil.");
    NSAssert(value, @"Header value cannot be nil.");
    
    self.mutableHeaders[header] = value;
}

- (void)setBody:(JSONModel *)body
{
    _body = body;
    self.bodyString = [body toJSONString];
}

/*
-(MOZUClient*)withBaseAddress:(NSString *)baseUrl {
    self->_baseUrl = baseUrl;
    return self;
}
*/

- (void)validateContext:(MOZUAPIContext *)APIContext {
    if (self.resourceURL.location == MOZUTenantPod) {
        NSAssert(APIContext, @"MOZUClient APIContext is missing.");
        NSAssert(APIContext.tenantId >=0, @"APIContext.tenantId less than 0.");
        
        if (APIContext.tenantUrl.length == 0) {
            [MOZUTenantResource tenantWithTenantId:APIContext.tenantId authTicket:nil completionHandler:^(MOZUTenant *result) {
                if (!result) {
                    [NSException raise:@"MOZUTenantNotFoundException" format:@"tenantId = %d", APIContext.tenantId];
                }
                
                self.baseURLString = [APIContext getURLForDomain:result.domain];
            }];
        } else {
            self.baseURLString = APIContext.tenantUrl;
        }
    }
}

-(void)executeWithCompletionHandler:(MOZUClientCompletionBlock)completionHandler
{
    NSString* url = [self.baseURLString stringByAppendingString:self.resourceURL.URL.absoluteString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setAllHTTPHeaderFields:self->_headers];
    [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    [request setHTTPMethod:self->_verb];
    
    if ( ![self.verb isEqualToString:@"GET"]) {
        NSData* body = [self.bodyString dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:body];
    }
    
    //NSLog(@"%@",url);
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
                                                    self.statusCode = [httpResponse statusCode];
                                                    self.JSONResult = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                    self.error = [MOZUResponseHelper ensureSuccessOfResponse:httpResponse JSONResult:self.JSONResult];
                                                    
                                                    if (self.JSONResult != nil) {
                                                        self.result = self.JSONParser(self.JSONResult);
                                                    }
                                                    
                                                    if (completionHandler) {
                                                        completionHandler(self.result, self.error, httpResponse);
                                                    }
                                                }];
    [dataTask resume];
}


@end
