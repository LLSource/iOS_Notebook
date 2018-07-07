//
//  BBSGrowTextView.h
//  BBS
//
//  Created by li’Pro on 2018/6/19.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBSGrowTextView : UITextView
/**
 *  The text to be displayed when the text view is empty. The default value is `nil`.
 */
@property (copy, nonatomic, nullable) NSString *placeHolder;

/**
 *  The color of the place holder text. The default value is `[UIColor lightGrayColor]`.
 */
@property (strong, nonatomic) UIColor *placeHolderTextColor;

/**
 *  The insets to be used when the placeholder is drawn. The default value is `UIEdgeInsets(5.0, 7.0, 5.0, 7.0)`.
 */
@property (assign, nonatomic) UIEdgeInsets placeHolderInsets;


/**
 *  Determines whether or not the text view contains text after trimming white space
 *  from the front and back of its string.
 *
 *  @return `YES` if the text view contains text, `NO` otherwise.
 */
//- (BOOL)hasText;

- (void)associateConstraints ;

- (void)autoAdjustContentHeight ;

@end
