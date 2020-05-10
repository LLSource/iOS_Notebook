//
//  BBSTextView.m
//  BBS
//
//  Created by li’Pro on 2018/4/2.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "BBSTextView.h"


@implementation BBSTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    if (nil == _placeholderColor) {
        self.placeholderColor = [UIColor lightGrayColor];
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(bbs_textNotification:) name:UITextViewTextDidBeginEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(bbs_textNotification:) name:UITextViewTextDidChangeNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(bbs_textNotification:) name:UITextViewTextDidEndEditingNotification object:self];
    
    self.backgroundColor = [UIColor clearColor];
}

- (void)drawRect:(CGRect)rect {
    NSString *text = self.text;
    // 绘制 placeholder
    if ( 0 == text.length && self.placeHolder ) {
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.lineBreakMode = NSLineBreakByCharWrapping;
        
        NSDictionary *atts = @{
                               NSFontAttributeName : self.font,
                               NSForegroundColorAttributeName : self.placeholderColor,
                               NSParagraphStyleAttributeName : style
                               };
        [self.placeHolder drawInRect:CGRectInset(rect, 5.f, 5.f) withAttributes:atts];
    }
}

- (void)setPlaceHolder:(NSString *)placeholder {
    _placeHolder = placeholder.copy;
    [self setNeedsDisplay];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    [self setNeedsDisplay];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self setNeedsDisplay];
}

- (void)bbs_textNotification:(NSNotification *)notification {
    [self setNeedsDisplay];
}


@end
























