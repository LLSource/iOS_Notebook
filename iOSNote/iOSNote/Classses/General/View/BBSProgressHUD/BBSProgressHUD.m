//
//  BBSProgressHUD.m
//  BBS
//
//  Created by li’Pro on 2018/3/21.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "BBSProgressHUD.h"
#import <MBProgressHUD/MBProgressHUD.h>

CGFloat const kTipDuration = 0.75;

@implementation BBSProgressHUD
+ (void)load {
    [MBProgressHUD appearance].margin = 10;
//    [MBProgressHUD appearance].minSize = CGSizeMake(200, 54);
}
+ (void)showToView:(UIView *)view text:(NSString *)text {
    if (!view) return;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    hud.margin = 10;
    hud.label.text = text; //[NSString stringWithFormat:@"      %@      ", text];
    hud.minSize = CGSizeMake(250, 54);
    hud.label.font = [UIFont systemFontOfSize:17];
    hud.contentColor = [UIColor whiteColor];
    hud.mode = MBProgressHUDModeText;
    
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    
    [hud hideAnimated:YES afterDelay:kTipDuration];
}
+ (void)showLoadingToView:(UIView *)view {
    if (!view) return;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    // Set the custom view mode to show any view.
    hud.mode = MBProgressHUDModeCustomView;
    // Set an image view with a checkmark.
   
    NSUInteger count = 19;
    NSMutableArray<UIImage *> *arrImage = [[NSMutableArray alloc] initWithCapacity:count];
    for (int i = 1; i<count; i++) {
        NSString *name = [NSString stringWithFormat:@"loading_%02d", i];
        UIImage *image = [UIImage imageNamed:name];
        [arrImage addObject:image];
    }
    
    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.animationImages = arrImage;
    imgView.animationDuration = 1;
    [imgView startAnimating];
    
    hud.customView = imgView;
    // Looks a bit nicer if we make it square.
    //    hud.square = YES;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor clearColor];
    hud.removeFromSuperViewOnHide = YES;
    [hud showAnimated:YES];
}

+ (void)showLoadingToView:(UIView *)view text:(NSString *)text {
    if (!view) return;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    // Set some text to show the initial status.
    hud.label.text = text;
    hud.label.font = [UIFont systemFontOfSize:17];
    hud.contentColor = [UIColor whiteColor];
    // Will look best, if we set a minimum size.
    hud.minSize = CGSizeMake(100.f, 100.f);
    
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        // Do something useful in the background and update the HUD periodically.
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
        });
    });
}

+ (BOOL)hideHUDForView:(UIView *)view { 
    return [self hideHUDForView:view animated:YES];
}
+ (BOOL)hideHUDForView:(UIView *)view animated:(BOOL)animated {
    return [MBProgressHUD hideHUDForView:view animated:animated];
}

@end
















