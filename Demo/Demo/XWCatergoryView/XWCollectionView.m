//
//  XWCollectionView.m
//  Demo
//
//  Created by YouLoft_MacMini on 16/3/3.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWCollectionView.h"

@implementation XWCollectionView

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.layer insertSublayer:self.backLayer atIndex:0];
}
@end
