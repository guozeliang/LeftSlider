//
//  FirstViewController.m
//  LeftSlider
//
//  Created by SXTJ on 16/4/5.
//  Copyright © 2016年 SXTJ. All rights reserved.
//

#import "FirstViewController.h"
//#import "AppDelegate.h"
#import "FirstTableViewCell.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize sourceArray;
@synthesize resultArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    
//    [self navBarInit];
    
    if (sourceArray == nil) {
        sourceArray = [NSMutableArray arrayWithObjects:@"刘省伟",@"王伯虎",@"明天",@"史九元",@"赵东林",@"启明星",@"鹏程",@"黄双",@"黄文",@"王转",@"刘建飞",@"刘晓康", nil];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (void)navBarInit{
//    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button setBackgroundImage:[UIImage imageNamed:@"header.png"]
//                      forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(openLeftVCAction) forControlEvents:UIControlEventTouchUpInside];
//    button.frame = CGRectMake(0.0, 0.0, 40, 40);
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
//    
//    //    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"header.png"] style:UIBarButtonItemStylePlain target:self action:@selector(openLeftVCAction)];
//    //    self.navigationItem.leftBarButtonItem = leftItem;
//    
//    
//    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [rightBtn setBackgroundImage:[UIImage imageNamed:@"pop_menu.png"]
//                        forState:UIControlStateNormal];
//    [rightBtn addTarget:self action:@selector(PopMenuClik:) forControlEvents:UIControlEventTouchUpInside];
//    rightBtn.frame = CGRectMake(0.0, 0.0, 20, 20);
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
//    //    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"pop_menu.png"] style:UIBarButtonItemStylePlain target:self action:@selector(PopMenuClik:)];
//    //    self.navigationItem.rightBarButtonItem = rightItem;
//    
//}

//- (void)openLeftVCAction
//{
//    AppDelegate * tempAppDelegate = [[UIApplication sharedApplication]delegate];
//    if (tempAppDelegate.LeftSlideVC.closed) {
//        [tempAppDelegate.LeftSlideVC openLeftView];
//    }
//    else
//    {
//        [tempAppDelegate.LeftSlideVC closeLeftView];
//    }
//}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
//    AppDelegate * tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
//    [tempAppDelegate.LeftSlideVC setPanEnabled:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    [tempAppDelegate.LeftSlideVC setPanEnabled:YES];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 0;
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
        cell.name.text = sourceArray[indexPath.row];
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
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - searchBar delegage

//点击搜索框时调用

- (void) searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
//    self.tabBarController.navigationController  UINavigationControllerHideShowBarDuration
//    [self.tabBarController.navigationController setNavigationBarHidden:YES animated:YES];
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar{
//    [self.tabBarController.navigationController setNavigationBarHidden:NO animated:YES];

}

//- (UIStatusBarStyle) preferredStatusBarStyle{
//    return UIStatusBarStyleDefault;
//}


@end
