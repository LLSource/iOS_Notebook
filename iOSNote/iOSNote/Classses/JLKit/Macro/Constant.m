//
//  BBSConstant.m
//  BBS
//
//  Created by li’Pro on 2018/5/2.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "Constant.h"

@implementation Constant

/*
 *  屏幕宽度
 */
+ (CGFloat)screenWidth {
    return SCREEN_WIDTH;
}

/*
 *  屏幕高度  
 */
//#define SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)
+ (CGFloat)screenHeight {
    return SCREEN_HEIGHT;
}

/*
 *  状态栏高度  
 */
+ (CGFloat)statusBarHeight {
    return STATUSBAR_HEIGHT;
}

/*
 *  导航栏高度  
 */
+ (CGFloat)navigationBarHeight {
    return NAVIGATIONBAR_HEIGHT;
}

/*
 *  device  
 */
+ (BOOL)isIPhoneX {
    return IS_IPhoneX;
}

/*
 *  底部 tabBar 高度  
 */
+ (CGFloat)tabnBarHeight {
    return TABBAR_HEIGHT;
}
/*
 *  safeArea  
 */
+ (CGFloat)topSafeArea {
    return TOP_SAFEAREA;
}
+ (CGFloat)bottomSafeArea {
    return BOTTOM_SAFEAREA;
}


/**
 hud 提示时长 
 */
+ (NSTimeInterval)tipDuration {
    return 0.2;
}

/*
 *  动画时长  
 */
+ (NSTimeInterval)animationDuration {
    return BBS_ANIMATION_DURATION;
}


/*
 *  取消全屏侧滑手势的 tag 
 */
+ (NSInteger)tagNoScreenPop {
    return TAG_NoScreenPop;
}

@end











