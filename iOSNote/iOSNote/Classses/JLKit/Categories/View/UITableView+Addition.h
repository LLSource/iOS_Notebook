//
//  UITableView+Addition.h
//  BBS
//
//  Created by li’Pro on 2018/6/27.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Addition)

/**
 滑动到底部

 @param animated 是否使用动画
 */
- (void)adt_scrollToBottom:(BOOL)animated ;

- (void)adt_deleteRowAtIndexPath:(NSIndexPath *)indexPath animation:(UITableViewRowAnimation)animation ;

- (void)adt_deleteRow:(NSUInteger)row inSection:(NSUInteger)section animation:(UITableViewRowAnimation)animation ;

- (void)adt_insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation ;

- (void)adt_insertRow:(NSUInteger)row inSection:(NSUInteger)section animation:(UITableViewRowAnimation)animation ;

/// 刷新列表并修复列表位置，更新后 toIndexPath 的位置和更新前 fromIndexPath 位置一致。
/// @param operation 更新操作
/// @param fromIndexPath 更新前 indexPath。
/// @param toIndexPath 更新后 indexPath。
- (void)adt_fixPositionReloadData:(void(^)(void))operation
                             from:(NSIndexPath *)fromIndexPath
                               to:(NSIndexPath *)toIndexPath ;

@end
