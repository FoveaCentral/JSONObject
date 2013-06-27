//  NSObject+JSONObject.m
//  NovelsOnLocation
//
//  Copyright © 2013 Roderick Monje

#import "NSObject+JSONObject.h"

@implementation NSObject (JSONObject)

+ (NSArray*)attributes {
	NSMutableArray *attributes = [[NSMutableArray alloc] init];
	unsigned int outCount, i;
	objc_property_t *obj_properties = class_copyPropertyList([self class], &outCount);
	for (i = 0; i < outCount; i++) {
		NSString *property = [NSString stringWithUTF8String:property_getName(obj_properties[i])];
		if ([self.class validAttribute:property])
			[attributes addObject:property];
	}
	return attributes;
}

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

#pragma mark - FCActiveModel

+ (BOOL)validAttribute:(NSString *)name {
	return [self.validAttributes containsObject:[name camelCase]];
}

@end