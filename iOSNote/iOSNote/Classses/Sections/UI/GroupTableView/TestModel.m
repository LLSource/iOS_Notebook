//
//  TestModel.m
//  iOSNote
//
//  Created by li’Pro on 2019/4/4.
//  Copyright © 2019 li’s Air. All rights reserved.
//

#import "TestModel.h"

@implementation TestModel


+ (instancetype)randomModel {
    TestModel *model = [[TestModel alloc] init];
    
    model.name = @(arc4random() % 100).stringValue;
    model.modelID = time(NULL);
    
    return model;
}


+ (NSMutableArray *)defaultTestModelArray {
    NSMutableArray *array = @[].mutableCopy;
    {
        NSMutableArray *arrSection = @[].mutableCopy;
        {
            TestModel *model = [TestModel new];
            model.name = @"七牛";
            model.modelID = 1;
            [arrSection addObject:model];
        }
        {
            TestModel *model = [TestModel new];
            model.name = @"六间房";
            model.modelID = 2;
            [arrSection addObject:model];
        }
        {
            TestModel *model = [TestModel new];
            model.name = @"阿里巴巴";
            model.modelID = 3;
            [arrSection addObject:model];
        }
        [array addObject:arrSection];
    }
    
    {
        NSMutableArray *arrSection = @[].mutableCopy;
        {
            TestModel *model = [TestModel new];
            model.name = @"百度";
            model.modelID = 11;
            [arrSection addObject:model];
        }
        {
            TestModel *model = [TestModel new];
            model.name = @"腾讯";
            model.modelID = 12;
            [arrSection addObject:model];
        }
        [array addObject:arrSection];
    }
    {
        NSMutableArray *arrSection = @[].mutableCopy;
        {
            TestModel *model = [TestModel new];
            model.name = @"Google";
            model.modelID = 21;
            [arrSection addObject:model];
        }
        {
            TestModel *model = [TestModel new];
            model.name = @"Apple";
            model.modelID = 22;
            [arrSection addObject:model];
        }
        [array addObject:arrSection];
    }
    
    
    return array;
}



+ (NSMutableArray *)plainTestModelArray {
    NSMutableArray *arrSection = @[].mutableCopy;
    {
        TestModel *model = [TestModel new];
        model.name = @"七牛";
        model.modelID = 1;
        [arrSection addObject:model];
    }
    {
        TestModel *model = [TestModel new];
        model.name = @"六间房";
        model.modelID = 2;
        [arrSection addObject:model];
    }
    {
        TestModel *model = [TestModel new];
        model.name = @"阿里巴巴";
        model.modelID = 3;
        [arrSection addObject:model];
    }
    {
        TestModel *model = [TestModel new];
        model.name = @"百度";
        model.modelID = 11;
        [arrSection addObject:model];
    }
    {
        TestModel *model = [TestModel new];
        model.name = @"腾讯";
        model.modelID = 12;
        [arrSection addObject:model];
    }
    
    return arrSection;
}

@end
