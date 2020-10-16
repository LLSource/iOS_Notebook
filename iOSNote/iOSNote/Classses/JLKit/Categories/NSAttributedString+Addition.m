//
//  NSAttributedString+Addition.m
//  iOSNote
//
//  Created by 吴贞利 on 2020/10/16.
//  Copyright © 2020 li’s Air. All rights reserved.
//

#import "NSAttributedString+Addition.h"

@implementation NSAttributedString (Addition)

/// 计算文字行数。
/// @param width 最大宽度。
- (NSUInteger)adt_linesCountWithWidth:(CGFloat)width {
    NSDictionary *att = [self attributesAtIndex:0 effectiveRange:nil];
    UIFont *font = att[NSFontAttributeName];
    NSAssert(font, @"NSAttributedString+KSHeight  - (NSUInteger)adt_linesCountWithWidth: font not be nil");
    
    NSParagraphStyle *paragraphStyle = att[NSParagraphStyleAttributeName];
    CGFloat lineSpacing = paragraphStyle.lineSpacing;
    
    CGFloat textHeight = [self adt_textHeightWithWidth:width];
    NSInteger linesCount = (textHeight + lineSpacing + 0.01) / (MAX(1, font.lineHeight + lineSpacing));
    return linesCount;
}

/// 计算文字高度。
/// @param width 最大宽度。
- (CGFloat)adt_textHeightWithWidth:(CGFloat)width {
    CGSize size = CGSizeMake(width, CGFLOAT_MAX);
    
    NSDictionary *att = [self attributesAtIndex:0 effectiveRange:nil];
    UIFont *font = att[NSFontAttributeName];
    NSAssert(font, @"NSAttributedString+KSHeight  - (CGFloat)adt_textHeightWithWidth: font not be nil");
    
    NSMutableParagraphStyle *paragraphStyle = [att[NSParagraphStyleAttributeName] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSMutableAttributedString *attributedString = self.mutableCopy;
    if (paragraphStyle) {
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.string.length)];
    }
    
    CGRect frame = [attributedString boundingRectWithSize:size
                                                  options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                  context:nil];
    return frame.size.height;
}

@end
