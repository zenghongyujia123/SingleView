//
//  ViewController.m
//  SingleView
//
//  Created by zenghong on 16/8/3.
//  Copyright © 2016年 zenghong. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController_Second.h"

#define kTimeInterval 0.8

@interface ViewController ()

@end

@implementation ViewController{
    NSTimer *_timer;
    CGFloat _widthRatio;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupDemoViews];
    
    _widthRatio = 0.4;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:kTimeInterval target:self selector:@selector(animation) userInfo:nil repeats:YES];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.button.sd_layout
    .rightSpaceToView(self.view, 20)
    .topSpaceToView(self.view ,20)
    .heightIs(20)
    .widthIs(40);

    [self.button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.button setTitle:@"跳转" forState:UIControlStateNormal];
    
    self.view0.sd_layout
    .leftSpaceToView(self.view, 20)
    .topSpaceToView(self.view,80)
    .heightIs(130)
    .widthRatioToView(self.view, _widthRatio);
    
    self.view1.sd_layout
    .leftSpaceToView(self.view0, 10)
    .topEqualToView(self.view0)
    .heightIs(60)
    .widthRatioToView(self.view0, 0.5);
    
    self.view2.sd_layout
    .leftSpaceToView(self.view1, 10)
    .topEqualToView(self.view1)
    .heightRatioToView(self.view1, 1)
    .widthIs(50);
    
    self.view3.sd_layout
    .leftEqualToView(self.view1)
    .topSpaceToView(self.view1, 10)
    .heightRatioToView(self.view1, 1)
    .widthRatioToView(self.view1, 1);
    
    self.view4.sd_layout
    .leftEqualToView(self.view2)
    .topEqualToView(self.view3)
    .heightRatioToView(self.view3, 1)
    .widthRatioToView(self.view2, 1);
    
    
    [self.view0 addSubview:self.view5];
    self.view5.sd_layout
    .centerYEqualToView(self.view0)
    .rightSpaceToView(self.view0, 10)
    .widthRatioToView(self.view0, 0.5)
    .heightIs(20);

}

-(void)buttonClick{
    NSLog(@"tap a button");
    
    UIViewController_Second *secondViewController = [[UIViewController_Second alloc] init];
    
    [self.navigationController pushViewController:secondViewController animated:YES];
    
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"hELLE LO" message:@"HAHAH" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
//    [alertView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupDemoViews
{
    UIView *view0 = [UIView new];
    view0.backgroundColor = [UIColor redColor];
    self.view0 = view0;
    
    UIView *view1 = [UIView new];
    view1.backgroundColor = [UIColor grayColor];
    self.view1 = view1;
    
    UIView *view2 = [UIView new];
    view2.backgroundColor = [UIColor brownColor];
    self.view2 = view2;
    
    UIView *view3 = [UIView new];
    view3.backgroundColor = [UIColor orangeColor];
    self.view3 = view3;
    
    UIView *view4 = [UIView new];
    view4.backgroundColor = [UIColor purpleColor];
    self.view4 = view4;
    
    UIView *view5 = [UIView new];
    view5.backgroundColor = [UIColor yellowColor];
    self.view5 = view5;
    
    UIButton *button = [UIButton new];
    button.backgroundColor=[UIColor blueColor];
    self.button = button;
    
    [self.view sd_addSubviews:@[view0, view1, view2, view3, view4, view5,button]];
}

- (void)animation
{
    if (_widthRatio >= 0.4) {
        _widthRatio = 0.1;
    } else {
        _widthRatio = 0.4;
    }
    
    // 开启动画
    [UIView animateWithDuration:0.8 animations:^{
        self.view0.sd_layout
        .widthRatioToView(self.view, _widthRatio);
        [self.view0 updateLayout]; // 调用此方法开启view0动画效果
        [self.view5 updateLayout]; // 调用此方法开启view5动画效果
        /*
         调用[self.view0 updateLayout]就可以实现view0和其它兄弟view一起动画，view0和view5是父子关系，如果view0需要动画要再主动调用一次[self.view5 updateLayout]
         */
    }];
    
    
    /*
     
     SDAutoLayout（新建QQ交流群：497140713）
     github:https://github.com/gsdios/SDAutoLayout
     ☆☆ SDAutoLayout 视频教程：http://www.letv.com/ptv/vplay/24038772.html ☆☆
     一行代码搞定自动布局！致力于做最简单易用的Autolayout库。The most easy way for autolayout.
     
     */
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [_timer invalidate];
    _timer = nil;
}

@end
