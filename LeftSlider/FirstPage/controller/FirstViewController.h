//
//  FirstViewController.h
//  LeftSlider
//
//  Created by SXTJ on 16/4/5.
//  Copyright © 2016年 SXTJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UITableViewController<UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *mySearchBar;
@property (nonatomic,strong) NSMutableArray *sourceArray;
@property (nonatomic,strong) NSMutableArray *resultArray;

@end
