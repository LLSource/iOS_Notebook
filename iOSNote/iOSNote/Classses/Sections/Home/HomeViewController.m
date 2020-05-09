//
//  HomeViewController.m
//  iOSNote
//
//  Created by li’s Air on 2018/7/7.
//  Copyright © 2018年 li’s Air. All rights reserved.
//

#import "HomeViewController.h"


@interface HomeViewController ()
@property (copy, nonatomic) NSString *name123_89;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray<NSString *> *className = @[@"RuntimeViewController", @"CategoryViewController", @"MemoryViewController", @"FunctionViewController", @"TestTableViewController", @"PlainListViewController", @"TestFlowLayoutViewController"];
    [self.arrClassName addObjectsFromArray:className];
    
}

@end















