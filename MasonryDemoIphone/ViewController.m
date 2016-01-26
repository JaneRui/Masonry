//
//  ViewController.m
//  MasonryDemoIphone
//
//  Created by 千锋 on 16/1/26.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()
{
    UISlider *_slider;
    UIView *_bgView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSlider];
    [self setupView];
}

- (void)setupSlider
{
    _slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 20, self.view.frame.size.width-100, 20)];
    _slider.minimumValue = 100.0;
    _slider.maximumValue = self.view.frame.size.width - 100;
    _slider.value = 100;
    [_slider addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_slider];
}

- (void)changeValue:(UISlider *)slider
{
    _bgView.frame = CGRectMake(50, 50, _slider.value, _slider.value);
}

- (void)setupView
{
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    _bgView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_bgView];
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    [_bgView addSubview:view];
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor blueColor];
    [_bgView addSubview:view2];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        // Y轴中心
        make.centerY.mas_equalTo(_bgView.mas_centerY);
        make.left.mas_equalTo(_bgView.mas_left).offset(20);
        make.right.mas_equalTo(view2.mas_left).offset(-20);
        make.width.mas_equalTo(view2.mas_width);
        make.height.mas_equalTo(@100);
    }];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        // Y轴中心
        make.centerY.mas_equalTo(_bgView.mas_centerY);
        make.left.mas_equalTo(view.mas_right).offset(20);
        make.right.mas_equalTo(_bgView.mas_right).offset(-20);
        make.width.mas_equalTo(view.mas_width);
        make.height.mas_equalTo(@100);
    }];
    
    
//    // 加约束
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        // size
//        make.size.mas_equalTo(CGSizeMake(100, 100));
//        // center
////        make.center.mas_equalTo(_bgView);
////        make.top.mas_equalTo(_bgView.mas_top).offset(20);
////        make.left.mas_equalTo(_bgView.mas_left).offset(20);
////        make.bottom.mas_equalTo(_bgView.mas_bottom).offset(-20);
////        make.right.mas_equalTo(_bgView.mas_right).offset(-20);
//        make.edges.mas_equalTo(_bgView).insets(UIEdgeInsetsMake(20, 20, 20, 20));
//    }];
    
    
}

@end
