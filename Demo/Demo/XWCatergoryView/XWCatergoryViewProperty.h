//
//  XWCatergoryViewProperty.h
//  XWCatergoryView
//
//  Created by YouLoft_MacMini on 16/02/24.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XWCatergoryViewProperty : NSObject

#pragma mark - Data

@property (nonatomic, copy) NSArray *titles;
/**cell模型数据数组*/
@property (nonatomic, copy) NSArray *data;

#pragma mark - item

/**item间距，默认10*/
@property (nonatomic, assign) CGFloat itemSpacing;
/**左右边缘间距，默认20*/
@property (nonatomic, assign) CGFloat edgeSpacing;
/**item字体，默认15*/
@property (nonatomic, strong) UIFont *titleFont;

#pragma mark - titleColor
/**是否开启文字颜色变化效果，默认YES*/
@property (nonatomic, assign) BOOL titleColorChangeEable;
/**是否开启文字颜色变化渐变，默认NO，如果设置该效果YES需要先保证titleColorChangeEable为YES*/
@property (nonatomic, assign) BOOL titleColorChangeGradually;
/**edge间距， 默认 白色*/
@property (nonatomic, strong) UIColor *titleColor;
/**edge间距， 默认 红色*/
@property (nonatomic, strong) UIColor *titleSelectColor;

#pragma mark - scale

@property (nonatomic, assign) BOOL scaleEnable;
@property (nonatomic, assign) CGFloat scaleRatio;
@property (nonatomic, assign) CGFloat contentWidth;


@end
