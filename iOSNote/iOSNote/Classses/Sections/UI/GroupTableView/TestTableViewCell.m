//
//  TestTableViewCell.m
//  iOSNote
//
//  Created by li’Pro on 2019/4/4.
//  Copyright © 2019 li’s Air. All rights reserved.
//

#import "TestTableViewCell.h"

@implementation TestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(TestModel *)model {
    _model = model;

    self.lblTitle.text = model.name;
}

- (IBAction)btnDeleteClicked:(UIButton *)sender {
    if (self.deletate &&
        [self.deletate respondsToSelector:@selector(testCellBtnDeleteClicked:model:)]) {
        [self.deletate testCellBtnDeleteClicked:sender model:self.model];
    }
}



@end
