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

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)ensureCustomerAuthTicket:(MOZUCustomerAuthTicket *)customerAuthTicket
completionHandler:(void(^)(MOZUCustomerAuthTicket *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler {
    
    NSDate *refreshTime = [NSDate dateWithTimeInterval:-180 sinceDate:customerAuthTicket.accessTokenExpiration];
    if ([refreshTime timeIntervalSinceNow] < 0) {
        [self refreshCustomerAuthTicket:customerAuthTicket completionHandler:handler];
    } else {
        handler(customerAuthTicket, nil, nil);
    }
}

- (void)refreshCustomerAuthTicket:(MOZUCustomerAuthTicket *)customerAuthTicket
               completionHandler:(void(^)(MOZUCustomerAuthTicket *result, MOZUAPIError *error, NSHTTPURLResponse *response))handler {
    
    NSString *refreshToken = customerAuthTicket.refreshToken;
    MOZUURLComponents *components = [MOZUCustomerAuthTicketURLComponents URLComponentsForRefreshUserAuthTicketOperationWithRefreshToken:refreshToken responseFields:nil];
    components.host = self.host;
    components.useSSL = YES;
    NSURL *url = components.URL;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    [request setValue:self.apiVersion forHTTPHeaderField:MOZU_X_VOL_VERSION];
    [request setValue:self.appToken forHTTPHeaderField:MOZU_X_VOL_APP_CLAIMS];
    [request setValue:self.tenant forHTTPHeaderField:MOZU_X_VOL_TENANT];
    [request setValue:self.site forHTTPHeaderField:MOZU_X_VOL_SITE];
    [request setHTTPMethod:@"PUT"];
    
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

- (void)createCustomerAuthTicketWithCustomerUserAuthInfo:(MOZUCustomerUserAuthInfo *)customerUserAuthInfo
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
