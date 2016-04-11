//
//  FirstViewController.m
//  LeftSlider
//
//  Created by SXTJ on 16/4/5.
//  Copyright © 2016年 SXTJ. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"
#import "FirstTableViewCell.h"
#import "SearchResultsTableViewController.h"
#import "ZFPopupMenu.h"
#import "ZFPopupMenuItem.h"

@interface FirstViewController ()<UISearchDisplayDelegate>

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) UISegmentedControl *segControl;

@end

@implementation FirstViewController

@synthesize sourceArray;
@synthesize resultArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    
    [self navBarInit];
    if (sourceArray == nil) {
        sourceArray = [NSMutableArray arrayWithObjects:@"刘省伟",@"王伯虎",@"明天",@"史九元",@"赵东林",@"启明星",@"鹏程",@"黄双",@"黄文",@"王转",@"刘建飞",@"刘晓康", nil];
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


- (void)openLeftVCAction
{
    AppDelegate * tempAppDelegate = [[UIApplication sharedApplication]delegate];
    if (tempAppDelegate.LeftSlideVC.closed) {
        [tempAppDelegate.LeftSlideVC openLeftView];
    }else{
        [tempAppDelegate.LeftSlideVC closeLeftView];
    }
}

// user tapped on the segmented control to choose which child is to be visible
- (void)segmentControlAction:(UISegmentedControl *)sender{
    if (sender.selectedSegmentIndex == 0) {
        
        self.sourceArray = [NSMutableArray arrayWithObjects:@"刘省伟",@"王伯虎",@"明天",@"史九元",@"赵东林",@"启明星",@"鹏程",@"黄双",@"黄文",@"王转",@"刘建飞",@"刘晓康", nil];
    }else{
        self.sourceArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12", nil];;
    }
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return resultArray.count;
    }
    return sourceArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    if(tableView == self.searchDisplayController.searchResultsTableView)
//    {
//        static NSString *CellIdentifier = @"cell";
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//        
//        if(cell == nil)
//        {
//            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
//                                          reuseIdentifier:CellIdentifier];
//        }
//        cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];//[search objectAtIndex:indexPath.row];
//        return cell;
//    }else{
        FirstTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"FIRST_CELL" forIndexPath:indexPath];
        // Configure the cell...
        cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"header%d",indexPath.row+1]];
        if(tableView == self.searchDisplayController.searchResultsTableView){
            cell.name.text = resultArray[indexPath.row];
        }else{
            cell.name.text = sourceArray[indexPath.row];
        }
        return cell;
//    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [sourceArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UISearchDisplayDelegate

// return YES to reload table. called when search string/option changes. convenience methods on top UISearchBar delegate methods
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    // 谓词的包含语法,之前文章介绍过http://www.cnblogs.com/xiaofeixiang/
    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchString];
    if (self.resultArray!= nil) {
        [self.resultArray removeAllObjects];
    }
    //过滤数据
    self.resultArray= [NSMutableArray arrayWithArray:[self.sourceArray  filteredArrayUsingPredicate:preicate]];
    //刷新表格
    return YES;
}

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
