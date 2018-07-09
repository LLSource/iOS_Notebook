//
//  UISearchBar+Addition.m
//  BBS
//
//  Created by li’Pro on 2018/7/4.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "UISearchBar+Addition.h"

@implementation UISearchBar (Addition)

- (UITextField *)adt_textField {
    UITextField *textField = [self valueForKey:@"searchField"];
    return textField;
}

- (UIButton *)adt_cancelButton {
    UIButton *cancelButton = [self valueForKey:@"cancelButton"];
    return cancelButton;
}

- (void)adt_setTextFieldCornerRadius:(CGFloat)cornerRadius {
    UITextField *txt = [self adt_textField];
    txt.borderStyle = UITextBorderStyleNone;
    txt.layer.cornerRadius = cornerRadius;
    txt.layer.masksToBounds = YES;
}

- (void)adt_setCancelButtonTitle:(NSString *)title {
    if (@available(iOS 9, *)) {
        [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTitle:title];
    } else {
        [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitle:title];
    }
}

- (void)adt_setCancelColor:(UIColor *)color fontSize:(CGFloat)fontSize {
    NSDictionary *dic = @{NSForegroundColorAttributeName : color,
                          NSFontAttributeName : [UIFont systemFontOfSize:fontSize]
                          };
    
    
    if (@available(iOS 9, *)) {
        [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTitleTextAttributes:dic forState:UIControlStateNormal];
    } else {
        [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitleTextAttributes:dic forState:UIControlStateNormal];
    }
}

- (void)adt_addBottomLineWithColor:(nullable UIColor *)color {
    if (nil == color) {
        color = COLOR_LINE_EE;
    }
    UIView *line = [[UIView alloc] initWithFrame:CGRectZero];
    line.backgroundColor = color;
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.mas_equalTo(0.5);
    }];
}

@end







