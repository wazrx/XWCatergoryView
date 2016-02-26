//
//  ThreeController.m
//  Demo
//
//  Created by YouLoft_MacMini on 16/2/24.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "ThreeController.h"
#import "XWCatergoryView.h"
#import "XWCollectionViewCell.h"
#import "UIView+FrameChange.h"
#import "UICollectionViewFlowLayout+XWFullItem.h"
#import "UIActivityIndicatorView+XWAdd.h"
#import "Masonry/Masonry.h"

@interface ThreeController ()<UICollectionViewDataSource, UICollectionViewDelegate, XWCatergoryViewDelegate>
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, weak) XWCatergoryView *catergoryView;
@property (nonatomic, weak) UICollectionView *mainView;
@end

@implementation ThreeController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    //主collectionView
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumInteritemSpacing = layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.fullItem = YES;
    UICollectionView *mainView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    _mainView = mainView;
    mainView.backgroundColor = [UIColor whiteColor];
    mainView.dataSource = self;
    mainView.delegate = self;
    mainView.pagingEnabled = YES;
    mainView.scrollsToTop = NO;
    mainView.showsHorizontalScrollIndicator = NO;
    [mainView registerClass:[XWCollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self.view addSubview:mainView];
    [mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
    }];
    //catergoryView
    XWCatergoryView * catergoryView = [XWCatergoryView new];
    _catergoryView = catergoryView;
    catergoryView.titles = self.titles;
    catergoryView.scrollView = mainView;
    catergoryView.delegate = self;
    catergoryView.backgroundColor = [UIColor grayColor];
    //刷新后保持原来的index
    catergoryView.holdLastIndexAfterUpdate = YES;
    //开启缩放
    catergoryView.scaleEnable = YES;
    //设置缩放等级
    catergoryView.scaleRatio = 1.2;
    //开启点击item滑动scrollView的动画
    catergoryView.scrollWithAnimaitonWhenClicked = YES;
    [self.view addSubview:catergoryView];
    [catergoryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(64);
        make.height.equalTo(@50);
        make.bottom.equalTo(mainView.mas_top);
    }];
    UIBarButtonItem *loadButton = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(xwp_netReload:)];
    self.navigationItem.rightBarButtonItem = loadButton;
    
}

- (NSArray *)titles{
    if (!_titles) {
        _titles = @[@"热门", @"新上榜", @"连载",@"七日热门"];
    }
    return _titles;
}


/**模拟网络刷新*/
- (void)xwp_netReload:(UIBarButtonItem *)sender{
    sender.enabled = NO;
    [UIActivityIndicatorView xw_showAnimationInView:self.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (_titles.count == 4) {
            _titles = @[@"热门", @"新上榜", @"连载", @"生活家",@"世间事", @"@IT", @"市集", @"七日热门", @"三十日热门"];
            _catergoryView .itemSpacing = 30;
            
        }else{
            _titles = @[@"热门", @"新上榜", @"连载",@"七日热门"];
        }
        [UIActivityIndicatorView xw_stopAnimationInView:self.view];
        sender.enabled = YES;
        //重新设置数据源
        _catergoryView.titles = _titles;
        //调用如下方法，刷新控件数据
        [_catergoryView xw_realoadData];
        //刷新你自己的collectionview数据
        [_mainView reloadData];
    });
}

/**监听item点击*/
- (void)catergoryView:(XWCatergoryView *)catergoryView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了%zd个item", indexPath.item);
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.titles.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XWCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:(arc4random() % 255) / 255.0f green:(arc4random() % 255) / 255.0f blue:(arc4random() % 255) / 255.0f alpha:1.0];
    cell.title = _titles[indexPath.item];
    return cell;
}


@end
