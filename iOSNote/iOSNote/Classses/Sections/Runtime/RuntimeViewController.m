//
//  RuntimeViewController.m
//  iOSNote
//
//  Created by li’s Air on 2018/11/5.
//  Copyright © 2018 li’s Air. All rights reserved.
//

#import "RuntimeViewController.h"
#import "RTEmployee+Addition.h"



@interface RuntimeViewController ()

@property (strong, nonatomic) RTEmployee *employee;

@end

@implementation RuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.employee = [RTEmployee new];
}

- (IBAction)callSayHelloMethod:(id)sender {
    NSLog(@"%@", [self.employee sayHello]);
}
- (IBAction)callADTSayhello:(id)sender {
    NSLog(@"%@", [self.employee adt_sayHello]);
}

- (IBAction)exchangeMethod:(id)sender {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [RTEmployee exchangeSayHelloMethod];
    });
}


#pragma -mark private




@end
