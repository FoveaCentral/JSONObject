//  JSONObjectTests.m
//  JSONObjectTests
//
//  Copyright © 2013 Roderick Monje

#import <XCTest/XCTest.h>
#import "NSObject+JSONObject.h"

@interface JSONObjectTests : XCTestCase
@end

@interface Dog : NSObject

@property (nonatomic, weak) NSString *age;
@property (nonatomic, weak) NSString *name;

@end

@implementation Dog

+ (NSArray*)exposedAttributes {
	return @[@"age", @"name"];
}
@end

@implementation JSONObjectTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testObjectWithContentsOfJSONURLString {
	NSDictionary *zuck = [NSDictionary objectWithContentsOfJSONURLString:@"http://graph.facebook.com/4"];
	XCTAssertTrue([[zuck objectForKey:@"name"] isEqualToString:@"Mark Zuckerberg"]);
}

- (void)testToJSON {
	Dog *fido = [Dog alloc];
	[fido setName:@"Fido"];
	[fido setAge:@"1"];
    XCTAssertTrue([fido.description isEqualToString:@"{\"Dog\":{\"age\":\"1\",\"name\":\"Fido\"}}"]);
}

@end