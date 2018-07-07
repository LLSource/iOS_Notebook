//
//  UIView+errorTip.h
//  BBS
//
//  Created by li’Pro on 2018/5/25.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBSErrorView.h"

@interface UIView (errorTip)

@property (strong, nonatomic, readonly) BBSErrorView *errorView;

/**
 欢迎界面
 
 @param title 标题
 @param message 内容
 @param imageName 图片
 */
- (void)showWellcomTitle:(NSString *)title message:(NSString *)message image:(NSString *)imageName  ;

/**
 显示空页面
 
 @param title 标题
 @param message 内容
 */
- (void)showErrorViewTitle:(nullable NSString *)title message:(NSString *)message ;
/**
 显示空页面
 
 @param title 标题
 @param message 内容
 @param imageName 图片
 */
- (void)showErrorViewTitle:(nullable NSString *)title message:(NSString *)message image:(NSString *)imageName ;

/**
 显示空页面
 
 @param imageName 图片
 */
- (void)showEmptyImage:(NSString *)imageName ;

/**
 显示空页面
 
 @param imageName 图片名称
 @param offset 顶部偏移
 */
- (void)showEmptyImage:(NSString *)imageName topOffset:(CGFloat)offset ;

/**
 显示断网页面
 
 @param message 内容
 @param imageName 图片
 @param target target
 @param sel sel
 */
- (void)showNetErrorMessage:(nullable NSString *)message image:(nullable NSString *)imageName target:(id)target action:(SEL)sel ;


- (void)hiddenErrorView ;

@end
