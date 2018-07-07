//
//  BBSTableViewController.h
//  BBS
//
//  Created by li’Pro on 2018/4/10.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "BBSViewController.h"

@interface BBSTableViewController : BBSViewController <UITableViewDelegate, UITableViewDataSource>


/**
 tableView 默认 UITableViewStylePlain 样式
 如需切换样式，请在 viewDidLoad：方法 调用 super 之前进行设置。
 */
@property (assign, nonatomic) UITableViewStyle tableViewStyle;
@property (strong, nonatomic) UITableView *tableView;


@end








