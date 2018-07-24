//
//  TestViewController.m
//  iOSNote
//
//  Created by li’s Air on 2018/7/24.
//  Copyright © 2018年 li’s Air. All rights reserved.
//

#import "TestViewController.h"

#define kTestUD @"TestViewController_testUD"

@interface TestViewController ()

@end


@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    NSLog(@"obj:%@|", [[NSUserDefaults standardUserDefaults] objectForKey:kTestUD]);
    
    [[NSUserDefaults standardUserDefaults] setObject:@"testUser Default aaa" forKey:@"aaaKey"];
    [[NSUserDefaults standardUserDefaults]  synchronize];
    NSMutableArray *arr = @[].mutableCopy;
    [arr addObject:nil];
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


