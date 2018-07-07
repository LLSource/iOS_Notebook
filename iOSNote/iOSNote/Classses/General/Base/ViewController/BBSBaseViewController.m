//
//  BBSBaseViewController.m
//  BBS
//
//  Created by li’Pro on 2018/3/22.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "BBSBaseViewController.h"

@interface BBSBaseViewController ()

@end

@implementation BBSBaseViewController
- (instancetype)initWithParamter:(NSDictionary *)dicParams {
    if (self = [self init]) {
        self.dicParams = dicParams;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeAll;
    
    
    if (@available(iOS 11.0, *)) {
        
    } else {
        // Fallback on earlier versions
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
}

/**
 返回上一界面
 */
- (void)backAction {
    
}

- (void)setup {}
- (void)setupUI {}
- (void)requestData {}

#pragma -mark override
- (BOOL)prefersStatusBarHidden {
    return NO;
}

@end
