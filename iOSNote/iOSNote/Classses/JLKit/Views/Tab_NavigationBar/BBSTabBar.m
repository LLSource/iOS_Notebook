//
//  BBSTabBar.m
//  BBS
//
//  Created by li’Pro on 2018/4/13.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "BBSTabBar.h"

@implementation BBSTabBar

- (void)layoutSubviews {
    [super layoutSubviews];
    
    /**** 设置所有UITabBarButton的frame ****/
    // 按钮的尺寸
    NSUInteger btnNum = 4;
    CGFloat buttonW = 48;
    CGFloat buttonH = 48;
    
    CGFloat margin = (self.width - buttonW * btnNum) / (2 * btnNum);
    CGFloat x = margin;
    // 按钮索引
    int buttonIndex = 0;
    
    for (UIView *subview in self.subviews) {
        // 过滤掉非UITabBarButton
        //   if (![@"UITabBarButton" isEqualToString:NSStringFromClass(subview.class)]) continue;
        if (subview.class != NSClassFromString(@"UITabBarButton")) continue;
        
        // 设置frame
        subview.frame = CGRectMake(x, 6, buttonW, buttonH);   
        // 增加索引
        x += (margin * 2 + buttonW);
        buttonIndex++;
    }
}


@end
