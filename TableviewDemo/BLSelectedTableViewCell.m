//
//  BLSelectedTableViewCell.m
//  TableviewDemo
//
//  Created by sxwyce on 15/6/6.
//  Copyright (c) 2015年 personal. All rights reserved.
//

#import "BLSelectedTableViewCell.h"

@implementation BLSelectedTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //iOS 7.x 左分割线左对齐到屏幕边缘
        if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
            [self setSeparatorInset:UIEdgeInsetsZero];
        }
        //iOS 8.x 左分割线左对齐到屏幕边缘
        if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
            [self setLayoutMargins:UIEdgeInsetsZero];
        }
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
    self.accessoryType = selected ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
}

@end
