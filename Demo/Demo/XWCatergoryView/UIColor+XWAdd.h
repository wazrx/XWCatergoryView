//
//  UIColor+XWAdd.h
//  WxSelected
//
//  Created by YouLoft_MacMini on 15/12/18.
//  Copyright © 2015年 wazrx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (XWAdd)
/**
 *  颜色转RGB
 */
+ (NSArray *)xw_changeColorToRGB:(UIColor *)color;

/**
 *  16进制颜色字符串转UIColor
 *
 *  @param stringToConvert 16进制颜色字符串（如：#FFE326）
 *
 *  @return 对应的IColor
 */
+ (UIColor *)xw_colorWithHexString:(NSString *)stringToConvert;
/**
 *  插值两种颜色返回中间的颜色
 *
 *  @param from  起始颜色
 *  @param to    终止颜色
 *  @param ratio 插值比例
 *
 *  @return 插值色
 */
+ (UIColor *)xw_colorWithInterpolationFromValue:(UIColor *)from toValue:(UIColor *)to ratio:(CGFloat)ratio;

@end
