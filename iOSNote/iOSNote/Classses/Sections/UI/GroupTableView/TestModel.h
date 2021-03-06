//
//  TestModel.h
//  iOSNote
//
//  Created by li’Pro on 2019/4/4.
//  Copyright © 2019 li’s Air. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestModel : NSObject

@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger modelID;

+ (instancetype)randomModel ;

+ (NSMutableArray *)defaultTestModelArray ;

+ (NSMutableArray *)plainTestModelArray ; 

@end

NS_ASSUME_NONNULL_END
