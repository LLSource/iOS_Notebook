//
//  UIView+create.m
//  BBS
//
//  Created by li’Pro on 2018/3/30.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "UIView+create.h"

@implementation UIView (create)
+ (UILabel *)crt_lblFont:(CGFloat)fontSize textColor:(UIColor *)color {
    UILabel *lbl = [[UILabel alloc] init];
    lbl.font = [UIFont systemFontOfSize:fontSize];
    lbl.textColor = color;
    return lbl;
}

+ (UIButton *)crt_btnFont:(CGFloat)fontSize target:(nullable id)target action:(nullable SEL)action {
    return [self crt_btnFont:fontSize title:nil target:target action:action];
}
+ (UIButton *)crt_btnFont:(CGFloat)fontSize title:(nullable NSString *)title target:(nullable id)target action:(nullable SEL)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    if (target && action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return btn;
}

@end










