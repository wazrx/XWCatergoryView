//
//  XWCatergoryViewCell.h
//  XWCatergoryView
//
//  Created by YouLoft_MacMini on 16/02/24.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XWCatergoryViewCellModel;
@class XWCatergoryViewProperty;

@interface XWCatergoryViewCell : UICollectionViewCell
@property (nonatomic, copy) XWCatergoryViewCellModel *data;
@property (nonatomic, strong) XWCatergoryViewProperty *property;

/**如果使用系统的reloadData会重新prepareLayout，在这里是没必要且耗性能的，所以我们自己提供一个刷新状态的方法*/
- (void)xw_updateCell;

@end
