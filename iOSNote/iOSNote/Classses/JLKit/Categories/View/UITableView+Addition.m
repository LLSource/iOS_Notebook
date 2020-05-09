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
    if (![self adt_checkIndexPathValidate:indexPath]) return;
    
    NSUInteger sectionCount = [self numberOfSections]; // 删除之前的 section number
    NSUInteger rowCount = [self numberOfRowsInSection:indexPath.section];// 删除之前的 row number
    
    dispatch_block_t deleteRowBlock = ^{
        [self deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
    };
    
    // 删到最后 1 个 row 要特别小心
    if (rowCount == 1) { // judge weather or not can delete section
        // 没实现默认 1 section
        if ( ![self.dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)] ) {
            deleteRowBlock();
        } else { // 实现了 - （NSInteger)numberOfSectionsInTableView ;
            NSInteger remindSection = [self.dataSource numberOfSectionsInTableView:self];
            if (remindSection == sectionCount) { // 删除该 section 最后 1 row，section 数量没减少
                deleteRowBlock();
            } else {
                NSIndexSet *set = [NSIndexSet indexSetWithIndex:indexPath.section];
                [self deleteSections:set withRowAnimation:animation];
            }
        }
    } else if (rowCount > 1) {
        deleteRowBlock();
    }
}

- (void)adt_deleteRow:(NSUInteger)row inSection:(NSUInteger)section animation:(UITableViewRowAnimation)animation {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    [self adt_deleteRowAtIndexPath:indexPath animation:animation];
}


- (void)adt_insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation {
    if (nil == indexPath) return;
    NSInteger beforeSectionNumber = [self numberOfSections];
    
    if (indexPath.section < beforeSectionNumber) {
        [self insertRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
    } else if (indexPath.section == beforeSectionNumber) {
        NSIndexSet *set = [NSIndexSet indexSetWithIndex:indexPath.section];
        [self insertSections:set withRowAnimation:animation];
    } else {
#if DEBUG
        NSAssert(nil, @"- (void)adt_insertRowsAtIndexPath:, section 越界 ");
#else
        return;
#endif
    }
}

- (void)adt_insertRow:(NSUInteger)row inSection:(NSUInteger)section animation:(UITableViewRowAnimation)animation {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    [self adt_insertRowAtIndexPath:indexPath withRowAnimation:animation];
}

/// 刷新列表并修复列表位置，更新后 toIndexPath 的位置和更新前 fromIndexPath 位置一致。
/// @param operation 更新操作
/// @param fromIndexPath 更新前 indexPath。
/// @param toIndexPath 更新后 indexPath。
- (void)adt_fixPositionReloadData:(void(^)(void))operation
                             from:(NSIndexPath *)fromIndexPath
                               to:(NSIndexPath *)toIndexPath {
    if (!operation) return;
    
    // check indexPath
    if (![self adt_checkIndexPathValidate:fromIndexPath]) return;
    
    CGPoint offset = self.contentOffset;
    CGRect fromRect = [self rectForRowAtIndexPath:fromIndexPath];
    
    /// 刷新操作
    operation();
    // check indexPath
    if (![self adt_checkIndexPathValidate:toIndexPath]) return;
    
    CGRect toRect = [self rectForRowAtIndexPath:toIndexPath];
    CGFloat differY = fromRect.origin.y - toRect.origin.y;
    offset.y -= differY;
    
    self.contentOffset = offset;
}


#pragma mark - private

/// 检测 indexPath 是否合法
/// @param indexPath -
- (BOOL)adt_checkIndexPathValidate:(NSIndexPath *)indexPath {
    // 判断 indexPath 是否合法
    NSUInteger sectionCount = [self numberOfSections]; // 删除之前的 section number
    if (indexPath.section >= sectionCount) {
#if DEBUG
        NSAssert(nil, @"adt_checkIndexPathValidate:, section 越界 ");
#else
        return NO;
#endif
    }
    
    NSUInteger rowCount = [self numberOfRowsInSection:indexPath.section];// 删除之前的 row number
    if (indexPath.row >= rowCount) {
#if DEBUG
        NSAssert(nil, @"adt_checkIndexPathValidate:, row 越界 ");
#else
        return NO;
#endif
    }
    return YES;
}

@end

