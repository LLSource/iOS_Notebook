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


@interface TestTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@property (strong, nonatomic) TestModel *model;

@end

NS_ASSUME_NONNULL_END
