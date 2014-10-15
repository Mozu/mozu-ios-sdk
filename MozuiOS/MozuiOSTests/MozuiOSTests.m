//
//  MozuiOSTests.m
//  MozuiOSTests
//
//  Created by Noel Artiles on 2/19/14.
//  Copyright (c) 2014 Volusion. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MOZUClient.h"
#import "MOZUAdminProductPropertyValue.h"
#import "MOZUAPILogger.h"

@interface MozuiOSTests : XCTestCase

@end

@implementation MozuiOSTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (NSString *)loadFile:(NSString *)name
{
    NSBundle *unitTestBundle = [NSBundle bundleForClass:[self class]];
    NSString *pathForFile = [unitTestBundle pathForResource:name ofType:nil];
    NSString *retVal = [[NSString alloc] initWithContentsOfFile:pathForFile encoding:NSUTF8StringEncoding error:nil];
    return retVal;
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testJSONArrayToNSObjectCreation
{
    NSString *JSONString = [self loadFile:@"MOZUAdminProductPropertyValue.txt"];
    MOZUClientJSONParserBlock JSONParser = ^(NSString *JSONResult) {
        JSONModelError *JSONError = nil;
        JSONModel *model = [[MOZUAdminProductPropertyValue alloc] initWithString:JSONResult error:&JSONError];
        if (!model) {
            DDLogError(@"%@", JSONError.localizedDescription);
        }
        return model;
    };
    id result = JSONParser(JSONString);
    id arrayResult = [result valueForKey:@"value"];
    XCTAssertTrue([arrayResult isKindOfClass:[NSArray class]], @"Property is not an array.");
}

@end
