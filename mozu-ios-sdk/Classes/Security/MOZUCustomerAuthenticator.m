//
//  MOZUCustomerAuthenticator.m
//  Pods
//
//  Created by Rabin Joshi on 5/11/16.
//
//

#import "MOZUCustomerAuthenticator.h"

#import "MOZUCustomerAuthTicketURLComponents.h"
#import "MOZUAPIVersion.h"
#import "MOZUHeaders.h"
#import "MOZUResponseHelper.h"

@implementation MOZUCustomerAuthenticator

+ (MOZUCustomerAuthenticator *)sharedCustomerAuthenticator {
    static MOZUCustomerAuthenticator *_sharedCustomerAuthenticator = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        _sharedCustomerAuthenticator = [[self alloc] init];
    });
    
    return _sharedCustomerAuthenticator;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)createCustomerAuthTicket:(MOZUCustomerUserAuthInfo *)customerUserAuthInfo
                   completionHandler:(void(^)(MOZUCustomerAuthTicket *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler {
    
    MOZUURLComponents *components = [MOZUCustomerAuthTicketURLComponents URLComponentsForCreateUserAuthTicketOperationWithResponseFields:nil];
    components.host = self.host;
    components.useSSL = YES;
    NSURL *url = components.URL;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    [request setValue:self.apiVersion forHTTPHeaderField:MOZU_X_VOL_VERSION];
    [request setValue:self.appToken forHTTPHeaderField:MOZU_X_VOL_APP_CLAIMS];
    [request setValue:self.tenant forHTTPHeaderField:MOZU_X_VOL_TENANT];
    [request setValue:self.site forHTTPHeaderField:MOZU_X_VOL_SITE];
    [request setHTTPMethod:@"POST"];
    
    NSData *body = [[customerUserAuthInfo toJSONString] dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:body];
    
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    NSURLSessionDataTask *dataTask = nil;
    dataTask = [session dataTaskWithRequest:request
                          completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                              
                              NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                              NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                              MOZUAPIError *apiError = [MOZUResponseHelper ensureSuccessOfResponse:httpResponse JSONResult:json error:error];
                              if (apiError) {
                                  handler(nil, apiError, httpResponse);
                              } else {
                                  MOZUCustomerAuthTicket *customerAuthTicket = nil;
                                  customerAuthTicket = [[MOZUCustomerAuthTicket alloc] initWithString:json error:nil];
                                  handler(customerAuthTicket, nil, httpResponse);
                              }
                          }];
    [dataTask resume];
}

@end
