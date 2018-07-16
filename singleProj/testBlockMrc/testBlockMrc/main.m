//
//  main.m
//  testBlockMrc
//
//  Created by li’s Air on 2018/7/8.
//  Copyright © 2018年 li’s Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Person *p = [Person new];
        p.name = @"first Person";
        
        void(^Block)(void) = ^{
            NSLog(@"this is inner block:%@", p);
        };
        Block();
        p.bloc = Block;
        
        [p release];
        
    }
    return 0;
}
