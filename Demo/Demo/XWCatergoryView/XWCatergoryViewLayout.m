//
//  XWCatergoryViewLayout.m
//  XWCatergoryView
//
//  Created by YouLoft_MacMini on 16/02/24.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWCatergoryViewLayout.h"
#import "XWCatergoryViewProperty.h"
#import "XWCatergoryViewCellModel.h"
#import "NSString+SizeToFit.h"
#import "UIView+FrameChange.h"

@interface XWCatergoryViewLayout ()
@property (nonatomic, copy) NSMutableArray *attrs;
@property (nonatomic, assign) CGFloat contentWidth;
@property (nonatomic, assign) CGFloat totleTitleWidth;
@property (nonatomic, assign) CGFloat totleCenterX;
@property (nonatomic, assign) BOOL needScroll;
@property (nonatomic, assign) CGFloat realItemSpacing;
@end

@implementation XWCatergoryViewLayout


#pragma mark - overWrite methods

- (void)prepareLayout{
    [super prepareLayout];
//    NSLog(@"prepareLayout");
    _contentWidth = 0;
    _realItemSpacing = _property.itemSpacing;
    //把所有title组合成一个字符串计算所有的文字的宽度
    NSString * allTitles = [_property.titles componentsJoinedByString:@""];
    _totleTitleWidth = [allTitles xw_sizeWithfont:_property.titleFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)].width;
    //计算contentWidth
    _contentWidth = _totleTitleWidth + _property.edgeSpacing * 2 + _realItemSpacing * (_property.data.count - 1);
    _property.contentWidth = _contentWidth;
    //判断是否需要滚动
    _needScroll = _contentWidth > self.collectionView.width;
    //如果不需要滚动，说明如果按用户设置的属性可能无法正确布局，我们自行改变itemSpacing进行均布
    if (!_needScroll) {
        _realItemSpacing = (self.collectionView.bounds.size.width - _totleTitleWidth - _property.edgeSpacing * 2) / (float)(_property.data.count - 1);
        _contentWidth = self.collectionView.width;
    }
    _totleCenterX = _property.edgeSpacing - _realItemSpacing;
    _attrs = @[].mutableCopy;
    //开始计算每个item的属性确定其size和center
    for (int i = 0; i < _property.data.count; i++) {
        [_attrs addObject:[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]]];
    }
}

/**根据prepareLayout计算结果返回正确的contentsize*/
- (CGSize)collectionViewContentSize{
    return CGSizeMake(_contentWidth, self.collectionView.bounds.size.height);
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return [self xwp_itemLayoutAttributesPathInRect:rect];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    XWCatergoryViewCellModel *model = _property.data[indexPath.item];
    //计算每个item的size
    CGSize size = [model.title xw_sizeWithfont:_property.titleFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
//    attr.size = size;
    attr.size = CGSizeMake(size.width + _realItemSpacing, self.collectionView.height);
    model.cellSize = size;
    //计算每个item的center
    CGFloat centerX = _totleCenterX + _realItemSpacing + size.width / 2.0f;
    _totleCenterX = centerX + size.width / 2.0f;
    CGPoint center = CGPointMake(centerX, self.collectionView.height / 2.0f);
    if (_property.data.count < 2) {
        center = CGPointMake(self.collectionView.width / 2.0f, self.collectionView.height / 2.0f);
    }
    model.cellCenter = center;
    attr.center = center;
    return attr;
}

#pragma mark - private methods

- (NSArray<UICollectionViewLayoutAttributes *> *)xwp_itemLayoutAttributesPathInRect:(CGRect)rect{
    NSMutableArray *temp = @[].mutableCopy;
    for (int i = 0; i < _attrs.count; i ++) {
        UICollectionViewLayoutAttributes *attr = _attrs[i];
        //判断该item是否和屏幕相交或者包含，满足相交和包含才需要返回，不应该一次返回所有的attrs，虽然可行但是性能不好
        if (CGRectContainsRect(rect, attr.frame) || CGRectIntersectsRect(rect, attr.frame)) {
            [temp addObject:attr];
        }
    }
    return temp.copy;
}

@end

