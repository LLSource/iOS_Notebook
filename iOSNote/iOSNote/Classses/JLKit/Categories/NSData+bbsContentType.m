//
//  NSData+bbsContentType.m
//  BBS
//
//  Created by li’Pro on 2018/4/2.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "NSData+bbsContentType.h"

@implementation NSData (bbsContentType)
- (NSString *)bbs_mimeType {
    NSData *data = self;
    if (!data) {
        return @"";
    }
    
    uint8_t c;
    [data getBytes:&c length:1];
    switch (c) {
        case 0xFF:
            return @"image/jpeg";//SDImageFormatJPEG;
        case 0x89:
            return @"image/png";// SDImageFormatPNG;
        case 0x47:
            return @"image/gif";// SDImageFormatGIF;
        case 0x49:
        case 0x4D:
            return @"image/tiff";// SDImageFormatTIFF;
        case 0x52:
            // R as RIFF for WEBP
            if (data.length < 12) {
                return @"";// SDImageFormatUndefined;
            }
            
            NSString *testString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            if ([testString hasPrefix:@"RIFF"] && [testString hasSuffix:@"WEBP"]) {
                return @"image/webp";// SDImageFormatWebP;
            }
    }
    return @"";// SDImageFormatUndefined;
}
@end
