//
//  BBSNavigationBar.h
//  testNavTab
//
//  Created by li’Pro on 2018/3/26.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBSNavigationBar : UINavigationBar
/**
 设置导航栏标题颜色、大小
 */
+ (void)setTitleColor:(UIColor *)c fontSize:(CGFloat)fontSize ;

/**
 设置按钮的颜色、大小 
 */
+ (void)setItemTitleColor:(UIColor *)c fontSize:(CGFloat)fontSize ;

/**
 设置导航栏标背景图片，返回按钮图片
 */
+ (void)setBarImage ;

@end
