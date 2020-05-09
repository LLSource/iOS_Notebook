//
//  TestFlowLayoutViewController.m
//  iOSNote
//
//  Created by li’Pro on 2020/5/9.
//  Copyright © 2020 li’s Air. All rights reserved.
//

#import "TestFlowLayoutViewController.h"
#import "JLFlowLayoutView.h"


@interface TestFlowLayoutViewController ()

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) JLFlowLayoutView *layoutView;

@end


@implementation TestFlowLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.layoutView];
    
    for (NSInteger i = 0; i < 40; i++) {
        UILabel *lbl = [UILabel new];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.text = @(i).stringValue;
        lbl.backgroundColor = [UIColor whiteColor];
        
        [self.layoutView addSubview:lbl];
    }
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    UIEdgeInsets inset = UIEdgeInsetsZero;
    if (@available(iOS 11.0, *)) {
        inset = self.view.safeAreaInsets;
    } else {
        inset.top = 64;
    }
    
    CGSize size = self.view.frame.size;
    size.height -= inset.top;
    self.scrollView.frame = CGRectMake(0, inset.top, size.width, size.height);
    
//    self.gridView.frame = CGRectMake(self.scrollView.qmui_safeAreaInsets.left, 0, gridViewWidth, QMUIViewSelfSizingHeight);
//    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.gridView.frame), CGRectGetMaxY(self.gridView.frame));
    
    self.layoutView.frame = CGRectMake(0, 0, size.width, JLViewSelfSizingHeight);
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.layoutView.frame), CGRectGetMaxY(self.layoutView.frame));
}

#pragma mark - getter

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        if (@available(iOS 11.0, *)) {
            _scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
        _scrollView.backgroundColor = [UIColor greenColor];
    }
    return _scrollView;;
}

- (JLFlowLayoutView *)layoutView {
    if (!_layoutView) {
        _layoutView = [[JLFlowLayoutView alloc] init];
        _layoutView.backgroundColor = [UIColor lightGrayColor];
        _layoutView.minimumItemSize = CGSizeMake(SCREEN_WIDTH, 30);
        _layoutView.itemMargins = UIEdgeInsetsMake(0, 0, 10, 0);
    }
    return _layoutView;
}

@end
