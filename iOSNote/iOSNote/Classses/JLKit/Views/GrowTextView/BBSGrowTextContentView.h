//
//  BBSGrowTextContentView.h
//  BBS
//
//  Created by li’Pro on 2018/6/19.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBSGrowTextView.h"

@protocol BBSGrowTextContentViewDataSource<NSObject>

- (UIFont *)textFontOfInputView ;

- (NSUInteger)preferredHeightOfInputView ;

- (NSUInteger)lineNumbersOfInputView ;

@end

@interface BBSGrowTextContentView : UIView

+ (instancetype)growTextContentWiewWithDataSource:(id<BBSGrowTextContentViewDataSource>)dataSource ;

@property (strong, nonatomic) BBSGrowTextView *textView;

@end
