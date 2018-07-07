//
//  NSArray+Addition.m
//  BBS
//
//  Created by li’Pro on 2018/6/21.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "NSArray+Addition.h"

@implementation NSArray (Addition)

/**
 返回倒序数组

 @return -
 */
- (NSMutableArray *)adt_reverse {
    // reverse 
    NSMutableArray *arrReverse = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj) {
            [arrReverse addObject:obj];
        }
    }];
    return arrReverse;
}
@end
