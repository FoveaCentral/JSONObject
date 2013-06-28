//  NSObject+JSONObject.h
//  NovelsOnLocation
//
//  Copyright © 2013 Roderick Monje

#import <objc/runtime.h>
#import "FCActiveModel.h"
#import "NSString+Inflections.h"

#define kErrorMessageJSONRequest @"JSON request %@ failed: %@!"

@interface NSObject (JSONObject) <FCActiveModel>

+ (id)objectWithContentsOfJSONURLString:(NSString *)urlString;
- (NSData*)toJSON:(NSString *)keyName;

@end