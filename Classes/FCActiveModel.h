//  FCActiveModel.h
//  NovelsOnLocation
//
//  Copyright © 2013 Roderick Monje

@protocol FCActiveModel <NSObject>

+ (NSArray *)validAttributes;
+ (BOOL)validAttribute:(NSString *)name;

@end