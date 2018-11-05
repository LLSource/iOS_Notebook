//
//  RTEmployee+Addition.m
//  iOSNote
//
//  Created by li’s Air on 2018/11/5.
//  Copyright © 2018 li’s Air. All rights reserved.
//  http://www.cocoachina.com/ios/20170417/19069.html

#import "RTEmployee+Addition.h"
#import <objc/runtime.h>


@implementation RTEmployee (Addition)

+ (void)exchangeSayHelloMethod {
    SEL originSel = @selector(sayHello);
    SEL destSel = @selector(adt_sayHello);
    Class c = [self class];
    
    Method originMethod = class_getInstanceMethod(c, originSel);
    Method destMethod = class_getInstanceMethod(c, destSel);
    
    BOOL didAddMethod = class_addMethod(c,
                                        originSel,
                                        method_getImplementation(destMethod),
                                        method_getTypeEncoding(destMethod));
    if (didAddMethod) {
        class_replaceMethod(c,
                            destSel,
                            method_getImplementation(originMethod),
                            method_getTypeEncoding(originMethod));
    } else {
        method_exchangeImplementations(originMethod, destMethod);
    }
    
}

- (NSString *)adt_sayHello {
    return @"adt_sayHello";
}

//+ (void)load
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Class aClass = [self class];
//
//            SEL originalSelector = @selector(method_original:);
//            SEL swizzledSelector = @selector(method_swizzle:);
//
//            Method originalMethod = class_getInstanceMethod(aClass, originalSelector);
//            Method swizzledMethod = class_getInstanceMethod(aClass, swizzledSelector);
//            BOOL didAddMethod =
//            class_addMethod(aClass,
//                            originalSelector,
//                            method_getImplementation(swizzledMethod),
//                            method_getTypeEncoding(swizzledMethod));
//
//            if (didAddMethod) {
//                 class_replaceMethod(aClass,
//                                        swizzledSelector,
//                                        method_getImplementation(originalMethod),
//                                        method_getTypeEncoding(originalMethod));
//             } else {
//                  method_exchangeImplementations(originalMethod, swizzledMethod);
//             }
//    });
//}

@end
