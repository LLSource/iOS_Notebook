//
//  PlainListViewController.m
//  iOSNote
//
//  Created by li’Pro on 2019/4/4.
//  Copyright © 2019 li’s Air. All rights reserved.
//

#import "PlainListViewController.h"
#import "TestTableViewCell.h"

static NSString *const kTestTVCellID = @"TestTableViewController.cell.id";

@interface PlainListViewController ()

@property (strong, nonatomic) NSMutableArray *arrData;

@end

@implementation PlainListViewController

- (void)viewDidLoad {
    self.tableViewStyle = UITableViewStyleGrouped;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSStringFromClass([self class]);
     [self.tableView registerNib:[UINib nibWithNibName:@"TestTableViewCell" bundle:nil] forCellReuseIdentifier:kTestTVCellID];
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}


#pragma -mark UITableviewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.arrData.count ? 1 : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTestTVCellID];
    
    cell.model = self.arrData[indexPath.row];
    
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
    [self.arrData removeObjectAtIndex:indexPath.row];
    [self.tableView adt_deleteRowAtIndexPath:indexPath animation:UITableViewRowAnimationLeft];
    
    // NSLog(@"%d", [tableView respondsToSelector:@selector(numberOfSectionsInTableView:)]);
}


- (NSMutableArray *)arrData {
    if (!_arrData) {
        _arrData = [TestModel plainTestModelArray];
        
    }
    return _arrData;
}

@end
