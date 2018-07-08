//
//  Person.h
//  testBlockMrc
//
//  Created by li’s Air on 2018/7/8.
//  Copyright © 2018年 li’s Air. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (copy, nonatomic) NSString *name;

@property (copy, nonatomic) dispatch_block_t bloc;
@end
