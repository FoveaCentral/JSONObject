//  InflectionsTests.m
//  JSONObject
//
//  Copyright © 2013 Roderick Monje

#import <XCTest/XCTest.h>
#import "NSString+Inflections.h"

@interface InflectionsTests : XCTestCase

@end

@implementation InflectionsTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testCamelize {
	XCTAssertEqualObjects([@"method" camelize], @"method");
	XCTAssertEqualObjects([@"method_name" camelize], @"methodName");
	XCTAssertEqualObjects([@"long_method_name" camelize], @"longMethodName");
}

- (void)testClassify {
	XCTAssertEqualObjects([@"object" classify], @"Object");
}

- (void)testSetterName {
	XCTAssertEqualObjects([@"method" setterName], @"setMethod:");
	XCTAssertEqualObjects([@"method_name" setterName], @"setMethodName:");
	XCTAssertEqualObjects([@"long_method_name" setterName], @"setLongMethodName:");
}

- (void)testStrip {
	XCTAssertEqualObjects([@" abc     " strip], @"abc");
}

- (void)testUnderscore {
	XCTAssertEqualObjects([@"fourScoreAndSevenYearsAgo" underscore], @"four_score_and_seven_years_ago");
}

@end