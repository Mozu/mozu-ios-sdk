//
//  MOZUUrl.m
//  MozuApi
//
//  Created by Kevin Wright on 11/20/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import "MOZUURLComponents.h"
#import "MOZUAPILogger.h"

@interface MOZUURLComponents()

@property (nonatomic, assign) MOZUURLLocation location;
@property (nonatomic, assign) BOOL useSSL;
@property (nonatomic, strong) NSURLComponents *components;

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
        _components = [NSURLComponents new];
        _components.scheme = useSSL ? @"https" : @"http";
        _components.path = [MOZUURLComponents buildPathlWithTemplate:template parameters:params];
        return self;
    }
    return self;
}

+ (NSString *)buildPathlWithTemplate:(NSString *)template parameters:(NSDictionary *)parameters
{
    NSMutableString *path = [template mutableCopy];
    [parameters enumerateKeysAndObjectsUsingBlock:^(NSString *key, id obj, BOOL *stop) {
        [MOZUURLComponents formatUrl:path parameterName:key value:obj];
    }];
    
    return [path copy];
}

+ (void)formatUrl:(NSMutableString *)path parameterName:(NSString*)paramName value:(id)value {
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
    
    DDLogDebug(@"Before: %@", path);
    NSString* replacementPattern = [NSString stringWithFormat:@"{%@}", paramName];
    NSString* valueStr = value ? [NSString stringWithFormat:@"%@", value] : @"";
    
    [path replaceOccurrencesOfString:replacementPattern withString:valueStr options:0 range:NSMakeRange(0, [path length])];
    
    replacementPattern = [NSString stringWithFormat:@"{*%@}", paramName];
    [path replaceOccurrencesOfString:replacementPattern withString:valueStr options:0 range:NSMakeRange(0, [path length])];
    
    NSString* removeString = [NSString stringWithFormat:@"%@=", paramName];
    if (value == nil && [path rangeOfString:removeString].location != NSNotFound) {
        [path replaceOccurrencesOfString:removeString withString:@"" options:0 range:NSMakeRange(0, [path length])];
    }
    
    removeString = @"/?";
    if ([path hasSuffix:removeString]) {
        [path replaceOccurrencesOfString:removeString withString:@"" options:0 range:NSMakeRange(0, [path length])];
    }
    
    removeString = [NSString stringWithFormat:@"%@&", removeString];
    if ([path hasSuffix:removeString]) {
        [path replaceOccurrencesOfString:removeString withString:@"" options:0 range:NSMakeRange(0, [path length])];
    }

    if ([path hasSuffix:@"&"]) {
        [path deleteCharactersInRange:NSMakeRange([path length] - 1, 1)];
//        path = [path substringToIndex:[path length] - 1];
    }

    if ([path rangeOfString:@"/?&"].location != NSNotFound) {
        [path replaceOccurrencesOfString:@"/?&" withString:@"/?" options:0 range:NSMakeRange(0, [path length])];
    }

    if ([path hasSuffix:@"?"]) {
        [path replaceOccurrencesOfString:@"?" withString:@"" options:0 range:NSMakeRange(0, [path length])];
    }
    
    DDLogDebug(@"After: %@", path);
}

#pragma mark - NSURLComponents properties

- (NSURL *)URL
{
    return self.components.URL;
}

- (NSString *)scheme
{
    return self.components.scheme;
}

- (NSString *)host
{
    return self.components.host;
}

- (void)setHost:(NSString *)host
{
    self.components.host = host;
}

- (NSNumber *)port
{
    return self.components.port;
}

- (NSString *)path
{
    return self.components.path;
}

- (NSString *)query
{
    return self.components.query;
}

- (NSString *)fragment
{
    return self.components.fragment;
}

@end
