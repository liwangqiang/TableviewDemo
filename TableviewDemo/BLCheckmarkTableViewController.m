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

@end
