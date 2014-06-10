//
//  BaseModel.m
//  BaseModel
//
//  Created by Chris on 14-6-10.
//  Copyright (c) 2014年 Chris.Xin. All rights reserved.
//

#import "CXBaseModel.h"

@implementation CXBaseModel

- (void)setDictionary:(NSDictionary *)dictionary
{
    
    _dictionary = dictionary;
    
    NSArray *array = [dictionary allKeys];

    for (NSString *attrName in array) {
        NSString *tmpString = [attrName substringToIndex:1]; //first char
        tmpString = [tmpString uppercaseString];//first char's uppercase
        tmpString = [NSString stringWithFormat:@"set%@%@:", tmpString, [attrName substringFromIndex:1]];//Setter
        
        SEL sel = NSSelectorFromString(tmpString);
        if ([self respondsToSelector:sel]){
            NSString *string = [dictionary objectForKey:attrName];
            [self performSelector:sel withObject:string];
        }
    }
    
}

- (NSString *)description{
    
    NSMutableString *retString = [[NSMutableString alloc] initWithFormat:@"%@ = {", NSStringFromClass([self class])];
    
    NSArray *array = [_dictionary allKeys];
    
    for (NSString *attrName in array) {
        SEL sel = NSSelectorFromString(attrName);
        if ([self respondsToSelector:sel]){
            [retString appendFormat:@"%@ = %@, ", attrName, [self performSelector:sel]];
        }
    }
    
    [retString appendString:@"}"];

    
    return retString;
}

@end
