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

@implementation MOZUURLComponents


- (instancetype)initWithTemplate:(NSString*)template
                     parameters:(NSDictionary*)params
                       location:(MOZUURLLocation)location
                         useSSL:(BOOL)useSSL
{
    
    if (self = [super init]) {
        _useSSL = useSSL;
        _location = location;
        _components = [NSURLComponents new];
        _components.scheme = useSSL ? @"https" : @"http";
        
        /*
        template = @"/api/commerce/customer/accounts/{accountId}/{startIndex}/?startIndex={startIndex}&pageSize={pageSize}&sortBy={sortBy}&filter={filter}";
        params = @{
                   @"accountId" : @"",
                   @"startIndex" : @(2),
                   @"pageSize" : @"",
                   @"sortBy" : @"",
                   @"filter" : @"",
                   };
        */
        
        if (template && ![template isEqualToString:@""]) {
            _components.path = [MOZUURLComponents pathWithTemplate:template parameters:params];
            _components.query = [MOZUURLComponents queryWithTemplate:template parameters:params];
        }
        return self;
    }
    return self;
}

+ (NSString *)pathWithTemplate:(NSString *)template parameters:(NSDictionary *)parameters
{
    NSString *path = nil;
    NSRange pathRange = [template rangeOfString:@"?"];
    if (pathRange.location != NSNotFound) {
        path = [template substringWithRange:NSMakeRange(0, pathRange.location)];
    } else if ([template hasPrefix:@"/"]) {
        path = template;
    } else {
        DDLogWarn(@"Unexpected template: %@", template);
    }
    
    if (path) {
        NSMutableString *mutablePath = [path mutableCopy];
        [parameters enumerateKeysAndObjectsUsingBlock:^(NSString *key, id obj, BOOL *stop) {
            [MOZUURLComponents substituteValue:obj parameterName:key string:mutablePath];
            [[self class] postProcessPath:mutablePath];
        }];
        path = [mutablePath copy];
    }
    
    return path;
}

+ (NSString *)queryWithTemplate:(NSString *)template parameters:(NSDictionary *)parameters
{
    NSString *query = nil;
    NSRange queryRange = [template rangeOfString:@"/?"];
    if (queryRange.location != NSNotFound) {
        NSUInteger queryStart = queryRange.location + queryRange.length;
        query = [template substringWithRange:NSMakeRange(queryStart, template.length - queryStart)];
    }
    
    if (query) {
        NSMutableString *mutableQuery = [query mutableCopy];
        [parameters enumerateKeysAndObjectsUsingBlock:^(NSString *key, id obj, BOOL *stop) {
            [MOZUURLComponents substituteValue:obj parameterName:key string:mutableQuery];
            [[self class] postProcessQuery:mutableQuery];
        }];
        query = [mutableQuery copy];
    }
    
    return query;
}

+ (void)substituteValue:(id)value parameterName:(NSString *)paramName string:(NSMutableString *)string
{
    DDLogDebug(@"Before: %@", string);
    NSString* replacementPattern = [NSString stringWithFormat:@"{%@}", paramName];
    NSString* valueStr = value ? [NSString stringWithFormat:@"%@", value] : @"";
    
    [string replaceOccurrencesOfString:replacementPattern withString:valueStr options:0 range:NSMakeRange(0, [string length])];
    
    replacementPattern = [NSString stringWithFormat:@"{*%@}", paramName];
    [string replaceOccurrencesOfString:replacementPattern withString:valueStr options:0 range:NSMakeRange(0, [string length])];
    
    // Removes parameters with no values (i.e. empty strings).
    NSString* removeString = [NSString stringWithFormat:@"%@=", paramName];
    if ([value isEqual:@""] && [string rangeOfString:removeString].location != NSNotFound) {
        [string replaceOccurrencesOfString:removeString withString:@"" options:0 range:NSMakeRange(0, [string length])];
    }
    
    DDLogDebug(@"After: %@", string);
}

+ (void)postProcessPath:(NSMutableString *)path
{
    NSString* removeString = nil;
    
    // Remove //
    removeString = @"//";
    [path replaceOccurrencesOfString:removeString withString:@"/" options:0 range:NSMakeRange(0, [path length])];
}

+ (void)postProcessQuery:(NSMutableString *)query
{
    NSString* removeString = nil;
    
    // Remove duplicate &&
    removeString = @"&&";
    [query replaceOccurrencesOfString:removeString withString:@"&" options:0 range:NSMakeRange(0, [query length])];
    
    // Remove & from beginning
    if ([query hasPrefix:@"&"]) {
        [query deleteCharactersInRange:NSMakeRange(0, 1)];
    }
    
    // Remove & from end. (If we removed last parmeter)
    if ([query hasSuffix:@"&"]) {
        [query deleteCharactersInRange:NSMakeRange([query length] - 1, 1)];
    }
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
