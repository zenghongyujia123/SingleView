//
//  ViewController.m
//  SingleView
//
//  Created by zenghong on 16/8/3.
//  Copyright © 2016年 zenghong. All rights reserved.
//

#import "UIViewController_Second.h"

@interface UIViewController_Second ()

@end

@implementation UIViewController_Second{

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray *arr = [NSArray arrayWithObjects:@"1",@"2", nil];
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:arr];
    self.navigationItem.titleView = segment;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
