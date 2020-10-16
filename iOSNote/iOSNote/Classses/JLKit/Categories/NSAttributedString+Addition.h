//
//  NSAttributedString+Addition.h
//  iOSNote
//
//  Created by 吴贞利 on 2020/10/16.
//  Copyright © 2020 li’s Air. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (Addition)

/// 计算文字行数。
/// @param width 最大宽度。
- (NSUInteger)adt_linesCountWithWidth:(CGFloat)width;

/// 计算文字高度。
/// @param width 最大宽度。
- (CGFloat)adt_textHeightWithWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
