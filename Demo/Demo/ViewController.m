//
//  ViewController.m
//  Demo
//
//  Created by YouLoft_MacMini on 16/2/22.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Demo";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (NSArray *)data{
    if (!_data) {
        _data = @[@"颜色左右渐变 + 底部线条", @"颜色变化 + 背后椭圆", @"颜色变化 + 文字缩放 + 模拟网络刷新"];
    }
    return _data;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _data[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *names =  @[@"OneController", @"TwoController", @"ThreeController"];
    UIViewController *vc = [[NSClassFromString(names[indexPath.row]) alloc] init];
    vc.title = _data[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
