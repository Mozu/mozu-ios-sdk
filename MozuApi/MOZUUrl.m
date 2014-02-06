//
//  MOZUUrl.m
//  MozuApi
//
//  Created by Kevin Wright on 11/20/13.
//  Copyright (c) 2013 Volusion. All rights reserved.
//

#import "MOZUUrl.h"

@implementation MOZUUrl

-(id)initWithUrl:(NSString*)url andLocation:(MOZUUrlLocation)location andUseSSL:(BOOL)useSSL{
    if (self = [super init]) {
        self.url = url;
        self.location = location;
        self.useSSL = useSSL;
        return self;
    }
    else {
        return nil;
    }
}

+(void)formatUrl: (NSString**)url withParamName: (NSString*)paramName andValue: (id)value {
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
