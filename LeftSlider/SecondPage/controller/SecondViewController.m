//
//  SecondViewController.m
//  LeftSlider
//
//  Created by SXTJ on 16/4/6.
//  Copyright © 2016年 SXTJ. All rights reserved.
//

#import "SecondViewController.h"
#import "UIScrollView+EmptyDataSet.h"

@interface SecondViewController ()<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

#pragma mark - DZNEmptyDataSetSource Methods

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = nil;
    UIFont *font = nil;
    UIColor *textColor = nil;
    
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    
    text = @"Star Your Favorite Files";
    font = [UIFont boldSystemFontOfSize:17.0];
    textColor = [UIColor colorWithHex:@"25282b"];
  
            
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
    
    switch (self.application.type) {
        case ApplicationType500px:
        {
            text = @"Get started by uploading a photo.";
            font = [UIFont boldSystemFontOfSize:15.0];
            textColor = [UIColor colorWithHex:@"545454"];
            break;
        }
        case ApplicationTypeAirbnb:
        {
            text = @"When you have messages, you’ll see them here.";
            font = [UIFont systemFontOfSize:13.0];
            textColor = [UIColor colorWithHex:@"cfcfcf"];
            paragraph.lineSpacing = 4.0;
            break;
        }
        case ApplicationTypeAppstore:
        {
            text = @"There are no results for “wwdc2014”.";
            font = [UIFont systemFontOfSize:14.0];
            textColor = [UIColor colorWithHex:@"333333"];
            break;
        }
        case ApplicationTypeCamera:
        {
            text = @"This allows you to share photos from your library and save photos to your camera roll.";
            font = [UIFont systemFontOfSize:14.0];
            textColor = [UIColor colorWithHex:@"5f6978"];
            break;
        }
        case ApplicationTypeDropbox:
        {
            text = @"Favorites are saved for offline access.";
            font = [UIFont systemFontOfSize:14.5];
            textColor = [UIColor colorWithHex:@"7b8994"];
            break;
        }
        case ApplicationTypeFancy:
        {
            text = @"Tap Add to List and add things to Owns";
            font = [UIFont systemFontOfSize:13.0];
            textColor = [UIColor colorWithHex:@"7a7d83"];
            break;
        }
        case ApplicationTypeFoursquare:
        {
            text = @"Nobody has liked or commented on your check-ins yet.";
            font = [UIFont boldSystemFontOfSize:14.0];
            textColor = [UIColor colorWithHex:@"cecbc6"];
            break;
        }
        case ApplicationTypeiCloud:
        {
            text = @"Share photos and videos with just the people you choose, and let them add photos, videos, and comments.";
            paragraph.lineSpacing = 2.0;
            break;
        }
        case ApplicationTypeInstagram:
        {
            text = @"Send photos and videos directly to your friends. Only the people you send to can see these posts.";
            font = [UIFont systemFontOfSize:16.0];
            textColor = [UIColor colorWithHex:@"444444"];
            paragraph.lineSpacing = 4.0;
            break;
        }
        case ApplicationTypeiTunesConnect:
        {
            text = @"To add a favorite, tap the star icon next to an App's name.";
            font = [UIFont systemFontOfSize:14.0];
            break;
        }
        case ApplicationTypeKickstarter:
        {
            text = @"When you back a project or follow a friend, their activity will show up here.";
            font = [UIFont systemFontOfSize:14.0];
            textColor = [UIColor colorWithHex:@"828587"];
            break;
        }
        case ApplicationTypePath:
        {
            text = @"Send a message or create a group.";
            font = [UIFont systemFontOfSize:14.0];
            textColor = [UIColor colorWithHex:@"a6978d"];
            break;
        }
        case ApplicationTypePhotos:
        {
            text = @"You can sync photos and videos onto your iPhone using iTunes.";
            break;
        }
        case ApplicationTypePodcasts:
        {
            text = @"You can subscribe to podcasts in Top Charts or Featured.";
            break;
        }
        case ApplicationTypeRemote:
        {
            text = @"You must connect to a Wi-Fi network to control iTunes or Apple TV";
            font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:11.75];
            textColor = [UIColor colorWithHex:@"555555"];
            break;
        }
        case ApplicationTypeSafari:
        {
            text = @"Safari cannot open the page because your iPhone is not connected to the Internet.";
            textColor = [UIColor colorWithHex:@"7d7f7f"];
            paragraph.lineSpacing = 2.0;
            break;
        }
        case ApplicationTypeSkype:
        {
            text = @"Keep all your favorite people together, add favorites.";
            font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17.75];
            textColor = [UIColor colorWithHex:@"a6c3d1"];
            paragraph.lineSpacing = 3.0;
            break;
        }
        case ApplicationTypeSlack:
        {
            text = @"You don't have any recent mentions";
            font = [UIFont fontWithName:@"Lato-Regular" size:19.0];
            textColor = [UIColor colorWithHex:@"d7d7d7"];
            break;
        }
        case ApplicationTypeTumblr:
        {
            text = @"When you follow some blogs, their latest posts will show up here!";
            font = [UIFont systemFontOfSize:17.0];
            textColor = [UIColor colorWithHex:@"828e9c"];
            break;
        }
        case ApplicationTypeTwitter:
        {
            text = @"You aren’t subscribed to any lists yet.";
            font = [UIFont systemFontOfSize:12.0];
            textColor = [UIColor colorWithHex:@"8899a6"];
            break;
        }
        case ApplicationTypeVideos:
        {
            text = @"This video is playing on “Apple TV”.";
            font = [UIFont systemFontOfSize:12.0];
            textColor = [UIColor colorWithHex:@"737373"];
            break;
        }
        case ApplicationTypeVine:
        {
            text = @"This is where your private conversations will live";
            font = [UIFont systemFontOfSize:17.0];
            textColor = [UIColor colorWithHex:@"a6a6a6"];
            break;
        }
        case ApplicationTypeWhatsapp:
        {
            text = @"You can exchange media with Ignacio by tapping on the Arrow Up icon in the conversation screen.";
            font = [UIFont systemFontOfSize:15.0];
            textColor = [UIColor colorWithHex:@"989898"];
            break;
        }
        case ApplicationTypeWWDC:
        {
            text = @"Favorites are only available to Registered Apple Developers.";
            font = [UIFont systemFontOfSize:16.0];
            textColor = [UIColor colorWithHex:@"b9b9b9"];
            break;
        }
        default:
            return nil;
    }
    
    if (!text) {
        return nil;
    }
    
    if (font) [attributes setObject:font forKey:NSFontAttributeName];
    if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    if (paragraph) [attributes setObject:paragraph forKey:NSParagraphStyleAttributeName];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
    
    switch (self.application.type) {
        case ApplicationTypeSkype:
            [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHex:@"00adf1"] range:[attributedString.string rangeOfString:@"add favorites"]];
            break;
            
        default:
            break;
    }
    
    return attributedString;
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    if (self.isLoading) {
        return [UIImage imageNamed:@"loading_imgBlue_78x78"];
    }
    else {
        NSString *imageName = [[[NSString stringWithFormat:@"placeholder_%@", self.application.displayName] lowercaseString]
                               stringByReplacingOccurrencesOfString:@" " withString:@"_"];
        
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
    
    switch (self.application.type) {
        case ApplicationTypeAirbnb:
        {
            text = @"Start Browsing";
            font = [UIFont boldSystemFontOfSize:16.0];
            textColor = [UIColor colorWithHex:(state == UIControlStateNormal) ? @"05adff" : @"6bceff"];
            break;
        }
        case ApplicationTypeCamera:
        {
            text = @"Continue";
            font = [UIFont boldSystemFontOfSize:17.0];
            textColor = [UIColor colorWithHex:(state == UIControlStateNormal) ? @"007ee5" : @"48a1ea"];
            break;
        }
        case ApplicationTypeDropbox:
        {
            text = @"Learn more";
            font = [UIFont systemFontOfSize:15.0];
            textColor = [UIColor colorWithHex:(state == UIControlStateNormal) ? @"007ee5" : @"48a1ea"];
            break;
        }
        case ApplicationTypeFoursquare:
        {
            text = @"Add friends to get started!";
            font = [UIFont boldSystemFontOfSize:14.0];
            textColor = [UIColor colorWithHex:(state == UIControlStateNormal) ? @"00aeef" : @"ffffff"];
            break;
        }
        case ApplicationTypeiCloud:
        {
            text = @"Create New Stream";
            font = [UIFont systemFontOfSize:14.0];
            textColor = [UIColor colorWithHex:(state == UIControlStateNormal) ? @"999999" : @"ebebeb"];
            break;
        }
        case ApplicationTypeKickstarter:
        {
            text = @"Discover projects";
            font = [UIFont boldSystemFontOfSize:14.0];
            textColor = [UIColor whiteColor];
            break;
        }
        case ApplicationTypeWWDC:
        {
            text = @"Sign In";
            font = [UIFont systemFontOfSize:16.0];
            textColor = [UIColor colorWithHex:(state == UIControlStateNormal) ? @"fc6246" : @"fdbbb2"];
            break;
        }
        default:
            return nil;
    }
    
    if (!text) {
        return nil;
    }
    
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    if (font) [attributes setObject:font forKey:NSFontAttributeName];
    if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    NSString *imageName = [[NSString stringWithFormat:@"button_background_%@", self.application.displayName] lowercaseString];
    
    if (state == UIControlStateNormal) imageName = [imageName stringByAppendingString:@"_normal"];
    if (state == UIControlStateHighlighted) imageName = [imageName stringByAppendingString:@"_highlight"];
    
    UIEdgeInsets capInsets = UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0);
    UIEdgeInsets rectInsets = UIEdgeInsetsZero;
    
    switch (self.application.type) {
        case ApplicationTypeFoursquare:
            capInsets = UIEdgeInsetsMake(25.0, 25.0, 25.0, 25.0);
            rectInsets = UIEdgeInsetsMake(0.0, 10, 0.0, 10);
            break;
        case ApplicationTypeiCloud:
            rectInsets = UIEdgeInsetsMake(-19.0, -61.0, -19.0, -61.0);
            break;
        case ApplicationTypeKickstarter:
            capInsets = UIEdgeInsetsMake(22.0, 22.0, 22.0, 22.0);
            rectInsets = UIEdgeInsetsMake(0.0, -20, 0.0, -20);
            break;
        default:
            break;
    }
    
    return [[[UIImage imageNamed:imageName] resizableImageWithCapInsets:capInsets resizingMode:UIImageResizingModeStretch] imageWithAlignmentRectInsets:rectInsets];
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    switch (self.application.type) {
        case ApplicationType500px:      return [UIColor blackColor];
        case ApplicationTypeAirbnb:     return [UIColor whiteColor];
        case ApplicationTypeDropbox:    return [UIColor colorWithHex:@"f0f3f5"];
        case ApplicationTypeFacebook:   return [UIColor colorWithHex:@"eceef7"];
        case ApplicationTypeFancy:      return [UIColor colorWithHex:@"f0f0f0"];
        case ApplicationTypeFoursquare: return [UIColor colorWithHex:@"fcfcfa"];
        case ApplicationTypeInstagram:  return [UIColor whiteColor];
        case ApplicationTypeKickstarter:return [UIColor colorWithHex:@"f7fafa"];
        case ApplicationTypePath:       return [UIColor colorWithHex:@"726d67"];
        case ApplicationTypePinterest:  return [UIColor colorWithHex:@"e1e1e1"];
        case ApplicationTypeSlack:      return [UIColor whiteColor];
        case ApplicationTypeTumblr:     return [UIColor colorWithHex:@"34465c"];
        case ApplicationTypeTwitter:    return [UIColor colorWithHex:@"f5f8fa"];
        case ApplicationTypeVesper:     return [UIColor colorWithHex:@"f8f8f8"];
        case ApplicationTypeVideos:     return [UIColor blackColor];
        case ApplicationTypeWhatsapp:   return [UIColor colorWithHex:@"f2f2f2"];
        default:                        return nil;
    }
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    if (self.application.type == ApplicationTypeKickstarter) {
        CGFloat offset = CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
        offset += CGRectGetHeight(self.navigationController.navigationBar.frame);
        return -offset;
    }
    if (self.application.type == ApplicationTypeTwitter) {
        return -roundf(self.tableView.frame.size.height/2.5);
    }
    return 0.0;
}

- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView
{
    switch (self.application.type) {
        case ApplicationType500px:          return 9.0;
        case ApplicationTypeAirbnb:         return 24.0;
        case ApplicationTypeAppstore:       return 34.0;
        case ApplicationTypeFacebook:       return 30.0;
        case ApplicationTypeFancy:          return 1.0;
        case ApplicationTypeFoursquare:     return 9.0;
        case ApplicationTypeInstagram:      return 24.0;
        case ApplicationTypeiTunesConnect:  return 9.0;
        case ApplicationTypeKickstarter:    return 15.0;
        case ApplicationTypePath:           return 1.0;
        case ApplicationTypePodcasts:       return 35.0;
        case ApplicationTypeTumblr:         return 10.0;
        case ApplicationTypeTwitter:        return 0.1;
        case ApplicationTypeVesper:         return 22.0;
        case ApplicationTypeVideos:         return 0.1;
        case ApplicationTypeVine:           return 0.1;
        case ApplicationTypeWWDC:           return 18.0;
        default:                            return 0.0;
    }
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
