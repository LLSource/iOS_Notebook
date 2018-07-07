//
//  UIView+Addition.m
//  sixLive
//
//  Created by li’Pro on 2017/6/28.
//  Copyright © 2017年 li’Pro. All rights reserved.
//

#import "UIView+Addition.h"

@implementation UIView (Addition)

#pragma -mark 
#pragma -mark getters
- (CGFloat)x {
    return self.frame.origin.x;
}
- (CGFloat)y {
    return self.frame.origin.y;
}
- (CGFloat)width {
    return self.frame.size.width;
}
- (CGFloat)height {
    return self.frame.size.height;
}
- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}
- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}
#pragma -mark 
#pragma -mark setters
- (void)setX:(CGFloat)x {
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}
- (void)setY:(CGFloat)y {
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}
- (void)setWidth:(CGFloat)width {
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}
- (void)setHeight:(CGFloat)height {
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}
- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

@end
