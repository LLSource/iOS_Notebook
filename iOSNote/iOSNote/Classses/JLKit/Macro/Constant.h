//
//  BBSConstant.h
//  BBS
//
//  Created by li’Pro on 2018/5/2.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Constant : NSObject

/*
 *  屏幕宽度
 */
+ (CGFloat)screenWidth ;

/*
 *  屏幕高度  
 */
+ (CGFloat)screenHeight ;

/*
 *  状态栏高度  
 */
+ (CGFloat)statusBarHeight ;

/*
 *  导航栏高度  
 */
+ (CGFloat)navigationBarHeight ;

/*
 *  device  
 */
+ (BOOL)isIPhoneX ;
/*
 *  底部 tabBar 高度  
 */
+ (CGFloat)tabnBarHeight ;
/*
 *  safeArea  
 */
+ (CGFloat)topSafeArea ;
+ (CGFloat)bottomSafeArea ;

/**
 hud 提示时长 
 */
+ (NSTimeInterval)tipDuration ;

/*
 *  动画时长  
 */
+ (NSTimeInterval)animationDuration ;

/*
 *  取消全屏侧滑手势的 tag 
 */
+ (NSInteger)tagNoScreenPop ;
@end















