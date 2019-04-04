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

@interface TestTableViewController ()<TestTableViewCellDelegate>

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


#pragma -mark TestTableViewCellDelegate

- (void)testCellBtnDeleteClicked:(UIButton *)sender model:(TestModel *)model {
    NSIndexPath *indexPath ;
    
    for (NSInteger i = 0; i<self.arrData.count; i++) {
        
        NSMutableArray *arrSec = self.arrData[i];
        for (NSInteger j = 0; j<arrSec.count; j++) {
            if (arrSec[j] == model) {
                [arrSec removeObjectAtIndex:j];
                indexPath = [NSIndexPath indexPathForRow:j inSection:i];
                
                if (0 == arrSec.count) {
                    [self.arrData removeObjectAtIndex:i];
                }
                break;
            }
        }
    }
    if (indexPath)
        [self.tableView adt_deleteRowAtIndexPath:indexPath animation:UITableViewRowAnimationLeft];
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
    cell.deletate = self;
    
    cell.model = [self.arrData[indexPath.section] objectAtIndex:indexPath.row];
    
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
        _arrData = [TestModel defaultTestModelArray];
        
    }
    return _arrData;
}


@end












