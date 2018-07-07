//
//  BBSGlobalMacro.h
//  BBS
//
//  Created by li’Pro on 2017/6/27.
//  Copyright © 2017年 li’Pro. All rights reserved.
//

#ifndef BBSGlobalMacro_h
#define BBSGlobalMacro_h


/*
 *  屏幕宽度
 */
#define SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)

/*
 *  屏幕高度  
 */
#define SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)

/*
 *  状态栏高度  
 */
#define STATUSBAR_HEIGHT [UIApplication sharedApplication].statusBarFrame.size.height

/*
 *  导航栏高度  
 */
#define NAVIGATIONBAR_HEIGHT 44.0

/*
 *  singleton  
 */
#define httpRequest [HttpRequest shareHttpRequest]
#define appModel [AppModel shareAppModel]
#define appDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)


/*
 *  device  
 */
#define IS_IPhoneX (812 == SCREEN_HEIGHT)

/*
 *  底部 tabBar 高度  
 */
#define TABBAR_HEIGHT  (IS_IPhoneX ? 83.f : 49.f)

/*
 *  safeArea  
 */
#define TOP_SAFEAREA (STATUSBAR_HEIGHT + NAVIGATIONBAR_HEIGHT)
#define BOTTOM_SAFEAREA (IS_IPhoneX ? 34.f : 0)

/*
 *  动画时长  
 */
#define BBS_ANIMATION_DURATION 0.2

/*
 *  取消全屏侧滑手势的 tag 
 */
#define TAG_NoScreenPop 1392


#define BBSAudioExtension @"amr"

/**
 判断字符串非 nil 
 */
#define StringNotNil(content) ((nil != content) && [content isKindOfClass:[NSString class]])



/*
 *  Keychain
 */
#define BBS_KEYCHAIN_SERVICE_NAME    @"net.6rooms.www.bbs"


#endif /* BBSGlobalMacro_h */







