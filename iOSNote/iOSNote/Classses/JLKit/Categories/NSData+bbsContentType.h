//
//  NSData+bbsContentType.h
//  BBS
//
//  Created by li’Pro on 2018/4/2.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSData (bbsContentType)
/**
 返回 mineType，注意：只支持图片 */
- (NSString *)bbs_mimeType ;
@end
