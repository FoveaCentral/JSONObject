//  NSObject+JSONObject.h
//  JSONObject
//
//  Copyright © 2013 Roderick Monje

#import <objc/runtime.h>
#import "NSString+Inflections.h"

#define kErrorMessageJSONRequest @"JSON request %@ failed: %@!"

@interface NSObject (JSONObject)

+ (NSArray *)attributes;
+ (id)objectWithContentsOfJSONURLString:(NSString *)urlString;
- (NSData *)toJSON:(NSString *)keyName;
- (NSString *)toString;

@end