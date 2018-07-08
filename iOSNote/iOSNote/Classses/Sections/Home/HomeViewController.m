//
//  HomeViewController.m
//  iOSNote
//
//  Created by li’s Air on 2018/7/7.
//  Copyright © 2018年 li’s Air. All rights reserved.
//

#import "HomeViewController.h"

static NSString *homeCellID = @"HomeViewController.cellID";

@interface HomeViewController ()
@property (strong, nonatomic) NSMutableArray<NSString *> *arrClassName;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:homeCellID];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrClassName.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:homeCellID];
    cell.textLabel.text = self.arrClassName[indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class c = NSClassFromString(self.arrClassName[indexPath.row]);
    [self.navigationController pushViewController:[c new] animated:YES];
}

- (NSMutableArray<NSString *> *)arrClassName {
    if (!_arrClassName) {
        _arrClassName = @[@"CategoryViewController", @"MemoryViewController", @"BlockViewController"].mutableCopy;
    }
    return _arrClassName;
}

@end















