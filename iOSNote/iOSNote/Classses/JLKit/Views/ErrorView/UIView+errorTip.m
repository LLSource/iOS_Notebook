//
//  UIView+errorTip.m
//  BBS
//
//  Created by li’Pro on 2018/5/25.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "UIView+errorTip.h"
#import <objc/runtime.h>

static char *kErrorViewKey = nil;

@implementation UIView (errorTip)

/**
 欢迎界面
 
 @param title 标题
 @param message 内容
 @param imageName 图片
 */
- (void)showWellcomTitle:(NSString *)title message:(NSString *)message image:(NSString *)imageName  {
    [self.errorView showWellcomTitle:title message:message image:imageName];
} 

/**
 显示空页面
 
 @param title 标题
 @param message 内容
 */
- (void)showErrorViewTitle:(nullable NSString *)title message:(NSString *)message {
    [self.errorView showEmptyTitle:title message:message image:@"tip_bg_no_empty"];
}
/**
 显示空页面
 
 @param title 标题
 @param message 内容
 @param imageName 图片
 */
- (void)showErrorViewTitle:(nullable NSString *)title message:(NSString *)message image:(NSString *)imageName {
    [self.errorView showEmptyTitle:title message:message image:imageName];
}

/**
 显示空页面
 
 @param imageName 图片
 */
- (void)showEmptyImage:(NSString *)imageName {
    [self.errorView showEmptyImage:imageName];
    [self.errorView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.offset(-TOP_SAFEAREA * 0.5);
    }];
}


/**
 显示空页面

 @param imageName 图片名称
 @param offset 顶部偏移
 */
- (void) showEmptyImage:(NSString *)imageName topOffset:(CGFloat)offset {
    [self.errorView showEmptyImage:imageName];
    [self.errorView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.offset(offset);
    }];
}


/**
 显示断网页面
 
 @param message 内容
 @param imageName 图片
 @param target target
 @param sel sel
 */
- (void)showNetErrorMessage:(nullable NSString *)message image:(nullable NSString *)imageName target:(id)target action:(SEL)sel {
    if (nil == message) {
        message = @"数据加载失败，请重新检查网络";
    }
    if (imageName == nil) {
        imageName = @"tip_bg_no_net";    
    }
    [self.errorView showNetErrorMessage:message image:imageName target:target action:sel];
}




- (void)hiddenErrorView {
    BBSErrorView *errorView = objc_getAssociatedObject(self, &kErrorViewKey);
    if (errorView) {
        [errorView removeFromSuperview];
        errorView = nil;
        objc_setAssociatedObject(self, &kErrorViewKey, errorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}


#pragma -mark getter
- (BBSErrorView *)errorView {
    BBSErrorView *errorView = objc_getAssociatedObject(self, &kErrorViewKey);
    if (nil == errorView) {
        errorView = [[BBSErrorView alloc] init];
        [self addSubview:errorView];
        
        [errorView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.offset(0);
            make.width.height.equalTo(self);
        }];
        
        objc_setAssociatedObject(self, &kErrorViewKey, errorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return errorView;
}
@end
