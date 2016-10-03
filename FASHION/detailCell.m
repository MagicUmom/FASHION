//
//  detailCell.m
//  FASHION
//
//  Created by MCLAB on 2016/10/2.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import "detailCell.h"

@implementation detailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat totalHeight = 0;
    totalHeight += [self.detailLabel sizeThatFits:size].height;
    totalHeight += [self.detailImage sizeThatFits:size].height;
    totalHeight += 40; // margins
    return CGSizeMake(size.width, totalHeight);
}

@end
