//
//  MemoryViewController.m
//  iOSNote
//
//  Created by li’s Air on 2018/7/7.
//  Copyright © 2018年 li’s Air. All rights reserved.
//

#import "MemoryViewController.h"

@interface MemoryViewController ()
@property (retain, nonatomic) void(^attBlock)(void);
@end

@implementation MemoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    int a = 12;
    void(^block)(void) = ^{
        NSLog(@"block inner a:%d", a);
    };
    // not capture a <__NSGlobalBlock__: 0x10bdd06f0>
    
    NSLog(@"block:%@", block); // capture a <__NSMallocBlock__: 0x600000450c80>
    self.attBlock = block;
    NSLog(@"self.attBlock:%@", self.attBlock);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
