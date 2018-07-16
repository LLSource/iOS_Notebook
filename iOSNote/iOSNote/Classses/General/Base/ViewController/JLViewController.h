//
//  BBSViewController.h
//  BBS
//
//  Created by li’Pro on 2018/3/22.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "BaseViewController.h"


@interface JLViewController : BaseViewController

/**
 隐藏导航栏， 默认 NO 
 */
@property (assign, nonatomic) BOOL hiddenNavigationBar;
/**
 禁用全屏侧滑手势， 默认 NO 
 */
@property (assign, nonatomic) BOOL disableFullScreenGesture;
/**
 缩小全屏侧滑手势， 默认 NO 
 */
@property (assign, nonatomic) BOOL reduceFullScreenGesture;



/**
 断网提示界面，点击重试调用此方法 
 */
- (void)requestDataNoNetError ;

- (void)willDealloc ;

/**
 欢迎界面
 
 @param title 标题
 @param message 内容
 @param imageName 图片
 */
//- (void)showWellcomTitle:(NSString *)title message:(NSString *)message image:(NSString *)imageName ;


/**
 显示断网页面
 */
- (void)showNetError ;
- (void)hiddenErrorView ;

- (UIBarButtonItem *)leftBarItemWithTitle:(NSString *)title ;
- (void)leftBarItemWithImageName:(NSString *)imgName ;
/**
 默认调用 backAction，一般情况不用重写
 */
- (void)leftBarItemClicked ;

- (UIBarButtonItem *)rightBarItemWithTitle:(NSString *)title ;
- (UIBarButtonItem *)rightBarItemWithImageName:(NSString *)imgName ;
- (void)rightBarItemClicked ;
@end
