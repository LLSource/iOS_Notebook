//
//  BBSTextView.h
//  BBS
//
//  Created by li’Pro on 2018/4/2.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface BBSTextView : UITextView

@property (copy, nonatomic) IBInspectable NSString *placeHolder;
@property (copy, nonatomic) IBInspectable UIColor *placeholderColor;

@end
