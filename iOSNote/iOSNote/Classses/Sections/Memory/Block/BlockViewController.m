//
//  BlockViewController.m
//  iOSNote
//
//  Created by li’s Air on 2018/7/8.
//  Copyright © 2018年 li’s Air. All rights reserved.
//

#import "BlockViewController.h"

@interface BlockViewController ()
@property (copy, nonatomic) dispatch_block_t block;
@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    __block typeof(self) ws = self;
    self.block = ^{
        NSLog(@"%@", ws);
//        NSLog(@"-=-=-=-=");
    };
    
    self.block();
}

- (void)dealloc {
    
    NSLog(@"%s", __func__);
    [super dealloc];
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










