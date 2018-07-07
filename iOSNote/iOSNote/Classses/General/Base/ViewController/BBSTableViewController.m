//
//  BBSTableViewController.m
//  BBS
//
//  Created by li’Pro on 2018/4/10.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "BBSTableViewController.h"

@interface BBSTableViewController ()

@end

@implementation BBSTableViewController
- (instancetype)initWithParamter:(NSDictionary *)dicParams {
    if (self = [super initWithParamter:dicParams]) {
        self.tableViewStyle = UITableViewStylePlain;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(TOP_SAFEAREA);
        make.left.right.bottom.equalTo(self.view);
    }];
}



#pragma -mark getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:self.tableViewStyle];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.separatorColor = COLOR_LINE_DE;
        
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.rowHeight = 49;
    }
    return _tableView;
}

@end








