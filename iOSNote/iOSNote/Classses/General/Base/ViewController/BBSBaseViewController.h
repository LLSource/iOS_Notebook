//
//  BBSBaseViewController.h
//  BBS
//
//  Created by li’Pro on 2018/3/22.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBSBaseViewController : UIViewController

/**
 初始化参数
 */
@property (copy, nonatomic) NSDictionary *dicParams;

- (instancetype)initWithParamter:(NSDictionary *)dicParams ;

/**
 返回上一界面
 */
- (void)backAction ;

- (void)setup ;
- (void)setupUI ;
- (void)requestData ;
@end
