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


- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    NSLog(@"%s", __func__);
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    NSLog(@"%s", __func__);
}



@end
