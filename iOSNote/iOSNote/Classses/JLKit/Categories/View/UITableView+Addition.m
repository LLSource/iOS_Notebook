//
//  UITableView+Addition.m
//  BBS
//
//  Created by li’Pro on 2018/6/27.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "UITableView+Addition.h"

@implementation UITableView (Addition)

/**
 滑动到底部
 
 @param animated 是否使用动画
 */
- (void)adt_scrollToBottom:(BOOL)animated {
    NSUInteger section = [self numberOfSections];
    if (section == 0) {
        return;
    }
    NSUInteger rows = [self numberOfRowsInSection:section-1];
    if (rows == 0) {
        return;
    }
    [self scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:rows-1 inSection:section-1] atScrollPosition:UITableViewScrollPositionBottom animated:animated];
    
}

@end
