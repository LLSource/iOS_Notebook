//
//  UISearchBar+Addition.h
//  BBS
//
//  Created by li’Pro on 2018/7/4.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/*
 barTintColor = COLOR_WHITE;// 整个 seaerchBar 背景色
 */

@interface UISearchBar (Addition)

- (UITextField *)adt_textField ;

- (UIButton *)adt_cancelButton ;

- (void)adt_setTextFieldCornerRadius:(CGFloat)cornerRadius ;
- (void)adt_setCancelButtonTitle:(NSString *)title ;
- (void)adt_setCancelColor:(UIColor *)color fontSize:(CGFloat)fontSize ;

- (void)adt_addBottomLineWithColor:(nullable UIColor *)color ;

@end


NS_ASSUME_NONNULL_END
