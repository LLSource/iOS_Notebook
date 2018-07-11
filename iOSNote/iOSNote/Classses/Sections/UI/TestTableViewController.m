//
//  TestTableViewController.m
//  iOSNote
//
//  Created by li’Pro on 2018/7/11.
//  Copyright © 2018年 li’s Air. All rights reserved.
//

#import "TestTableViewController.h"

static NSString *const kTestTVCellID = @"TestTableViewController.cell.id";

@interface TestTableViewController ()
@property (strong, nonatomic) NSMutableArray *arrData;
@end


@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTestTVCellID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark UITableviewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.arrData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrData[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTestTVCellID];
    NSUInteger count = [[self.arrData[indexPath.section] objectAtIndex:indexPath.row] integerValue];
    NSString *str = [NSString stringWithFormat:@"%ld-%ld   %ld", indexPath.section, indexPath.row, count];
    cell.textLabel.text = str;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *subArray = self.arrData[indexPath.section];
    [subArray removeObjectAtIndex:indexPath.row];
    if (subArray.count == 0) {
        [self.arrData removeObjectAtIndex:indexPath.section];
    }
    [tableView adt_deleteRow:indexPath.row inSection:indexPath.section animation:UITableViewRowAnimationLeft];
}

- (NSMutableArray *)arrData {
    if (!_arrData) {
        _arrData = @[].mutableCopy;
        for (NSUInteger i = 0; i<5; i++) {
            NSMutableArray *arrSub = @[@1, @2, @3, @4, @5].mutableCopy;
            [_arrData addObject:arrSub];
        }
        
    }
    return _arrData;
}
@end












