//
//  XWCatergoryViewCellModel.h
//  XWCatergoryView
//
//  Created by YouLoft_MacMini on 16/02/24.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XWCatergoryViewCellModel : NSObject
@property (nonatomic, assign) NSUInteger index;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) CGFloat ratio;
@property (nonatomic, assign) CGFloat valueRatio;
@property (nonatomic, assign) CGSize cellSize;
@property (nonatomic, assign) CGPoint cellCenter;
@property (nonatomic, assign,readonly) CGRect cellFrame;
@property (nonatomic, assign, readonly) CGRect backEllipseFrame;
@property (nonatomic, assign) CGSize backEllipseSize;


@end
