//
//  XWCollectionViewCell.m
//  Demo
//
//  Created by wazrx on 16/2/24.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWCollectionViewCell.h"
#import "Masonry.h"

@interface XWCollectionViewCell ()
@property (nonatomic, weak) UILabel *label;
@end

@implementation XWCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [UILabel new];
        _label = label;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
    }
    return self;
}

- (void)setTitle:(NSString *)title{
    _title = title;
    _label.text = title;
}

@end
