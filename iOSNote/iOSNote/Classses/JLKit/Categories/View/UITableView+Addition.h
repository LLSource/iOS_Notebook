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


- (void)adt_deleteRow:(NSUInteger)row inSection:(NSUInteger)section animation:(UITableViewRowAnimation)animation ;

@end
