//
//  XWCatergoryViewProperty.m
//  XWCatergoryView
//
//  Created by YouLoft_MacMini on 16/02/24.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWCatergoryViewProperty.h"

@implementation XWCatergoryViewProperty

- (instancetype)init
{
    self = [super init];
    if (self) {
        _titleFont = [UIFont systemFontOfSize:15];
        _titleColorChangeEable = YES;
        _titleColor = [UIColor whiteColor];
        _titleSelectColor = [UIColor redColor];
        _itemSpacing = 10;
        _edgeSpacing = 20;
        _scaleRatio = 1.1;
    }
    return self;
}

- (CGFloat)scaleRatio{
    return _scaleEnable ? _scaleRatio : 1.0f;
}

@end
