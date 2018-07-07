//
//  BBSNavigationBar.m
//  testNavTab
//
//  Created by li’Pro on 2018/3/26.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "BBSNavigationBar.h"

@implementation BBSNavigationBar

/**
 设置导航栏标题颜色、大小
 */
+ (void)setTitleColor:(UIColor *)c fontSize:(CGFloat)fontSize {
    BBSNavigationBar *bar = [BBSNavigationBar appearanceWhenContainedIn:[UINavigationController class], NULL];
    [bar setTitleTextAttributes:@{
                                  NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Bold" size:fontSize],
                                  NSForegroundColorAttributeName : c
                                  }];
}

/**
 设置按钮的颜色、大小 
 */
+ (void)setItemTitleColor:(UIColor *)c fontSize:(CGFloat)fontSize {
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:[BBSNavigationBar class], nil];
    NSDictionary *dicAtts = @{
                              NSFontAttributeName : [UIFont systemFontOfSize:fontSize],
                              NSForegroundColorAttributeName : c
                              };
    [item setTitleTextAttributes:dicAtts forState:UIControlStateNormal];
    [item setTitleTextAttributes:dicAtts forState:UIControlStateHighlighted];
    [item setTitleTextAttributes:dicAtts forState:UIControlStateDisabled];
    
    [item setTitleTextAttributes:@{
                                   NSFontAttributeName : [UIFont systemFontOfSize:fontSize],
                                   NSForegroundColorAttributeName : COLOR_HEX(0xa4a4a4)
                                   } forState:UIControlStateHighlighted];
}

/**
 设置导航栏标背景图片，返回按钮图片
 */
+ (void)setBarImage {
    BBSNavigationBar *bar = [BBSNavigationBar appearanceWhenContainedIn:[UINavigationController class], NULL];
   // 
    UIImage *imgBg = [UIImage adt_imageWithColor:[[UIColor whiteColor] colorWithAlphaComponent:0.95]];//[UIImage imageNamed:@"navigationbar_bg_64"];
//    CGSize size = imgBg.size;
//    imgBg = [imgBg resizableImageWithCapInsets:UIEdgeInsetsMake(size.height * 0.5 , size.width * -.5, size.height * 0.5 - 1, size.width * 0.5 -1)];
    [bar setBackgroundImage:imgBg forBarMetrics:UIBarMetricsDefault];
//    bar.translucent = YES;
    //    navigation_line
    
    UIImage *imgLine = [UIImage adt_imageWithColor:COLOR_HEX(0xdedede)];
    [bar setShadowImage:imgLine];
    
    // 返回按钮 nav_btn_back_normal@2x
    UIImage *imgBack = [UIImage adt_imageNamed:@"nav_btn_back_normal"];
    [bar setBackIndicatorImage:imgBack];
    [bar setBackIndicatorTransitionMaskImage:imgBack];
}

@end












