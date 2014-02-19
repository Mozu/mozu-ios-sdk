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
@property (nonatomic, strong) NSURL * baseURL;
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
//        NSString *baseURL = [MOZUAppAuthenticator baseUrl];
//        if (!baseURL || [baseURL isEqualToString:@""]) {
//            [NSException raise:@"MOZUMissingBaseURLException" format:@"MOZUAppAuthenticator baseUrl is missing!"];
//        } else {
//            _baseURLString = baseURL;
//        }

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
    _APIContext = APIContext;
    
    if (APIContext.tenantId > 0) {
        [self setHeader:MOZU_X_VOL_TENANT value:[@(APIContext.tenantId) description]];
    }
    
    if (APIContext.siteId != nil && [APIContext.siteId intValue] > 0) {
        [self setHeader:MOZU_X_VOL_SITE value:[APIContext.siteId stringValue]];
    }
    
    if (APIContext.masterCatalogId != nil && [APIContext.masterCatalogId intValue] > 0) {
        [self setHeader:MOZU_X_VOL_MASTER_CATALOG value:[APIContext.masterCatalogId stringValue]];
    }
    
    if (APIContext.catalogId != nil && [APIContext.catalogId intValue] > 0)
    {
        [self setHeader:MOZU_X_VOL_CATALOG value:[APIContext.catalogId stringValue]];
    }
}

- (void)setUserClaims:(MOZUUserAuthTicket *)userClaims
{
    _userClaims = userClaims;
    
    MOZUAuthenticationProfile* userInfo = [MOZUUserAuthenticator ensureUserAuthTicket:userClaims];
    if (userInfo) {
        userClaims.accessToken = userInfo.authTicket.accessToken;
        userClaims.accessTokenExpiration = userInfo.authTicket.accessTokenExpiration;
    }
    
    [self setHeader:MOZU_X_VOL_USER_CLAIMS value:userClaims.accessToken];
}

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

- (void)validateContext:(MOZUAPIContext *)APIContext completionHandler:(void (^)())completion {
    if (self.resourceURL.location == MOZUTenantPod) {
        NSAssert(APIContext, @"MOZUClient APIContext is missing.");
        NSAssert(APIContext.tenantId >=0, @"APIContext.tenantId less than 0.");
        
        if (APIContext.tenantHost.length == 0) {
            id tenantRes = [[MOZUTenantResource alloc] initWithAPIContext:APIContext];
            [tenantRes tenantWithTenantId:APIContext.tenantId userClaims:nil completionHandler:^void(MOZUTenant* result, MOZUApiError* error, NSHTTPURLResponse* response) {
                if (!result) {
                    [NSException raise:@"MOZUTenantNotFoundException" format:@"tenantId = %@", [@(APIContext.tenantId) stringValue]];
                }
                
                self.baseURL = [APIContext getURLForHost:result.domain];
                completion();
            }];
        } else {
            self.baseURL = [APIContext getURLForHost:APIContext.tenantHost];
            completion();
        }
    } else {
        completion();
    }
}

-(void)executeWithCompletionHandler:(MOZUClientCompletionBlock)completionHandler
{
    typeof(self) __weak weakSelf = self;
    [self validateContext:self.APIContext completionHandler:^{
        typeof(weakSelf) __strong strongSelf = weakSelf;
        if (strongSelf) {
            NSURLComponents *URLComponents = [[NSURLComponents alloc] initWithString:strongSelf.baseURL.absoluteString];
            URLComponents.path = strongSelf.resourceURL.URL.absoluteString;
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URLComponents.URL];
            [request setAllHTTPHeaderFields:strongSelf.headers];
            [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
            [request setHTTPMethod:strongSelf.verb];
            
            if (![strongSelf.verb isEqualToString:@"GET"]) {
                NSData* body = [strongSelf.bodyString dataUsingEncoding:NSUTF8StringEncoding];
                [request setHTTPBody:body];
            }
            
            //NSLog(@"%@",url);
            NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
            NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
            NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
                                                            strongSelf.statusCode = [httpResponse statusCode];
                                                            strongSelf.JSONResult = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                            strongSelf.error = [MOZUResponseHelper ensureSuccessOfResponse:httpResponse JSONResult:strongSelf.JSONResult];
                                                            
                                                            if (strongSelf.JSONResult) {
                                                                strongSelf.result = strongSelf.JSONParser(strongSelf.JSONResult);
                                                            }
                                                            
                                                            if (completionHandler) {
                                                                completionHandler(strongSelf.result, strongSelf.error, httpResponse);
                                                            }
                                                        }];
            [dataTask resume];
        }
    }];
}


@end
