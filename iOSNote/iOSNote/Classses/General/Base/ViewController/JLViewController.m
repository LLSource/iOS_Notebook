//
//  BBSViewController.m
//  BBS
//
//  Created by li’Pro on 2018/3/22.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "JLViewController.h"
#import "BBSErrorView.h"

@interface JLViewController ()
@end

@implementation JLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // When push into next page, next page backBarButtonItem.title is this backBarButtonItem.title
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.disableFullScreenGesture = NO;
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if (self.isBeingDismissed || self.isMovingFromParentViewController) {
        [self willDealloc];
    }
}

- (void)willDealloc {
    
}

/**
 断网提示界面，点击重试调用此方法
 */
- (void)requestDataNoNetError {
    [self hiddenErrorView];
    [BBSProgressHUD showLoadingToView:self.view];
    [self requestData];
}

#pragma -mark error tip

/**
 显示断网页面
 */
- (void)showNetError {
    [self.view showNetErrorMessage:nil image:nil target:self action:@selector(requestDataNoNetError)];
}
- (void)hiddenErrorView {
    [self.view hiddenErrorView];
}
#pragma -mark lefr right btn
- (UIBarButtonItem *)leftBarItemWithTitle:(NSString *)title {
    UIBarButtonItem *item = nil;
    if (nil != title) {
        item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(leftBarItemClicked)];
    }
    
    if (self.tabBarController) {
        self.tabBarController.navigationItem.leftBarButtonItem = item;
    } else 
        self.navigationItem.leftBarButtonItem = item;
    return item;
}
- (void)leftBarItemWithImageName:(NSString *)imgName {
    UIImage *img = [UIImage adt_imageNamed:imgName]; 
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:img style:UIBarButtonItemStylePlain target:self action:@selector(leftBarItemClicked)];
    
    if (self.tabBarController) {
        self.tabBarController.navigationItem.leftBarButtonItem = item;
    } else {
        self.navigationItem.leftBarButtonItem = item;
    }
}

- (UIBarButtonItem *)rightBarItemWithTitle:(NSString *)title {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:COLOR_HEX(0x333333) forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(rightBarItemClicked) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat width = [title textWidthWithFont:btn.titleLabel.font height:44];
    btn.frame = CGRectMake(0, 0, width, 44);
    
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -2);
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    if (self.tabBarController) {
        self.tabBarController.navigationItem.rightBarButtonItem = item;
    } else {
        self.navigationItem.rightBarButtonItem = item;
    }
    return item;
}
- (UIBarButtonItem *)rightBarItemWithImageName:(NSString *)imgName {
    UIImage *img = [[UIImage imageNamed:imgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
  
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 30, 30);
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -10);
    [btn setImage:img forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(rightBarItemClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:img style:UIBarButtonItemStylePlain target:self action:@selector(rightBarItemClicked)];
//    item.imageInsets = UIEdgeInsetsMake(0, 0, 0, -9);
    if (self.tabBarController) {
        self.tabBarController.navigationItem.rightBarButtonItem = item;
    } else {
        self.navigationItem.rightBarButtonItem = item;
    }
    return item;
}
#pragma -mark event response
- (void)leftBarItemClicked {
    [self backAction];
}
- (void)rightBarItemClicked {
    [self backAction];
//    NSAssert(nil, @"Sub instance mast be implementation method:- rightBarItemClicked");
}


@end














