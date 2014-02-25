//
//  MOZUUrl.m
//  MozuApi
//
//  Created by Kevin Wright on 11/20/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import "MOZUURLComponents.h"

@interface MOZUURLComponents()

@property (nonatomic, assign) MOZUURLLocation location;
@property (nonatomic, assign) BOOL useSSL;

@end

@implementation MOZUURLComponents

/*
 NSString* template = @"/api/commerce/customer/accounts/{accountId}/groups/?startIndex={startIndex}&pageSize={pageSize}&sortBy={sortBy}&filter={filter}";
 NSDictionary* params = @{
 @"accountId" : @(accountId),
 @"startIndex" : startIndex,
 @"pageSize" : pageSize,
 @"sortBy" : sortBy,
 @"filter" : filter,
 };
*/

- (instancetype)initWithTemplate:(NSString*)template
                     parameters:(NSDictionary*)params
                       location:(MOZUURLLocation)location
                         useSSL:(BOOL)useSSL {
    
    if (self = [super init]) {
        _useSSL = useSSL;
        _location = location;
        self.scheme = useSSL ? @"https" : @"http";
        self.path = [MOZUURLComponents buildPathlWithTemplate:template parameters:params];
        return self;
    }
    return self;
}

+ (NSString *)buildPathlWithTemplate:(NSString *)template parameters:(NSDictionary *)params {
    // TODO : implement this
    // loop thru each param and call for formatUrl on template, paramName, and paramValue
    // create new NSURL* from filled in template and baseURL from MOZUAppAuthenticator
    return nil;
}

+ (void)formatUrl:(NSString**)url parameterName:(NSString*)paramName value:(id)value {
/*
    url = url.Replace("{" + paramName + "}", value == null ? "" : value.ToString());
    url = url.Replace("{*" + paramName + "}", value == null ? "" : value.ToString());
    var removeString = "&" + paramName + "=";
    if (value == null && url.Contains(removeString)) url = url.Replace(removeString, "");
    
    removeString = paramName + "=";
    if (value == null && url.Contains(removeString)) url = url.Replace(removeString, "");
    
    removeString = "/?";
    if (url.EndsWith(removeString)) url = url.Replace(removeString, "");
    if (url.EndsWith(removeString + "&")) url = url.Replace(removeString + "&", "");
    if (url.EndsWith("&")) url = url.Substring(0, url.Length - 1);
    
    if (url.Contains("/?&")) url = url.Replace("/?&", "/?");
    
    if (url.EndsWith("?")) url = url.Replace("?", "");
 */
    NSString* localUrl = *url;
    NSString* replacementPattern = [NSString stringWithFormat:@"{%@}", paramName];
    NSString* valueStr = @"";
    if (value != nil)
    {
        valueStr = [NSString stringWithFormat:@"%@", value];
    }
    
    localUrl = [localUrl stringByReplacingOccurrencesOfString:replacementPattern withString:valueStr];
    
    replacementPattern = [NSString stringWithFormat:@"{*%@}", paramName];
    localUrl = [localUrl stringByReplacingOccurrencesOfString:replacementPattern withString:valueStr];
    
    NSString* removeString = [NSString stringWithFormat:@"%@=", paramName];
    if (value == nil && [localUrl rangeOfString:removeString].location != NSNotFound) {
        localUrl = [localUrl stringByReplacingOccurrencesOfString:removeString withString:@""];
    }
    
    removeString = @"/?";
    if ([localUrl hasSuffix:removeString]) {
        localUrl = [localUrl stringByReplacingOccurrencesOfString:removeString withString:@""];
    }
    
    removeString = [NSString stringWithFormat:@"%@&", removeString];
    if ([localUrl hasSuffix:removeString]) {
        localUrl = [localUrl stringByReplacingOccurrencesOfString:removeString withString:@""];
    }

    if ([localUrl hasSuffix:@"&"]) {
        localUrl = [localUrl substringToIndex:[localUrl length] - 1];
    }

    if ([localUrl rangeOfString:@"/?&"].location != NSNotFound) {
        localUrl = [localUrl stringByReplacingOccurrencesOfString:@"/?&" withString:@"/?"];
    }

    if ([localUrl hasSuffix:@"?"]) {
        localUrl = [localUrl stringByReplacingOccurrencesOfString:@"?" withString:@""];
    }

    *url = localUrl;
}

@end
