//
//  NSString+Addition.h
//  sixLive
//
//  Created by li’Pro on 2017/6/28.
//  Copyright © 2017年 li’Pro. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

struct BBSImageInfo {
    CGSize imgSize;
    CGSize thumbImgSize;
    BOOL isLongImage;
};

@interface NSString (Addition)

/**
 * 计算文字宽度
 */
- (CGFloat)textWidthWithFont:(UIFont *)font height:(CGFloat)height ;
/**
 * 计算文字高度
 */
- (CGFloat)textHeightWithFont:(UIFont *)font width:(CGFloat)width ;

- (NSString *)adt_md5 ;

/**
 检测手机号码的合法性
 */
- (BOOL)adt_isPhoneNum ;

/**
删除收尾空格、换行符 
 */
- (NSString *)adt_trim ;

/**
 时间字符串 -> 显示样式 
 "2018-04-13 12:04:14"
 本日显示：hh：mm   本日之前显示：MM-DD   跨年显示：YYYY-MM-DD
 */
- (NSString *)adt_timeFormatter ;


/**
 根据 URL 后面的宽高，获取图片尺寸 
 http://0x ... S2.png?w=750&h=533
 */
- (struct BBSImageInfo)adt_imageInformation ;


/**
 默认缓存目录
 
 @param nameSpace 传 nil， 默认 default
 @return -
 */
+ (NSString *)adt_cacheWithNamespace:(nullable NSString *)nameSpace ;

@end



NS_ASSUME_NONNULL_END






