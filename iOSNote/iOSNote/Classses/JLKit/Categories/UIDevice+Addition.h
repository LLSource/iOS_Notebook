//
//  UIDevice+Addition.h
//  BBS
//
//  Created by li’Pro on 2018/3/15.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Addition)
/**
 系统版本是否 < version */
+ (BOOL)adt_lessThenVersion:(NSString *)version ;

+ (NSString *)adt_deviceModel ;
/**
 获取广告 id
 */
+ (nullable NSString *)adt_adId ;

/**
 自己生成一个 uuid 保存到 keychain
 
 @return -
 */
+ (NSString * )adt_UUIDInKeyChain ;


@end
