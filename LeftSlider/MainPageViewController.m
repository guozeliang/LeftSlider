//
//  ViewController.m
//  LeftSlider
//
//  Created by SXTJ on 16/4/1.
//  Copyright © 2016年 SXTJ. All rights reserved.
//

#import "MainPageViewController.h"

@interface MainPageViewController ()

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tabBar.tintColor = [UIColor colorWithRed:26.0/255.0 green:165.0/255.0 blue:235.0/255.0 alpha:1.0];
//    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
