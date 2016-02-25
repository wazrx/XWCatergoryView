//
//  UIActivityIndicatorView+XWAdd.h
//  WxSelected
//
//  Created by YouLoft_MacMini on 15/12/23.
//  Copyright © 2015年 wazrx. All rights reserved.
//

#import <UIKit/UIKit.h>

/**设置主题色*/
#define indicatorColor [UIColor redColor]

@interface UIActivityIndicatorView (XWAdd)
+ (void)xw_showAnimationInView:(UIView *)view;
+ (void)xw_stopAnimationInView:(UIView *)view;
+ (BOOL)xw_isAnimatingInView:(UIView *)view;
@end
