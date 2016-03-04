//
//  XWCatergoryViewCell.m
//  XWCatergoryView
//
//  Created by YouLoft_MacMini on 16/02/24.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWCatergoryViewCell.h"
#import "XWCatergoryViewCellModel.h"
#import "XWCatergoryViewProperty.h"
#import "UIColor+XWAdd.h"
#import "UIView+FrameChange.h"

@interface XWCatergoryViewCell ()
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *colorLabel;
@property (nonatomic, weak) CAShapeLayer *titlemaskLayer;
@property (nonatomic, weak) CAShapeLayer *colormaskLayer;

@end

@implementation XWCatergoryViewCell

#pragma mark - initialize methods

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self xwp_initializeUI];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _titleLabel.frame = _colorLabel.frame = self.bounds;
}

- (void)xwp_initializeUI{
    self.backgroundColor = [UIColor clearColor];
    UILabel *titleLabel = [UILabel new];
    _titleLabel = titleLabel;
    titleLabel.textAlignment = 1;
    [self.contentView addSubview:titleLabel];
    UILabel *colorLabel = [UILabel new];
    colorLabel.textColor = [UIColor orangeColor];
    _colorLabel = colorLabel;
    colorLabel.frame = self.bounds;
    colorLabel.textAlignment = 1;
    [self.contentView addSubview:colorLabel];
    CAShapeLayer *titlemaskLayer = [CAShapeLayer new];
     _titlemaskLayer = titlemaskLayer;
    titleLabel.layer.mask = titlemaskLayer;
    CAShapeLayer *colormaskLayer = [CAShapeLayer new];
    _colormaskLayer = colormaskLayer;
    colorLabel.layer.mask = colormaskLayer;
    
    
}

#pragma mark - setter methods

- (void)setProperty:(XWCatergoryViewProperty *)property{
    _property = property;
    _colorLabel.font = _titleLabel.font = property.titleFont;
    _colorLabel.textColor = _property.titleSelectColor;
    _titleLabel.textColor = _property.titleColor;
}

- (void)setData:(XWCatergoryViewCellModel *)data{
    _data = data;
    _colorLabel.text = _titleLabel.text = data.title;
    [self xw_updateCell];
}

#pragma mark - private methods

- (void)xwp_interpolationColor{
    CGRect titleMaskRect = CGRectZero;
    CGRect colorMaskRect = CGRectZero;
    if (_property.titleColorChangeEable) {
        if (_property.titleColorChangeGradually) {
            _colorLabel.hidden = NO;
            if (_data.ratio >= _data.index) {
                titleMaskRect = CGRectMake(0, 0, self.width * (1 - _data.valueRatio), self.height);
                colorMaskRect = CGRectMake(self.width * (1 - _data.valueRatio), 0, self.width * _data.valueRatio, self.height);
            }else{
                titleMaskRect = CGRectMake(self.width * _data.valueRatio, 0, self.width * (1 - _data.valueRatio), self.height);
                colorMaskRect = CGRectMake(0, 0, self.width * _data.valueRatio, self.height);
            }
            _titlemaskLayer.path = [UIBezierPath bezierPathWithRect:titleMaskRect].CGPath;
            _colormaskLayer.path = [UIBezierPath bezierPathWithRect:colorMaskRect].CGPath;
            
        }else{
            _colorLabel.hidden = YES;
            _titleLabel.layer.mask = nil;
            _titleLabel.textColor = [UIColor xw_colorWithInterpolationFromValue:_property.titleColor toValue:_property.titleSelectColor ratio:_data.valueRatio];
            
        }
    }else{
        _colorLabel.hidden = YES;
        _titleLabel.layer.mask = nil;
    }
}

- (void)xwp_interpolationScale{
    
    CGFloat scale = [self xwp_interpolationFromValue:1 toValue:_property.scaleRatio ratio:_data.valueRatio];
    //不能单单对titleLabel进行transform变换，因为有可能变化后超出cell大小文字显示不全；
    self.transform  = CGAffineTransformMakeScale(scale, scale);
}



/**
 *  插值公式
 */
- (CGFloat)xwp_interpolationFromValue:(CGFloat)from toValue:(CGFloat)to ratio:(CGFloat)ratio{
    return from + (to - from) * ratio;
}

#pragma mark - public methods

- (void)xw_updateCell{
    //插值titleColor
    [self xwp_interpolationColor];
    //插值scale
    [self xwp_interpolationScale];
}

@end
