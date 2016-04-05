//
//  ViewController.m
//  LeftSlider
//
//  Created by SXTJ on 16/4/1.
//  Copyright © 2016年 SXTJ. All rights reserved.
//

#import "MainPageViewController.h"
#import "AppDelegate.h"
#import "ZFPopupMenu.h"
#import "ZFPopupMenuItem.h"


@interface MainPageViewController ()

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self navBarInit];
    self.tabBar.tintColor = [UIColor colorWithRed:26.0/255.0 green:165.0/255.0 blue:235.0/255.0 alpha:1.0];
}

- (void)navBarInit{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"header.png"]
                      forState:UIControlStateNormal];
    [button addTarget:self action:@selector(openLeftVCAction) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0.0, 0.0, 40, 40);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
//    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"header.png"] style:UIBarButtonItemStylePlain target:self action:@selector(openLeftVCAction)];
//    self.navigationItem.leftBarButtonItem = leftItem;

    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"pop_menu.png"]
                      forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(PopMenuClik:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.frame = CGRectMake(0.0, 0.0, 20, 20);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"pop_menu.png"] style:UIBarButtonItemStylePlain target:self action:@selector(PopMenuClik:)];
//    self.navigationItem.rightBarButtonItem = rightItem;

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

#pragma mark - PopMenu Founciton

- (void)PopMenuClik:(UIButton*)sender {
    CGRect tmpFrame = sender.frame;
    tmpFrame.origin.y += 20;
    ZFPopupMenu *popupMenu = [[ZFPopupMenu alloc] initWithItems:[self menuItems]];
    [ZFPopupMenu setSeparationLineColor:[UIColor lightGrayColor]];
    [popupMenu showInView:self.navigationController.view fromRect:tmpFrame layoutType:Vertical];
    [self.navigationController.view addSubview:popupMenu];
    
}

-(NSArray *)menuItems
{
    ZFPopupMenuItem *item1 = [ZFPopupMenuItem initWithMenuName:@"扫一扫"
                                                         image:[UIImage imageNamed:@"right_menu_QR"]
                                                        action:@selector(test1)
                                                        target:self];
    ZFPopupMenuItem *item2 = [ZFPopupMenuItem initWithMenuName:@"加好友"
                                                         image:[UIImage imageNamed:@"right_menu_addFri"]
                                                        action:@selector(test2)
                                                        target:self];
    ZFPopupMenuItem *item3 = [ZFPopupMenuItem initWithMenuName:@"创建讨论组"
                                                         image:[UIImage imageNamed:@"right_menu_multichat"]
                                                        action:@selector(test3)
                                                        target:self];
    ZFPopupMenuItem *item4 = [ZFPopupMenuItem initWithMenuName:@"发送到电脑"
                                                         image:[UIImage imageNamed:@"right_menu_sendFile"]
                                                        action:@selector(test4)
                                                        target:self];
    ZFPopupMenuItem *item5 = [ZFPopupMenuItem initWithMenuName:@"面对面快传"
                                                         image:[UIImage imageNamed:@"right_menu_facetoface"]
                                                        action:@selector(test5)
                                                        target:self];
    
    return @[item1,item2,item3,item4,item5];
    
}


-(void)test1
{
    NSLog(@"新建");
}

-(void)test2
{
    NSLog(@"新建测试占位符");
}

-(void)test3
{
    NSLog(@"新建占位符");
}

-(void)test4
{
    NSLog(@"新建占位符占位符");
}

-(void)test5
{
    NSLog(@"新建占位符占位符");
}

@end
