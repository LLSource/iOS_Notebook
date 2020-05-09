//
//  JLFlowLayoutView.m
//  iOSNote
//
//  Created by li’Pro on 2020/5/9.
//  Copyright © 2020 li’s Air. All rights reserved.
//

#import "JLFlowLayoutView.h"

#define ValueSwitchAlignLeftOrRight(valueLeft, valueRight) ([self shouldAlignRight] ? valueRight : valueLeft)

const CGFloat JLViewSelfSizingHeight = INFINITY;
const CGSize JLFloatLayoutViewAutomaticalMaximumItemSize = {-1, -1};

CGFloat
CGFloatSafeValue(CGFloat value) {
    return isnan(value) ? 0 : value;
}

@implementation JLFlowLayoutView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self didInitialize];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self didInitialize];
    }
    return self;
}

- (void)didInitialize {
    self.contentMode = UIViewContentModeLeft;
    self.minimumItemSize = CGSizeZero;
    self.maximumItemSize = JLFloatLayoutViewAutomaticalMaximumItemSize;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return [self layoutSubviewsWithSize:size shouldLayout:NO];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self layoutSubviewsWithSize:self.bounds.size shouldLayout:YES];
}

- (void)setFrame:(CGRect)frame {
    UIView *selfObject = self;
    
    // QMUIViewSelfSizingHeight 的功能
    if (CGRectGetWidth(frame) > 0 && isinf(CGRectGetHeight(frame))) {
        CGFloat height = ceil([selfObject sizeThatFits:CGSizeMake(CGRectGetWidth(frame), CGFLOAT_MAX)].height);
        if (height > 0) frame.size.height = height;
    }
    
    // 对非法的 frame，Debug 下中 assert，Release 下会将其中的 NaN 改为 0，避免 crash
    if ( isnan(frame.origin.x) || isnan(frame.origin.y) || isnan(frame.size.width) || isnan(frame.size.height) ) {
//        QMUILogWarn(@"UIView (QMUI)", @"%@ setFrame:%@，参数包含 NaN，已被拦截并处理为 0。%@", selfObject, NSStringFromCGRect(frame), [NSThread callStackSymbols]);
//        if (QMUICMIActivated && !ShouldPrintQMUIWarnLogToConsole) {
//            NSAssert(NO, @"UIView setFrame: 出现 NaN");
//        }
#ifdef DEBUG
#else
        frame = CGRectMake(CGFloatSafeValue(frame.origin.x), CGFloatSafeValue(frame.origin.y), CGFloatSafeValue(frame.size.width), CGFloatSafeValue(frame.size.height));
#endif
    }
    
//    CGRect precedingFrame = selfObject.frame;
//    BOOL valueChange = !CGRectEqualToRect(frame, precedingFrame);
//    if (selfObject.qmui_frameWillChangeBlock && valueChange) {
//        frame = selfObject.qmui_frameWillChangeBlock(selfObject, frame);
//    }
    
    // call super
//     void (*originSelectorIMP)(id, SEL, CGRect);
    [super setFrame:frame];
//    originSelectorIMP = (void (*)(id, SEL, CGRect))originalIMPProvider();
//    originSelectorIMP(selfObject, originCMD, frame);
    
}

- (CGSize)layoutSubviewsWithSize:(CGSize)size shouldLayout:(BOOL)shouldLayout {
    NSArray<UIView *> *visibleItemViews = [self visibleSubviews];
    
    if (visibleItemViews.count == 0) {
        return CGSizeMake(self.padding.left + self.padding.right, self.padding.top + self.padding.bottom);
    }
    
    // 如果是左对齐，则代表 item 左上角的坐标，如果是右对齐，则代表 item 右上角的坐标
    CGPoint itemViewOrigin = CGPointMake(ValueSwitchAlignLeftOrRight(self.padding.left, size.width - self.padding.right), self.padding.top);
    CGFloat currentRowMaxY = itemViewOrigin.y;
    CGSize maximumItemSize = CGSizeEqualToSize(self.maximumItemSize, JLFloatLayoutViewAutomaticalMaximumItemSize) ? CGSizeMake(size.width - self.padding.left - self.padding.right, size.height - self.padding.top - self.padding.bottom) : self.maximumItemSize;
    
    for (NSInteger i = 0, l = visibleItemViews.count; i < l; i ++) {
        UIView *itemView = visibleItemViews[i];
        
        CGSize itemViewSize = [itemView sizeThatFits:maximumItemSize];
        itemViewSize.width = fmax(self.minimumItemSize.width, itemViewSize.width);
        itemViewSize.height = fmax(self.minimumItemSize.height, itemViewSize.height);
        itemViewSize.width = fmin(maximumItemSize.width, itemViewSize.width);
        itemViewSize.height = fmin(maximumItemSize.height, itemViewSize.height);
        
        BOOL shouldBreakline = i == 0 ? YES : ValueSwitchAlignLeftOrRight(itemViewOrigin.x + self.itemMargins.left + itemViewSize.width + self.padding.right > size.width,
                                                           itemViewOrigin.x - self.itemMargins.right - itemViewSize.width - self.padding.left < 0);
        if (shouldBreakline) {
            // 换行，每一行第一个 item 是不考虑 itemMargins 的
            if (shouldLayout) {
                itemView.frame = CGRectMake(ValueSwitchAlignLeftOrRight(self.padding.left, size.width - self.padding.right - itemViewSize.width), currentRowMaxY + self.itemMargins.top, itemViewSize.width, itemViewSize.height);
            }
            
            itemViewOrigin.x = ValueSwitchAlignLeftOrRight(self.padding.left + itemViewSize.width + self.itemMargins.right, size.width - self.padding.right - itemViewSize.width - self.itemMargins.left);
            itemViewOrigin.y = currentRowMaxY;
        } else {
            // 当前行放得下
            if (shouldLayout) {
                itemView.frame = CGRectMake(ValueSwitchAlignLeftOrRight(itemViewOrigin.x + self.itemMargins.left, itemViewOrigin.x - self.itemMargins.right - itemViewSize.width), itemViewOrigin.y + self.itemMargins.top, itemViewSize.width, itemViewSize.height);
            }
            
            itemViewOrigin.x = ValueSwitchAlignLeftOrRight(itemViewOrigin.x + self.itemMargins.left + self.itemMargins.right + itemViewSize.width,
                                                           itemViewOrigin.x - itemViewSize.width - self.itemMargins.left - self.itemMargins.right);
        }
        
        currentRowMaxY = fmax(currentRowMaxY, itemViewOrigin.y + self.itemMargins.top + self.itemMargins.bottom + itemViewSize.height);
    }
    
    // 最后一行不需要考虑 itemMarins.bottom，所以这里减掉
    currentRowMaxY -= self.itemMargins.bottom;
    
    CGSize resultSize = CGSizeMake(size.width, currentRowMaxY + self.padding.bottom);
    return resultSize;
}

- (NSArray<UIView *> *)visibleSubviews {
    NSMutableArray<UIView *> *visibleItemViews = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0, l = self.subviews.count; i < l; i++) {
        UIView *itemView = self.subviews[i];
        if (!itemView.hidden) {
            [visibleItemViews addObject:itemView];
        }
    }
    
    return visibleItemViews;
}

- (BOOL)shouldAlignRight {
    return self.contentMode == UIViewContentModeRight;
}

@end
