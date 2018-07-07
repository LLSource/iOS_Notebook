//
//  BBSErrorView.m
//  BBS
//
//  Created by li’Pro on 2018/4/12.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "BBSErrorView.h"

@interface BBSErrorView ()
@property (strong, nonatomic) UILabel *lblTitle;
@property (strong, nonatomic) UILabel *lblMsgSmall;
@property (strong, nonatomic) UILabel *lblMesssage;
@property (strong, nonatomic) UIImageView *imgView;

@property (strong, nonatomic) UIButton *btnReload;

@end


@implementation BBSErrorView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [self setup];
    }
    return self;
}
- (void)setup {
    self.backgroundColor = COLOR_BACKGROUND;
//    [self addSubview:self.lblTitle];
//    [self addSubview:self.lblMsgSmall];
//    [self addSubview:self.imgView];

}
- (void)removeAllSubview {
    for (UIView *v in self.subviews) {
        [v removeFromSuperview];
    }
}

#pragma -mark public

/**
 欢迎界面

 @param title 标题
 @param message 内容
 @param imageName 图片
 */
- (void)showWellcomTitle:(NSString *)title message:(NSString *)message image:(NSString *)imageName {
    [self removeAllSubview];
    [self addSubview:self.imgView];
    [self addSubview:self.lblTitle];
    [self addSubview:self.lblMsgSmall];
    
    self.imgView.image = [UIImage imageNamed:imageName];
    self.lblTitle.text = title;
    self.lblMsgSmall.text = message;
    
    
    NSUInteger margin = 15;
    [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(0);
        make.left.greaterThanOrEqualTo(@(margin));
        make.right.lessThanOrEqualTo(@(-margin));
    }];
    
    [self.lblMsgSmall mas_makeConstraints:^(MASConstraintMaker *make) { // // 19 - TOP_SAFEAREA * 0.5
        make.centerX.equalTo(self);
        make.top.equalTo(self.lblTitle.mas_bottom).offset(14);
        make.left.greaterThanOrEqualTo(@(margin));
        make.right.lessThanOrEqualTo(@(-margin));
    }];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.lblTitle.mas_top).offset(0);
    }];
}
/**
 显示空页面
 
 @param title 标题
 @param message 内容
 @param imageName 图片
 */
- (void)showEmptyTitle:(NSString *)title message:(NSString *)message image:(NSString *)imageName {
    [self removeAllSubview];
    
    [self addSubview:self.imgView];
    [self addSubview:self.lblMesssage];
    self.lblMesssage.text = message ? message : title;
    self.imgView.image = [UIImage imageNamed:imageName];
    
    NSUInteger margin = 15;
    [self.lblMesssage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(0);
        make.left.greaterThanOrEqualTo(@(margin));
        make.right.lessThanOrEqualTo(@(-margin));
    }];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.lblMesssage.mas_top).offset(0);
    }];
}

/**
 显示断网页面
 
 @param message 内容
 @param imageName 图片
 @param target target
 @param sel sel
 */
- (void)showNetErrorMessage:(NSString *)message image:(NSString *)imageName target:(id)target action:(SEL)sel {
    [self removeAllSubview];
    
    [self addSubview:self.imgView];
    [self addSubview:self.lblMesssage];
    [self addSubview:self.btnReload];
    if (target && sel) {
        [self.btnReload addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    }
    self.lblMesssage.text = message;
    self.imgView.image = [UIImage imageNamed:imageName];
    
    NSUInteger margin = 15;
    [self.lblMesssage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(0);
        make.left.greaterThanOrEqualTo(@(margin));
        make.right.lessThanOrEqualTo(@(-margin));
    }];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.lblMesssage.mas_top).offset(0);
    }];
    [self.btnReload mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(self.lblMesssage.mas_bottom).offset(75);
        make.size.mas_equalTo(CGSizeMake(140, 43));
    }];
}

/**
 显示空页面

 @param imageName 图片
 */
- (void)showEmptyImage:(NSString *)imageName {
    [self removeAllSubview];
    
    [self addSubview:self.imgView];
    self.imgView.image = [UIImage imageNamed:imageName];
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(0);
    }];
}


#pragma -mark getter
- (UILabel *)lblTitle {
    if (!_lblTitle) {
        _lblTitle = [UIView crt_lblFont:19 textColor:COLOR_BLACK];
        _lblTitle.textAlignment = NSTextAlignmentCenter;
        _lblTitle.numberOfLines = 0;
    }
    return _lblTitle;
}
- (UILabel *)lblMsgSmall {
    if (!_lblMsgSmall) {
        _lblMsgSmall  = [UIView crt_lblFont:13 textColor:COLOR_GRAY_A4];
        _lblMsgSmall.textAlignment = NSTextAlignmentCenter;
        _lblMsgSmall.numberOfLines = 0;
    }
    return _lblMsgSmall;
}
- (UILabel *)lblMesssage {
    if (!_lblMesssage) {
        _lblMesssage  = [UIView crt_lblFont:15 textColor:COLOR_GRAY_A4];
        _lblMesssage.textAlignment = NSTextAlignmentCenter;
        _lblMesssage.numberOfLines = 0;
    }
    return _lblMesssage;
}
- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
        _imgView.contentMode = UIViewContentModeCenter;
    }
    return _imgView;
}
- (UIButton *)btnReload {
    if (!_btnReload) {
        _btnReload = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnReload setTitle:@"刷新重试" forState:UIControlStateNormal];
        [_btnReload setTitleColor:COLOR_BLACK forState:UIControlStateNormal];
        _btnReload.titleLabel.font = [UIFont systemFontOfSize:17];
        _btnReload.layer.cornerRadius = 5;
        _btnReload.layer.masksToBounds = YES;
        _btnReload.layer.borderColor = COLOR_BLACK.CGColor;
        _btnReload.layer.borderWidth = 1.f;
    }
    return _btnReload;
}
@end




















