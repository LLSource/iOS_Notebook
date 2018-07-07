//
//  NSDictionary+parseing.h
//  BBS
//
//  Created by li’Pro on 2018/3/12.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (parsing)
/** key */
- (NSString *)parse_stringForKey:(NSString *)key ;
- (NSInteger)parse_numberForKey:(NSString *)key ;
- (BOOL)parse_boolForKey:(NSString *)key ;
- (NSDictionary *)parse_dictionaryForKey:(NSString *)key ;
- (NSArray *)parse_arrayForKey:(NSString *)key ;

/** keyPath */
- (NSString *)parse_stringForKeyPath:(NSString *)keyPath ;
- (NSInteger)parse_numberForKeyPath:(NSString *)keyPath ;
- (BOOL)parse_boolForKeyPath:(NSString *)keyPath ;
- (NSDictionary *)parse_dictionaryForKeyPath:(NSString *)keyPath ;
- (NSArray *)parse_arrayForKeyPath:(NSString *)keyPath ;
@end
