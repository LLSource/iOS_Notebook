//
//  TestTableViewCell.h
//  iOSNote
//
//  Created by li’Pro on 2019/4/4.
//  Copyright © 2019 li’s Air. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol TestTableViewCellDelegate <NSObject>

- (void)testCellBtnDeleteClicked:(UIButton *)sender model:(TestModel *)model ;

@end

@interface TestTableViewCell : UITableViewCell

@property (weak, nonatomic) id<TestTableViewCellDelegate> deletate;

@property (weak, nonatomic) IBOutlet UIButton *btnDelete;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@property (strong, nonatomic) TestModel *model;

@end

NS_ASSUME_NONNULL_END
