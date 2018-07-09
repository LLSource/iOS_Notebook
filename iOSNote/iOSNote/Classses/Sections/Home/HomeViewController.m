//
//  HomeViewController.m
//  iOSNote
//
//  Created by li’s Air on 2018/7/7.
//  Copyright © 2018年 li’s Air. All rights reserved.
//

#import "HomeViewController.h"


@interface HomeViewController ()
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray<NSString *> *className = @[@"CategoryViewController", @"MemoryViewController", @"FunctionViewController"];
    [self.arrClassName addObjectsFromArray:className];
}



@end















