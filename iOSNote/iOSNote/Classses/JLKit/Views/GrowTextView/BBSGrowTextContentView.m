//
//  BBSGrowTextContentView.m
//  BBS
//
//  Created by li’Pro on 2018/6/19.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "BBSGrowTextContentView.h"


@interface BBSGrowTextContentView ()
@property (weak, nonatomic) id<BBSGrowTextContentViewDataSource> dataSource;
@end


@implementation BBSGrowTextContentView

+ (instancetype)growTextContentWiewWithDataSource:(id<BBSGrowTextContentViewDataSource>)dataSource {
    BBSGrowTextContentView *v = [[BBSGrowTextContentView alloc] initWithFrame:CGRectZero];
    v.dataSource = dataSource;
    [v setup];
    return v;
}

- (void)setup {
    CGFloat minHeight = [self textViewContentHeight];
    NSUInteger lineNumber = 4;
    if (self.dataSource && [self.dataSource lineNumbersOfInputView]) {
        lineNumber = [self.dataSource lineNumbersOfInputView];
    }
    CGFloat maxHeight = minHeight * lineNumber;
    
    self.backgroundColor = self.textView.backgroundColor;
    
    NSUInteger preferredHeight = 50;
    if (self.dataSource && [self.dataSource preferredHeightOfInputView]) {
        preferredHeight = [self.dataSource preferredHeightOfInputView];
    }
    if (preferredHeight < minHeight) {
        preferredHeight = minHeight;
    }
    CGFloat topMargin = (preferredHeight - minHeight) * 0.5;
    
    [self addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.bottom.offset(-topMargin);
        make.top.offset(topMargin);
        make.height.mas_equalTo(minHeight);
        make.height.mas_greaterThanOrEqualTo(minHeight);
        make.height.mas_lessThanOrEqualTo(maxHeight);
    }];
    [self.textView associateConstraints];
}

- (CGFloat)textViewContentHeight {
    UITextView *txv = self.textView;
    
    NSUInteger intHeight = (NSUInteger)(txv.font.lineHeight * 1000 + txv.textContainerInset.top + txv.textContainerInset.bottom);
    return intHeight / 1000.f;
}

#pragma -mark setter 
- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [super setBackgroundColor:backgroundColor];
    [self.textView setBackgroundColor:backgroundColor];
}
#pragma -mark getter
- (BBSGrowTextView *)textView {
    if (!_textView) {
        BBSGrowTextView *txv = [[BBSGrowTextView alloc] init];
        UIFont *font = [UIFont systemFontOfSize:18];
        if (self.dataSource && [self.dataSource respondsToSelector:@selector(textFontOfInputView)]) {
            font = [self.dataSource textFontOfInputView];
        }
        txv.font = font;
        txv.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
        txv.placeHolder = @"请输入内容";
        
        txv.textColor = [UIColor blackColor];
        txv.backgroundColor = [UIColor whiteColor];
        _textView = txv;
    }
    return _textView;
}
@end
