//
//  UIImage+Additon.m
//  BBS
//
//  Created by li’Pro on 2018/4/2.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "UIImage+Additon.h"

@implementation UIImage (Additon)
/**
 根据最大长度，压缩图片 */
- (UIImage *)adt_compressToMaxLength:(CGFloat)length {
    CGSize scaleSize = [[self class] adt_compressSizeWithMaxLength:length originSize:self.size]; 
    //[ pri_compressSizeWithMaxLength:length originSize:self.size];
    return [self adt_scaleToSize:scaleSize];
}

/**
 将图片缩放为指定大小
 */
- (UIImage *)adt_scaleToSize:(CGSize)size {
    CGSize scaleSize = size;
    
    UIGraphicsBeginImageContext(scaleSize);
    [self drawInRect:CGRectMake(0, 0, scaleSize.width, scaleSize.height)];
    UIImage *imgNew = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imgNew;
}


/**
 根据最大长度，获取裁剪的尺寸

 @param length 压缩后最大宽高
 @param size 原始 size
 @return size
 */
+ (CGSize)adt_compressSizeWithMaxLength:(CGFloat)length originSize:(CGSize)size {
    if (size.width <= length && size.height <= length) {
        return size;
    }
    CGSize sizeReturn = CGSizeZero;
    CGFloat rate = size.width / size.height;
    
    if (rate > 1) {
        sizeReturn.width = length;
        sizeReturn.height = length / rate;
    } else {
        sizeReturn.height = length;
        sizeReturn.width = length * rate;
    }
    
    return sizeReturn;
}


/**
 返回原始渲染图 
 */
+ (UIImage *)adt_imageNamed:(NSString *)name {
    return [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


/**
 根据颜色生成图片 
 */
+ (UIImage *)adt_imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f); //宽高 1.0只要有值就够了
    UIGraphicsBeginImageContext(rect.size); //在这个范围内开启一段上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);//在这段上下文中获取到颜色UIColor
    CGContextFillRect(context, rect);//用这个颜色填充这个上下文
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();//从这段上下文中获取Image属性,,,结束
    UIGraphicsEndImageContext();
    
    return image;
}

/**
 图片颜色置灰 
 */
- (UIImage*)adt_getGrayImage {
    UIImage *image = self;
    if(![image isKindOfClass:[UIImage class]]) {
        return nil;
    }
    UIGraphicsBeginImageContextWithOptions(image.size,NO, [UIScreen mainScreen].scale);
    //颜色填充
    [COLOR_HEX(0xd4d4d4) setFill];
    CGRect bounds = CGRectMake(0,0, image.size.width, image.size.height);
    UIRectFill(bounds);
    [image drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    UIImage *highlighted = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return highlighted;    
}

@end
















