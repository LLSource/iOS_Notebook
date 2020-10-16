//
//  NSString+Addition.m
//  sixLive
//
//  Created by li’Pro on 2017/6/28.
//  Copyright © 2017年 li’Pro. All rights reserved.
//

#import "NSString+Addition.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSDate+compare.h"


@implementation NSString (Addition)

- (CGFloat)textWidthWithFont:(UIFont *)font height:(CGFloat)height {
    NSString *text = self;
    return [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size.width;
}

/// 计算行数
/// @param font 字体
/// @param width 最大宽度
- (CGFloat)adt_linesCountWithFont:(UIFont *)font width:(CGFloat)width {
    CGFloat height = [self textHeightWithFont:font width:width];
    return (height + 0.01) / font.lineHeight;
}

- (CGFloat)textHeightWithFont:(UIFont *)font width:(CGFloat)width {
    NSString *text = self;
    return [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size.height;
}

- (NSString *)adt_md5 {
    NSString *key = self;
    const char *str = key.UTF8String;
    if (str == NULL) {
        str = "";
    }
    unsigned char r[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), r);
    NSString *filename = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                          r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8], r[9], r[10],
                          r[11], r[12], r[13], r[14], r[15]];
    
    return filename;
}

- (BOOL)adt_isPhoneNum {
    NSString *MOBILE = @"^1\\d{10}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:self];
}

/**
  删除收尾空格、换行符 
 */
- (NSString *)adt_trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


/**
 时间字符串 -> 显示样式 
 "2018-04-13 12:04:14"
 本日显示：hh：mm   本日之前显示：MM-DD   跨年显示：YYYY-MM-DD
 */
- (NSString *)adt_timeFormatter {
    if (self.length <  15) {
        return self;
    }
    
    NSDate *cur = [NSDate date];
    NSDate *date1 = [NSDate c_dateWithBBSFormatterString:self];
    
    NSString *formatter = @"yyyy-MM-dd"; // @"yyyy-MM-dd HH:mm:ss";
    
    if ([cur isSameDay:date1]) { // 本日显示：hh：mm
        formatter = @"HH:mm";
    } else if ([cur isSameYear:date1]) { // 同年 ：01/01 --- 昨天
        formatter = @"MM-dd";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatter;
    
    return [dateFormatter stringFromDate:date1];
}



/**
 根据 URL 后面的宽高，获取图片尺寸 
 http://0x ... S2.png?w=750&h=533
 */
- (struct BBSImageInfo)adt_imageInformation {
    struct BBSImageInfo info;
    
    NSURL *url = [NSURL URLWithString:self];
    NSArray<NSString *> *arrKeyValue = [url.query componentsSeparatedByString:@"&"];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:arrKeyValue.count];
    for (NSString *oneKeyValue in arrKeyValue) {
        NSArray<NSString *> *arrOne = [oneKeyValue componentsSeparatedByString:@"="];
        [dic setObject:arrOne.lastObject forKey:arrOne.firstObject];
    }
    
    CGFloat width = 100;
    CGFloat height = 100;
    
    NSInteger s = -1;
    if ([[dic allKeys] containsObject:@"s"]) {
        s = [dic parse_numberForKey:@"s"];
    }
    info.isLongImage = s == 1;
    
    // 缩略图
    if ([[dic allKeys] containsObject:@"sw"]) {
        width = [dic parse_numberForKey:@"sw"];
        height = [dic parse_numberForKey:@"sh"];
    }
    info.thumbImgSize = CGSizeMake(width, height);
    
    width = 100; height = 100;
    // 原图
    if ([[dic allKeys] containsObject:@"w"]) {
        width = [dic parse_numberForKey:@"w"];
        height = [dic parse_numberForKey:@"h"];
    }
    info.imgSize = CGSizeMake(width, height);
    return info;
}


/**
 默认缓存目录
 
 @param nameSpace 传 nil， 默认 default
 @return -
 */
+ (NSString *)adt_cacheWithNamespace:(nullable NSString *)nameSpace {
    NSString *cache = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    if (nameSpace == nil) {
        nameSpace = @"default";
    }
    cache = [cache stringByAppendingPathComponent:@"net.6rooms.www"];
    cache = [cache stringByAppendingPathComponent:nameSpace];
    return cache;
}


@end



















