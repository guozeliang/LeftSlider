//
//  SecondViewController.m
//  LeftSlider
//
//  Created by SXTJ on 16/4/6.
//  Copyright © 2016年 SXTJ. All rights reserved.
//

#import "SecondViewController.h"
#import "UIScrollView+EmptyDataSet.h"
#import <ChameleonFramework/Chameleon.h>
#import "LeftSlider-Swift.h"

@interface SecondViewController ()<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@property (nonatomic, getter=isLoading) BOOL loading;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    if (self.sourceArray == nil) {
//        self.sourceArray = [NSMutableArray arrayWithCapacity:1];
        self.sourceArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3", nil];
    }
//    [self configureHeaderAndFooter];
    [self navBarInit];
}

- (void)navBarInit{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sourceArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"SECOND_CELL" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = self.sourceArray[indexPath.row];
    
    return cell;
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
        [self.sourceArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        if (self.sourceArray.count == 0) {
            [tableView reloadData];
        }
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    [self.navigationController setProgress:(float)];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Configuration and Event Methods

- (void)configureHeaderAndFooter
{
    NSString *imageName = nil;
//    if (self.application.type == ApplicationTypePinterest) {
//        imageName = @"header_pinterest";
//    }
//    if (self.application.type == ApplicationTypePodcasts) {
//        imageName = @"header_podcasts";
//    }
//    
    if (imageName) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapHeaderView:)];
        [imageView addGestureRecognizer:tapGesture];
        
        self.tableView.tableHeaderView = imageView;
    }
    else {
        self.tableView.tableHeaderView = [UIView new];
    }
    
    self.tableView.tableFooterView = [UIView new];
}

- (void)didTapHeaderView:(id)sender
{
    NSLog(@"%s",__FUNCTION__);
}


- (void)setLoading:(BOOL)loading
{
    if (self.isLoading == loading) {
        return;
    }
    
    _loading = loading;
    
    [self.tableView reloadEmptyDataSet];
    [self.navigationController finishProgress];
}



#pragma mark - DZNEmptyDataSetSource Methods

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = nil;
    UIFont *font = nil;
    UIColor *textColor = nil;
    
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    
    text = @"Star Your Favorite Files";
    font = [UIFont boldSystemFontOfSize:17.0];
    textColor = [UIColor colorWithHexString:@"25282b"];
 
    if (!text) {
        return nil;
    }
    if (font) [attributes setObject:font forKey:NSFontAttributeName];
    if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = nil;
    UIFont *font = nil;
    UIColor *textColor = nil;
    
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    text = @"Favorites are saved for offline access.";
    font = [UIFont systemFontOfSize:14.5];
    textColor = [UIColor colorWithHexString:@"7b8994"];
    
    if (!text) {
        return nil;
    }
    
    if (font) [attributes setObject:font forKey:NSFontAttributeName];
    if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    if (paragraph) [attributes setObject:paragraph forKey:NSParagraphStyleAttributeName];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
    
    return attributedString;
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    if (self.isLoading) {
        return [UIImage imageNamed:@"loading_imgBlue_78x78"];
    }else {
//        NSString *imageName = [[[NSString stringWithFormat:@"placeholder_%@", self.application.displayName] lowercaseString]
//                               stringByReplacingOccurrencesOfString:@" " withString:@"_"];
        NSString *imageName = @"placeholder_dropbox";
        
        return [UIImage imageNamed:imageName];
    }
}

- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0) ];
    animation.duration = 0.25;
    animation.cumulative = YES;
    animation.repeatCount = MAXFLOAT;
    
    return animation;
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    NSString *text = nil;
    UIFont *font = nil;
    UIColor *textColor = nil;
    
    text = @"Learn more";
    font = [UIFont systemFontOfSize:15.0];
    textColor = [UIColor colorWithHexString:(state == UIControlStateNormal) ? @"007ee5" : @"48a1ea"];

    if (!text) {
        return nil;
    }
    
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    if (font) [attributes setObject:font forKey:NSFontAttributeName];
    if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

//- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
//{
//    NSString *imageName = [[NSString stringWithFormat:@"button_background_%@", self.application.displayName] lowercaseString];
//    
//    if (state == UIControlStateNormal) imageName = [imageName stringByAppendingString:@"_normal"];
//    if (state == UIControlStateHighlighted) imageName = [imageName stringByAppendingString:@"_highlight"];
//    
//    UIEdgeInsets capInsets = UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0);
//    UIEdgeInsets rectInsets = UIEdgeInsetsZero;
//
//    switch (self.application.type) {
//        case ApplicationTypeFoursquare:
//            capInsets = UIEdgeInsetsMake(25.0, 25.0, 25.0, 25.0);
//            rectInsets = UIEdgeInsetsMake(0.0, 10, 0.0, 10);
//            break;
//        case ApplicationTypeiCloud:
//            rectInsets = UIEdgeInsetsMake(-19.0, -61.0, -19.0, -61.0);
//            break;
//        case ApplicationTypeKickstarter:
//            capInsets = UIEdgeInsetsMake(22.0, 22.0, 22.0, 22.0);
//            rectInsets = UIEdgeInsetsMake(0.0, -20, 0.0, -20);
//            break;
//        default:
//            break;
//    }
//    
//    return [[[UIImage imageNamed:imageName] resizableImageWithCapInsets:capInsets resizingMode:UIImageResizingModeStretch] imageWithAlignmentRectInsets:rectInsets];
//}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
//    switch (self.application.type) {
//        case ApplicationType500px:      return [UIColor blackColor];
//        case ApplicationTypeAirbnb:     return [UIColor whiteColor];
//        case ApplicationTypeDropbox:    return [UIColor colorWithHex:@"f0f3f5"];
//        case ApplicationTypeFacebook:   return [UIColor colorWithHex:@"eceef7"];
//        case ApplicationTypeFancy:      return [UIColor colorWithHex:@"f0f0f0"];
//        case ApplicationTypeFoursquare: return [UIColor colorWithHex:@"fcfcfa"];
//        case ApplicationTypeInstagram:  return [UIColor whiteColor];
//        case ApplicationTypeKickstarter:return [UIColor colorWithHex:@"f7fafa"];
//        case ApplicationTypePath:       return [UIColor colorWithHex:@"726d67"];
//        case ApplicationTypePinterest:  return [UIColor colorWithHex:@"e1e1e1"];
//        case ApplicationTypeSlack:      return [UIColor whiteColor];
//        case ApplicationTypeTumblr:     return [UIColor colorWithHex:@"34465c"];
//        case ApplicationTypeTwitter:    return [UIColor colorWithHex:@"f5f8fa"];
//        case ApplicationTypeVesper:     return [UIColor colorWithHex:@"f8f8f8"];
//        case ApplicationTypeVideos:     return [UIColor blackColor];
//        case ApplicationTypeWhatsapp:   return [UIColor colorWithHex:@"f2f2f2"];
//        default:                        return nil;
//    }
    return [UIColor colorWithHexString:@"f0f3f5"];
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
//    if (self.application.type == ApplicationTypeKickstarter) {
//        CGFloat offset = CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
//        offset += CGRectGetHeight(self.navigationController.navigationBar.frame);
//        return -offset;
//    }
//    if (self.application.type == ApplicationTypeTwitter) {
//        return -roundf(self.tableView.frame.size.height/2.5);
//    }
    return 0.0;
}

- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView
{
//    switch (self.application.type) {
//        case ApplicationType500px:          return 9.0;
//        case ApplicationTypeAirbnb:         return 24.0;
//        case ApplicationTypeAppstore:       return 34.0;
//        case ApplicationTypeFacebook:       return 30.0;
//        case ApplicationTypeFancy:          return 1.0;
//        case ApplicationTypeFoursquare:     return 9.0;
//        case ApplicationTypeInstagram:      return 24.0;
//        case ApplicationTypeiTunesConnect:  return 9.0;
//        case ApplicationTypeKickstarter:    return 15.0;
//        case ApplicationTypePath:           return 1.0;
//        case ApplicationTypePodcasts:       return 35.0;
//        case ApplicationTypeTumblr:         return 10.0;
//        case ApplicationTypeTwitter:        return 0.1;
//        case ApplicationTypeVesper:         return 22.0;
//        case ApplicationTypeVideos:         return 0.1;
//        case ApplicationTypeVine:           return 0.1;
//        case ApplicationTypeWWDC:           return 18.0;
//        default:                            return 0.0;
//    }
    return 0.0;
}


#pragma mark - DZNEmptyDataSetDelegate Methods

- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
    return YES;
}

- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView
{
    return YES;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}

- (BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView
{
    return self.isLoading;
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view
{
    self.loading = YES;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.loading = NO;
    });
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
{
    self.loading = YES;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.loading = NO;
    });
}




@end
