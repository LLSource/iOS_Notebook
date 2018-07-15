//
//  UIDevice+Addition.h
//  BBS
//
//  Created by li’Pro on 2018/3/15.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IS_LessIOS9   [UIDevice adt_lessThenVersion:@"9"]
#define IS_LessIOS10  [UIDevice adt_lessThenVersion:@"10"]
#define IS_LessIOS11  [UIDevice adt_lessThenVersion:@"11"]

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (Addition)

/**
 系统版本是否 < version */
+ (BOOL)adt_lessThenVersion:(NSString *)version ;

/**
 app  版本号
 */
+ (NSString *)adt_shortVersion ;

/**
 app 在桌面显示的名字 
 */
+ (NSString *)adt_displayName ;

+ (NSString *)adt_deviceModel ;
/**
 获取广告 id
 */
+ (nullable NSString *)adt_adId ;



@end


NS_ASSUME_NONNULL_END
