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
    
    [self rightBarItemWithTitle:@"Insert"];
    
    //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTestTVCellID];
    [self.tableView registerNib:[UINib nibWithNibName:@"TestTableViewCell" bundle:nil] forCellReuseIdentifier:kTestTVCellID];
}

#pragma -mark enent & response

- (void)rightBarItemClicked {
    TestModel *m = [TestModel randomModel];
    
    BOOL addNewSection = arc4random() % 2;
    NSMutableArray *arrSection = nil;
    if (addNewSection) {
        arrSection = @[m].mutableCopy;
        [self.arrData addObject:arrSection];
        
        // insertSections
//        NSIndexSet *set = [NSIndexSet indexSetWithIndex:self.arrData.count-1];
//        [self.tableView insertSections:set withRowAnimation:UITableViewRowAnimationRight];
        [self.tableView adt_insertRow:0 inSection:self.arrData.count-1 animation:UITableViewRowAnimationRight];
    } else {
        arrSection = self.arrData.lastObject;
        [arrSection addObject:m];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:arrSection.count - 1 inSection:self.arrData.count-1];
        // [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [self.tableView adt_insertRowAtIndexPath:indexPath withRowAnimation:UITableViewRowAnimationLeft];
    }
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 18;
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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"%lu section", section];
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
//
//    if (0 == arrSec.count) {
//        [self.arrData removeObjectAtIndex:indexPath.section];
//    }
//
    [self.tableView adt_deleteRowAtIndexPath:indexPath animation:UITableViewRowAnimationLeft];
}


- (NSMutableArray *)arrData {
    if (!_arrData) {
        _arrData = [TestModel defaultTestModelArray];
    }
    return _arrData;
}


@end












