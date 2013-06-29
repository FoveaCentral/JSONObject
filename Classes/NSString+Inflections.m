//  NSString+Inflections.m
//  JSONObject
//
//  Copyright © 2013 Roderick Monje
//  Adapted from https://gist.github.com/jdriscoll/3828685 on 4/9/13.

#import "NSString+Inflections.h"

@implementation NSString(Inflections)

- (NSString *)camelize {
    NSArray *components = [self componentsSeparatedByString:kUnderscore];
    NSMutableString *output = [NSMutableString string];

    for (NSUInteger i = 0; i < components.count; i++) {
        if (i == 0) {
            [output appendString:components[i]];
        } else {
            [output appendString:[components[i] capitalizedString]];
        }
    }

    return [NSString stringWithString:output];
}

- (NSString *)classify {
    if (![self length]) {
        return [NSString string];
    }
    NSString *initial = [[self substringToIndex:1] uppercaseString];
    NSString *restOfString = [self substringFromIndex:1];
    return [initial stringByAppendingString:restOfString];
}

- (NSString *)setterName {
	return [NSString stringWithFormat:kSetterNameObjectiveC, [[self camelize] classify]];
}

- (NSString *)strip {
	NSCharacterSet *whitespaces = [NSCharacterSet whitespaceCharacterSet];
	NSPredicate *noEmptyStrings = [NSPredicate predicateWithFormat:@"SELF != ''"];
	NSArray *parts = [self componentsSeparatedByCharactersInSet:whitespaces];
	NSArray *filteredArray = [parts filteredArrayUsingPredicate:noEmptyStrings];
	return [filteredArray componentsJoinedByString:kSpace];
}

- (NSString *)underscore {
    NSScanner *scanner = [NSScanner scannerWithString:self];
    scanner.caseSensitive = YES;

    NSCharacterSet *uppercase = [NSCharacterSet uppercaseLetterCharacterSet];
    NSCharacterSet *lowercase = [NSCharacterSet lowercaseLetterCharacterSet];

    NSString *buffer = nil;
    NSMutableString *output = [NSMutableString string];

    while (scanner.isAtEnd == NO) {

        if ([scanner scanCharactersFromSet:uppercase intoString:&buffer]) {
            [output appendString:[buffer lowercaseString]];
        }

        if ([scanner scanCharactersFromSet:lowercase intoString:&buffer]) {
            [output appendString:buffer];
            if (!scanner.isAtEnd)
                [output appendString:kUnderscore];
        }
    }

    return [NSString stringWithString:output];
}

@end