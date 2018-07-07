//
//  UITabBar+badge.h
//  BBS
//
//  Created by li’Pro on 2018/4/25.
//  Copyright © 2018年 wzl. All rights reserved.
//  https://blog.csdn.net/lilinoscar/article/details/47103747

#import <UIKit/UIKit.h>

@interface UITabBar (badge)

- (void)showBadgeOnItemIndex:(int)index;   //显示小红点  

- (void)hideBadgeOnItemIndex:(int)index; //隐藏小红点

@end
