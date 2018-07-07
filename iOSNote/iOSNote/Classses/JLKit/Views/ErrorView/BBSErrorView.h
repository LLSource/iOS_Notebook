//
//  BBSErrorView.h
//  BBS
//
//  Created by li’Pro on 2018/4/12.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBSErrorView : UIView
/**
 欢迎界面
 
 @param title 标题
 @param message 内容
 @param imageName 图片
 */
- (void)showWellcomTitle:(NSString *)title message:(NSString *)message image:(NSString *)imageName ;

/**
 显示空页面
 
 @param title 标题
 @param message 内容
 @param imageName 图片
 */
- (void)showEmptyTitle:(NSString *)title message:(NSString *)message image:(NSString *)imageName ;
/**
 显示空页面
 
 @param imageName 图片
 */
- (void)showEmptyImage:(NSString *)imageName ;

/**
 显示断网页面
 
 @param message 内容
 @param imageName 图片
 @param target target
 @param sel sel
 */
- (void)showNetErrorMessage:(NSString *)message image:(NSString *)imageName target:(id)target action:(SEL)sel ;

@end
