//
//  BBSSingletonMacro.h
//  BBS
//
//  Created by li’Pro on 2018/3/21.
//  Copyright © 2018年 wzl. All rights reserved.
//

#ifndef BBSToolMacro_h
#define BBSToolMacro_h



/**
 颜色宏定义 start
 */
#ifndef COLOR_HEX_A

#define COLOR_HEX_A(hex, a) \
    [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0  \
        green:((float)((hex & 0xFF00) >> 8))/255.0  \
        blue:((float)(hex & 0xFF))/255.0 alpha:a]

#define COLOR_HEX(hex)  COLOR_HEX_A(hex, 1.f)



#define COLOR_BACKGROUND  COLOR_HEX(0xffffff)

#define COLOR_LINE_DE  COLOR_HEX(0xdedfe0)
#define COLOR_LINE_EE  COLOR_HEX(0xeeeeee)

#define COLOR_BLACK       COLOR_HEX(0x333333)
#define COLOR_RED       COLOR_HEX(0xdd0000)

#define COLOR_WHITE       COLOR_HEX(0xffffff)
#define COLOR_GRAY_AD        COLOR_HEX(0xadadad)
#define COLOR_GRAY_A4        COLOR_HEX(0xa4a4a4)
#define COLOR_GRAY_F2        COLOR_HEX(0xf2f2f2)

#define COLOR_BLUE        COLOR_HEX(0x3B7CFF)

#endif
/**
 颜色宏定义 end
 */



/**
 @符号
 */
#define WS __weak typeof(self) ws = self;

#if DEBUG
    #define bbs_keywordify autoreleasepool {}
#else
    #define bbs_keywordify try {} @catch (...) {}
#endif

/* 防止 block 内发送循环引用
 使用示例
 @weakify(self)
 [self handlerOperation^{
 @strongify(self)
 [self doSomeThing];
 }];
 */
#define weakify(name) bbs_keywordify  __weak typeof(name) weak##name = name;
#define strongify(name) bbs_keywordify  typeof(weak##name) name = weak##name;


/*  ----- log begin ---  */
#ifndef DLog

/** 自定义 log */
#ifdef DEBUG
    #define DLog(...) NSLog(__VA_ARGS__);
#else
    #define DLog(...)
#endif

/* 特定功能的log 开关 */
#define Http_Log   1
#define TCP_Log    1
#define SOCKET_Log 1

#if SOCKET_Log
    #define SKLog(fmt, ...) NSLog((@"-- socket --" fmt), ##__VA_ARGS__);
#else
    #define SKLog(...)
#endif

#if TCP_Log
    #define TCPLog(fmt, ...) NSLog((@"~~~~~~~~ tcp ~~~~~~~~\n" fmt), ##__VA_ARGS__);
#else
    #define TCPLog(...)
#endif

#endif
/*  ----- log end ---  */



/**
 单例宏定义
 */
#define singletonInterface(name) + (instancetype)share ## name ;

#define singletonImplementation(name, Class) \
+ (instancetype)share ## name { \
static Class *_ins = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_ins = [[Class alloc] init]; \
}); \
return _ins; \
}


/**
 容器线程安全
 */
#define SafeContainerBarrier(queue, block)  \
__weak typeof(self) ws = self;  \
dispatch_barrier_async(queue, ^{   \
    typeof(ws) strongSelf = ws;   \
    if (strongSelf) {   \
        if (block) block(strongSelf);   \
    }   \
});

#define SafeContainerAsyncInMain(queue, block)  \
__weak typeof(self) ws = self;      \
dispatch_async(queue, ^{        \
    typeof(ws) strongSelf = ws;    \
    if (strongSelf && block) {        \
        dispatch_async(dispatch_get_main_queue(), ^{  \
            if (strongSelf) {  \
                block(strongSelf);  \
            }   \
        });  \
    }         \
});

#define SafeMainThreadBlock(block) \
if ([NSThread isMainThread]) { \
    block(); \
} else { \
    dispatch_async(dispatch_get_main_queue(), block); \
}


/**
 This macro ensures that key path exists at compile time.
 Given a real receiver with a key path as you would call it, it verifies at compile time that the key path exists, without calling it.

 For example:

 FBKVOKeyPath(string.length) => @"length"

 Or even the complex case:

 FBKVOKeyPath(string.lowercaseString.length) => @"lowercaseString.length".
 */
#define JLKeyPath(KEYPATH) \
@(((void)(NO && ((void)KEYPATH, NO)), \
({ const char *fbkvokeypath = strchr(#KEYPATH, '.'); NSCAssert(fbkvokeypath, @"Provided key path is invalid."); fbkvokeypath + 1; })))

/**
 This macro ensures that key path exists at compile time.
 Given a receiver type and a key path, it verifies at compile time that the key path exists, without calling it.

 For example:

 FBKVOClassKeyPath(NSString, length) => @"length"
 FBKVOClassKeyPath(NSString, lowercaseString.length) => @"lowercaseString.length"
 */
#define JLClassKeyPath(CLASS, KEYPATH) \
@(((void)(NO && ((void)((CLASS *)(nil)).KEYPATH, NO)), #KEYPATH))


#endif /* BBSToolMacro_h */
