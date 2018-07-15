//
//  JLListItemViewController.m
//  iOSNote
//
//  Created by li’Pro on 2018/7/9.
//  Copyright © 2018年 li’s Air. All rights reserved.
//

#import "JLListItemViewController.h"

@interface JLListItemViewController ()

@end

@implementation JLListItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([self class])];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrClassName.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
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
        _arrClassName = @[].mutableCopy;
    }
    return _arrClassName;
}

@end
