//
//  UIView+create.h
//  BBS
//
//  Created by li’Pro on 2018/3/30.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (create)

/**
 创建 UILabel

 @param fontSize fontSize
 @param color color
 @return lbl
 */
+ (UILabel *)crt_lblFont:(CGFloat)fontSize textColor:(UIColor *)color ;

/**
  创建 UIButton

 @param fontSize fontSize
 @param target target
 @param action action
 @return UIButton
 */
+ (UIButton *)crt_btnFont:(CGFloat)fontSize target:(nullable id)target action:(nullable SEL)action ;

/**
 创建 UIButton

 @param fontSize fontSize
 @param title title
 @param target target
 @param action action
 @return UIButton
 */
+ (UIButton *)crt_btnFont:(CGFloat)fontSize title:(nullable NSString *)title target:(nullable id)target action:(nullable SEL)action ;

@end

NS_ASSUME_NONNULL_END










