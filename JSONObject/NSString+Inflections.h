//  NSString+Inflections.h
//  NovelsOnLocation
//
//  Adapted from https://gist.github.com/jdriscoll/3828685 on 4/9/13.

#define kSetterNameObjectiveC @"set%@:"
#define kSpace @" "
#define kUnderscore @"_"

@interface NSString(Inflections)

- (NSString *)camelCase;
- (NSString *)classify;
- (NSString *)setterName;
- (NSString *)strip;
- (NSString *)underscore;

@end