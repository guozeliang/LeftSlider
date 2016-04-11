//
//  FirstParentViewController.m
//  LeftSlider
//
//  Created by SXTJ on 16/4/8.
//  Copyright © 2016年 SXTJ. All rights reserved.
//

#import "FirstParentViewController.h"
#import "AppDelegate.h"
#import "ZFPopupMenu.h"
#import "ZFPopupMenuItem.h"

@interface FirstParentViewController ()

@property (nonatomic, strong) FirstViewController *messageChildVC;
//@property (nonatomic, strong) FirstChildController *tellPhoneChildVC;
@property (nonatomic, strong) UISegmentedControl *segControl;

@end

@implementation FirstParentViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    // create and add our two children view controllers from our storyboard

    [self navBarInit];
//    [self childVCInit];
    NSLog(@"%@",self.navigationController);
   
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
//    self.edgesForExtendedLayout = UIRectEdgeNone;

    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:YES];
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
    
    NSArray *segArray = @[@"消息",@"电话"];
    self.segControl = [[UISegmentedControl alloc]initWithItems:segArray];
    self.segControl.layer.cornerRadius = 15;
    self.segControl.layer.masksToBounds = YES;
    self.segControl.layer.borderColor = [UIColor whiteColor].CGColor;
    self.segControl.layer.borderWidth = 1.0;
    self.segControl.selectedSegmentIndex = 0;
    self.segControl.frame = CGRectMake(0.0, 0.0, 120, 30);
    self.segControl.tintColor = [UIColor whiteColor];
    //    [self.navigationItem.titleView addSubview:segmentControl];
    [self.segControl addTarget:self action:@selector(segmentControlAction:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = self.segControl;
}
//
//- (void)childVCInit{
//    self.messageChildVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FirstViewController"];
//    [self addChildViewController:self.messageChildVC];
//    [self didMoveToParentViewController:self.messageChildVC];
//    
//    self.tellPhoneChildVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FirstChildController"];
//    [self addChildViewController:self.tellPhoneChildVC];
//    [self didMoveToParentViewController:self.tellPhoneChildVC];
//    
//    // by default child1 should be visible
//    // (note that later, UIStateRestoriation might change this)
//    //
//    [self addChild:self.messageChildVC withChildToRemove:nil];
//}
//
//- (void)addChild:(UIViewController *)childToAdd withChildToRemove:(UIViewController *)childToRemove{
//    assert(childToAdd != nil);
//    
//    if (childToRemove != nil)
//    {
//        [childToRemove.view removeFromSuperview];
//    }
//    
//    // match the child size to its parent
//    CGRect frame = childToAdd.view.frame;
//    frame.size.height = CGRectGetHeight(self.view.frame);
//    frame.size.width = CGRectGetWidth(self.view.frame);
//    childToAdd.view.frame = frame;
//    
//    [self.view addSubview:childToAdd.view];
//}

// user tapped on the segmented control to choose which child is to be visible
//- (void)segmentControlAction:(id)sender
//{
//    UISegmentedControl *segControl = (UISegmentedControl *)sender;
//    
//    UIViewController *childToAdd, *childToRemove;
//    
//    childToAdd = (segControl.selectedSegmentIndex == 0) ? self.messageChildVC : self.tellPhoneChildVC;
//    childToRemove = (segControl.selectedSegmentIndex == 0) ? self.tellPhoneChildVC : self.messageChildVC;
//    
//    [self addChild:childToAdd withChildToRemove:childToRemove];
//}


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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark - UIStateRestoration

// encodeRestorableStateWithCoder is called when the app is suspended to the background
//- (void)encodeRestorableStateWithCoder:(NSCoder *)coder
//{
//    NSLog(@"ParentViewController: encodeRestorableStateWithCoder");
//    
//    // remember our children view controllers
//    [coder encodeObject:self.messageChildVC forKey:@"messageChildVC"];
//    [coder encodeObject:self.tellPhoneChildVC forKey:@"tellPhoneChildVC"];
//    
//    
//    // remember the segmented control state
//    [coder encodeInteger:self.segControl.selectedSegmentIndex forKey:@"selectedIndex"];
//    
//    [super encodeRestorableStateWithCoder:coder];
//}
//
//// decodeRestorableStateWithCoder is called when the app is re-launched
//- (void)decodeRestorableStateWithCoder:(NSCoder *)coder
//{
//    NSLog(@"ParentViewController: decodeRestorableStateWithCoder");
//    
//    // find out which child was the current visible view controller
//    self.segControl.selectedSegmentIndex = [coder decodeIntegerForKey:@"selectedIndex"];
//    
//    // call our segmented control to set the right visible child
//    // (note that we already previously have already loaded both children view controllers in viewDidLoad)
//    //
//    [self segmentControlAction:self.segControl];
//    
//    [super decodeRestorableStateWithCoder:coder];
//}

#pragma mark - PopMenu Founciton

- (void)PopMenuClik:(UIButton*)sender {
    CGRect tmpFrame = sender.frame;
    tmpFrame.origin.y += 20;
    ZFPopupMenu *popupMenu = [[ZFPopupMenu alloc] initWithItems:[self menuItems]];
    [ZFPopupMenu setSeparationLineColor:[UIColor lightGrayColor]];
    //    [ZFPopupMenu setMenuBackgroundColorWithRed:1.0 green:1.0 blue:1.0 aphla:1];
    [popupMenu showInView:self.tabBarController.view fromRect:tmpFrame layoutType:Vertical];
    [self.tabBarController.view addSubview:popupMenu];
    
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
