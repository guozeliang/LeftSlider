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
    tmpFrame.origin.y += 5;
    tmpFrame.size.height -= 10;
    tmpFrame.size.width = tmpFrame.size.height;
    
    self.imageView.bounds = tmpFrame;
    self.imageView.frame = tmpFrame;
    self.imageView.contentMode =UIViewContentModeScaleAspectFit;

    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.cornerRadius = 40;
    self.imageView.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor whiteColor]);
    self.imageView.layer.borderWidth = 5;
    
}

@end
