//
//  BLTableViewCell.m
//  TableviewDemo
//
//  Created by sxwyce on 15/6/6.
//  Copyright (c) 2015年 personal. All rights reserved.
//

#import "BLTableViewCell.h"
#import "PureLayout.h"

@implementation BLTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUp];
    }
    return  self;
}

- (void)awakeFromNib {
    // Initialization code
    [self setUp];
}

-(void)updateConstraints
{
    [self.titleLabel autoSetDimension:ALDimensionWidth toSize:100];
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:15];
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    
    [self.inputTextField autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.titleLabel];
    [self.inputTextField autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.inputTextField autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.inputTextField autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    
    [super updateConstraints];
}

#pragma mark - Private method

- (void)setUp
{
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.inputTextField];
    
    [self setNeedsUpdateConstraints];
}

#pragma mark - Getter & Setter

-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
    }
    return _titleLabel;
}

-(UITextField *)inputTextField
{
    if (!_inputTextField) {
        _inputTextField = [UITextField newAutoLayoutView];
    }
    return _inputTextField;
}

@end
