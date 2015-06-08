//
//  BLCheckmarkTableViewController.m
//  TableviewDemo
//
//  Created by sxwyce on 15/6/6.
//  Copyright (c) 2015年 personal. All rights reserved.
//

#import "BLCheckmarkTableViewController.h"
#import "BLSelectedTableViewCell.h"

static NSString *const tableViewCellIdentifier = @"BLSelectedTableViewCell";

@interface BLCheckmarkTableViewController ()

@end

@implementation BLCheckmarkTableViewController

#pragma mark - Life cycle

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //单选
    self.tableView.allowsSelection = YES;
    [self.tableView registerClass:[BLSelectedTableViewCell class] forCellReuseIdentifier:tableViewCellIdentifier];
    self.clearsSelectionOnViewWillAppear = NO;
    self.tableView.separatorColor = [UIColor purpleColor];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    #warning 在viewDidLoad中调用下列方法则不管用
    //分割线对齐屏幕边缘 方法缺一不可
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - Table view 

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BLSelectedTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld : %ld", indexPath.section, indexPath.row];
    
    cell.selected = NO;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *newSelectedCell = [self.tableView cellForRowAtIndexPath:indexPath];
    newSelectedCell.selected = YES;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self setCell:cell SeparatorInset:UIEdgeInsetsMake(0, indexPath.section * 10, 0, indexPath.section * 10)];
}

#pragma mark - Private method

-(void)setCell:(UITableViewCell *)cell SeparatorInset:(UIEdgeInsets)inset
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:inset];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:inset];
    }
}

@end
