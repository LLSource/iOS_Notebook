//
//  Person.m
//  testBlockMrc
//
//  Created by li’s Air on 2018/7/8.
//  Copyright © 2018年 li’s Air. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)dealloc
{
    NSLog(@"Person dealloc:%@", self.name);
}
@end
