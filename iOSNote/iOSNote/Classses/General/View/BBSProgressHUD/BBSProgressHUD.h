//
//  BBSProgressHUD.h
//  BBS
//
//  Created by li’Pro on 2018/3/21.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 提示文字显示时长
FOUNDATION_EXPORT CGFloat const kTipDuration;

@interface BBSProgressHUD : NSObject
+ (void)showToView:(UIView *)view text:(NSString *)text ;
+ (void)showLoadingToView:(UIView *)view ;
+ (void)showLoadingToView:(UIView *)view text:(NSString *)text ;

+ (BOOL)hideHUDForView:(UIView *)view ;
+ (BOOL)hideHUDForView:(UIView *)view animated:(BOOL)animated ;
@end
