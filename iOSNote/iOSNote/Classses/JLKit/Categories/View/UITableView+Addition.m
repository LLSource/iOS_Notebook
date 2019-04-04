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

- (void)adt_deleteRowAtIndexPath:(NSIndexPath *)indexPath animation:(UITableViewRowAnimation)animation {
    [self adt_deleteRow:indexPath.row inSection:indexPath.section animation:animation];
}

- (void)adt_deleteRow:(NSUInteger)row inSection:(NSUInteger)section animation:(UITableViewRowAnimation)animation {
    NSUInteger sectionCount = [self numberOfSections];
    if (section >= sectionCount) {
        return;
    }
    NSUInteger rowCount = [self numberOfRowsInSection:section];
    if (row >= rowCount) {
        return;
    }
    
    if (rowCount == 1) { // delete section
        // 没实现默认 1 section，实现看 section
        BOOL atleastOneSection = ![self.dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)] ||
        [self.dataSource numberOfSectionsInTableView:self];
        
        if (1 == sectionCount && // 只有 1 section  1 row && 至少显示 1 section，不能直接删除
            atleastOneSection) {
            [self reloadData];
        } else {
            NSIndexSet *set = [NSIndexSet indexSetWithIndex:section];
            [self deleteSections:set withRowAnimation:animation];
        }
    } else if (rowCount > 1) {
        [self deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:row inSection:section]] withRowAnimation:animation];
    }
}

@end

















