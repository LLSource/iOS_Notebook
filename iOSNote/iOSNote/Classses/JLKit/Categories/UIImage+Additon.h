//
//  UIImage+Additon.h
//  BBS
//
//  Created by li’Pro on 2018/4/2.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Additon)
/**
 根据最大长度，压缩图片 */
- (UIImage *)adt_compressToMaxLength:(CGFloat)length ;

/**
 将图片缩放为指定大小
 */
- (UIImage *)adt_scaleToSize:(CGSize)size ; 


/**
 根据最大长度，获取裁剪的尺寸
 
 @param length 压缩后最大宽高
 @param size 原始 size
 @return size
 */
+ (CGSize)adt_compressSizeWithMaxLength:(CGFloat)length originSize:(CGSize)size ; 

/**
 返回原始渲染图 
 */
+ (UIImage *)adt_imageNamed:(NSString *)name ;

/**
 根据颜色生成图片 
 */
+ (UIImage *)adt_imageWithColor:(UIColor *)color ;

/**
 图片颜色置灰 
 */
- (UIImage*)adt_getGrayImage ;

@end










