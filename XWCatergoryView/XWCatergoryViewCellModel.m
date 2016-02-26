//
//  XWCatergoryViewCellModel.m
//  XWCatergoryView
//
//  Created by YouLoft_MacMini on 16/02/24.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWCatergoryViewCellModel.h"

@implementation XWCatergoryViewCellModel

- (CGRect)cellFrame{
    return CGRectMake(_cellCenter.x - _cellSize.width / 2.0f, _cellCenter.y - _cellSize.height / 2.0f, _cellSize.width, _cellSize.height);
}

- (CGRect)backEllipseFrame{
    if (CGSizeEqualToSize(CGSizeZero, _backEllipseSize)) {
        return CGRectMake(_cellCenter.x - _cellSize.width / 2.0f - 5, _cellCenter.y - _cellSize.height / 2.0f - 2, _cellSize.width + 10, _cellSize.height + 4);
    }else{
        return CGRectMake(_cellCenter.x - _backEllipseSize.width / 2.0f, _cellCenter.y - _backEllipseSize.height / 2.0f, _backEllipseSize.width, _backEllipseSize.height);
    }
}

- (CGFloat)valueRatio{
    return (1 - fabs(_ratio - _index)) <= 0 ? 0 : (1 - fabs(_ratio - _index));
}

@end
