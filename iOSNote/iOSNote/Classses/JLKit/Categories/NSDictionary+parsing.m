//
//  NSDictionary+parseing.m
//  BBS
//
//  Created by li’Pro on 2018/3/12.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "NSDictionary+parsing.h"

@implementation NSDictionary (parsing)

- (NSString *)parse_stringForKey:(NSString *)key {
    if (nil == key) {
        return nil;
    }
    id value = [self valueForKey:key];
    if ([value isKindOfClass:[NSString class]]) {
        return value;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        return ((NSNumber *)value).stringValue;
    }
    
    return nil;
}
- (NSInteger)parse_numberForKey:(NSString *)key {
    id value = [self valueForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return ((NSNumber *)value).integerValue;
    } else if ([value isKindOfClass:[NSString class]]){
        return ((NSString *)value).integerValue;
    }
    
    return 0;
}
- (BOOL)parse_boolForKey:(NSString *)key {
    id value = [self valueForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [((NSNumber *)value) boolValue];
    } else if ([value isKindOfClass:[NSString class]]){
        return [((NSString *)value) boolValue];
    }
    
    return NO;
}
- (NSDictionary *)parse_dictionaryForKey:(NSString *)key {
    id value = [self valueForKey:key];
    if ([value isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)value;
    }
    
    return nil;
}
- (NSArray *)parse_arrayForKey:(NSString *)key {
    id value = [self valueForKey:key];
    if ([value isKindOfClass:[NSArray class]]) {
        return (NSArray *)value;
    }
    
    return nil;
}
#pragma -mark 
#pragma -mark keyPath
- (NSString *)parse_stringForKeyPath:(NSString *)keyPath {
    if (nil == keyPath) {
        return nil;
    }
    id value = [self valueForKeyPath:keyPath];
    if ([value isKindOfClass:[NSString class]]) {
        return value;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        return ((NSNumber *)value).stringValue;
    }
    
    return nil;
}
- (NSInteger)parse_numberForKeyPath:(NSString *)keyPath {
    id value = [self valueForKeyPath:keyPath];
    if ([value isKindOfClass:[NSNumber class]]) {
        return ((NSNumber *)value).integerValue;
    } else if ([value isKindOfClass:[NSString class]]){
        return ((NSString *)value).integerValue;
    }
    
    return 0;
}
- (BOOL)parse_boolForKeyPath:(NSString *)keyPath {
    id value = [self valueForKeyPath:keyPath];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [((NSNumber *)value) boolValue];
    } else if ([value isKindOfClass:[NSString class]]){
        return [((NSString *)value) boolValue];
    }
    
    return NO;
}
- (NSDictionary *)parse_dictionaryForKeyPath:(NSString *)keyPath {
    id value = [self valueForKeyPath:keyPath];
    if ([value isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)value;
    }
    
    return nil;
}
- (NSArray *)parse_arrayForKeyPath:(NSString *)keyPath {
    id value = [self valueForKeyPath:keyPath];
    if ([value isKindOfClass:[NSArray class]]) {
        return (NSArray *)value;
    }
    
    return nil;
}
@end




















