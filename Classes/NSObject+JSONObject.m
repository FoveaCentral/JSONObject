//  NSObject+JSONObject.m
//  JSONObject
//
//  Copyright © 2013 Roderick Monje

#import "NSObject+JSONObject.h"

@implementation NSObject (JSONObject)

+ (id)objectWithContentsOfJSONURLString:(NSString *)urlString {
    __autoreleasing NSError* error = nil;
	id result;
	@try {
		result = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]]
												 options:kNilOptions
												   error:&error];
	} @catch (NSException *exception) {
		NSLog(kErrorMessageJSONRequest, urlString, exception.description);
		return nil;
	}
    return (error != nil) ? nil : result;
}

- (NSData*)toJSON:(NSString *)keyName {
    NSError* error = nil;
	NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[self dictionaryWithValuesForKeys:[self.class attributes]] forKey:keyName];
    id result = [NSJSONSerialization dataWithJSONObject:dictionary
												options:kNilOptions
												  error:&error];
    return (error != nil) ? nil : result;
}

#pragma mark - NSObject
- (NSString *)description {
	return [[NSString alloc] initWithData:[self toJSON:[self.class description]] encoding:NSUTF8StringEncoding];
}

@end