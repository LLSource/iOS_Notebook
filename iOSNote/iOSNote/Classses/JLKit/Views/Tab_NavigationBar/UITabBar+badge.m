//
//  UITabBar+badge.m
//  BBS
//
//  Created by li’Pro on 2018/4/25.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "UITabBar+badge.h"
#import <objc/runtime.h>
#define TabbarItemNums 4.0    //tabbar的数量 如果是5个设置为5.0  

@implementation UITabBar (badge)
//显示小红点  
- (void)showBadgeOnItemIndex:(int)index{    
    [self badgeViewOfIndex:index].hidden = NO;
}
//隐藏小红点  
- (void)hideBadgeOnItemIndex:(int)index{  
    [self badgeViewOfIndex:index].hidden = YES;
} 


- (UIView *)badgeViewOfIndex:(int)index {
    NSMutableDictionary *dicBadge = objc_getAssociatedObject(self, _cmd);
    if (nil == dicBadge) {
        dicBadge = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, _cmd, dicBadge, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    UIImageView *badgeView = [dicBadge objectForKey:@(index).stringValue];
    if (badgeView == nil) {
        //新建小红点
        CGFloat width = 9;
        badgeView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tab_bg_red_point"]];
        badgeView.tag = 888 + index;
        CGRect tabFrame = self.frame;
        
        //确定小红点的位置
        float percentX = (index +0.6) / TabbarItemNums;
        CGFloat x = ceilf(percentX * tabFrame.size.width) - 3;
        CGFloat y = 8;
        badgeView.frame = CGRectMake(x, y, width, width);
        [self addSubview:badgeView];
        badgeView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
        
        [dicBadge setObject:badgeView forKey:@(index).stringValue];
    }
    return badgeView;
}

@end
