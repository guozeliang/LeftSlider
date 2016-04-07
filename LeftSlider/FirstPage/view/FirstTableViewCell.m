//
//  FirstTableViewCell.m
//  LeftSlider
//
//  Created by SXTJ on 16/4/6.
//  Copyright © 2016年 SXTJ. All rights reserved.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews{
     [super layoutSubviews];
    
    CGRect tmpFrame = self.imageView.frame;
    tmpFrame.origin.y += 7.5;
    tmpFrame.size.height -= 15;
    tmpFrame.size.width = tmpFrame.size.height;
    
    self.imageView.bounds = tmpFrame;
    self.imageView.frame = tmpFrame;
    self.imageView.contentMode =UIViewContentModeScaleAspectFit;

    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.cornerRadius = tmpFrame.size.width/2.0;
//    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
//    self.imageView.layer.borderWidth = 0.5;
    
}

@end
