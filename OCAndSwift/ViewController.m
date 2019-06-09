//
//  ViewController.m
//  OCAndSwift
//
//  Created by zt on 2019/6/5.
//  Copyright © 2019 zt. All rights reserved.
//

#import "ViewController.h"
#import "OCAndSwift-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(0, 0, 300, 50);
    btn.center = self.view.center;
    [btn setTitle:@"展示swift页面" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(showAlertView) forControlEvents:UIControlEventTouchUpInside];
}

- (void)showAlertView {
    
    ZTSwiftView *view = [[ZTSwiftView alloc]init];
    [self.view addSubview:view];
    
    __weak typeof(view) weakView = view;
    //点了确认后执行此block
    view.selectColorBlockSwift = ^(NSString * _Nonnull str) {
        __strong typeof(weakView) strongView = weakView;
        //将string赋值给view的button
        [strongView reloadBtnTitleWithTitle:str];
    };
}

@end
