//
//  ViewController.m
//  LeftSlider
//
//  Created by SXTJ on 16/4/1.
//  Copyright © 2016年 SXTJ. All rights reserved.
//

#import "MainPageViewController.h"
#import "AppDelegate.h"

@interface MainPageViewController ()

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addHeaderBtn];
    self.tabBar.tintColor = [UIColor colorWithRed:26.0/255.0 green:165.0/255.0 blue:235.0/255.0 alpha:1.0];
}

- (void)addHeaderBtn{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"header.png"]
                      forState:UIControlStateNormal];
    [button addTarget:self action:@selector(openLeftVCAction) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0.0, 0.0, 40, 40);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    
    
}

- (void)openLeftVCAction
{
    AppDelegate * tempAppDelegate = [[UIApplication sharedApplication]delegate];
    if (tempAppDelegate.LeftSlideVC.closed) {
        [tempAppDelegate.LeftSlideVC openLeftView];
    }
    else
    {
        [tempAppDelegate.LeftSlideVC closeLeftView];
    }
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    AppDelegate * tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
