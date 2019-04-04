//
//  TestTableViewController.m
//  iOSNote
//
//  Created by li’Pro on 2018/7/11.
//  Copyright © 2018年 li’s Air. All rights reserved.
//

#import "TestTableViewController.h"
#import "TestTableViewCell.h"

static NSString *const kTestTVCellID = @"TestTableViewController.cell.id";

@interface TestTableViewController ()

@property (strong, nonatomic) NSMutableArray *arrData;

@end


@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTestTVCellID];
    [self.tableView registerNib:[UINib nibWithNibName:@"TestTableViewCell" bundle:nil] forCellReuseIdentifier:kTestTVCellID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}


#pragma -mark UITableviewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.arrData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrData[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTestTVCellID];
    
    cell.model = [self.arrData[indexPath.section] objectAtIndex:indexPath.row];
    
    return cell;
}

/*
 是否实现：numberOfSectionsInTableView
 实现
 返回 0 正常
 返回 1 正常
 不实现    正常
 
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSMutableArray *arrSec = self.arrData[indexPath.section];
    [arrSec removeObjectAtIndex:indexPath.row];
    if (0 == arrSec.count) {
        [self.arrData removeObjectAtIndex:indexPath.section];
    }
    
    [self.tableView adt_deleteRowAtIndexPath:indexPath animation:UITableViewRowAnimationLeft];
}


- (NSMutableArray *)arrData {
    if (!_arrData) {
        _arrData = [TestModel defaultTestModelArray];
        
    }
    return _arrData;
}


@end












