//
//  BLTableViewController.m
//  TableviewDemo
//
//  Created by 李王强 on 15/6/5.
//  Copyright (c) 2015年 personal. All rights reserved.
//

#import "BLTableViewController.h"
#import "PureLayout.h"
#import "BLTableViewCell.h"

static NSString  *const tableViewCellIdentifier = @"BLTableViewCell";

@interface BLTableViewController ()

@property(nonatomic, strong)NSArray *sectionHeaders;

@property(nonatomic, strong)UIView *tableHeaderView;
@property(nonatomic, strong)UIView *tableFooterView;

@end

@implementation BLTableViewController

#pragma mark - Life cycle

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
    self.tableView.rowHeight = 44 ;
    
    self.tableView.tableHeaderView = self.tableHeaderView;
    self.tableView.tableFooterView = self.tableFooterView;
    
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    
    /*** 偶然会显示不正确，未找到原因。建议使用委托中相应的方法 ***/
    //self.tableView.sectionHeaderHeight = 44;
    //self.tableView.sectionFooterHeight = 44;
    
    [self.tableView registerClass:[BLTableViewCell class] forCellReuseIdentifier:tableViewCellIdentifier];
    //[self.tableView registerNib:[UINib nibWithNibName:@"BLTableViewCell" bundle:nil] forCellReuseIdentifier:tableViewCellIdentifier];
}

#pragma mark - Table view

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.sectionHeaders count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [UIView new];
    headerView.backgroundColor = [UIColor colorWithRed:0.529 green:0.524 blue:0.678 alpha:1.000];
    
    UILabel *label = [UILabel newAutoLayoutView];
    label.text = [NSString stringWithFormat:@"section %ld", section];
    [headerView addSubview:label];
    
    //constraint
    [label autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [label autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    return headerView;
}

/*** 关于footer view 特性和 header view 基本一样 但在Group模式下，默认footer有一定的高度,需要设置**/
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    UIView *footerView = [UIView new];
//    footerView.backgroundColor = [UIColor colorWithWhite:0.200 alpha:1.000];
//    return footerView;
//}

-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    自定义的cell,无法缩进
    return indexPath.row % 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"method: %s", __func__);
    NSLog(@"before call dequeueReusableCellWithIdentifier:forIndexPath:");
//    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier forIndexPath:indexPath];
    BLTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier];
    
    /***
     方法 dequeueReusableCellWithIdentifier: 与 dequeueReusableCellWithIdentifier:forIndexPath: 的区别在于 后者调用了一次 -tableView:heightForRowAtIndexPath:获取了正确的高度。打印日志可以看出
     http://stackoverflow.com/questions/25826383/when-to-use-dequeuereusablecellwithidentifier-vs-dequeuereusablecellwithidentifi
     ***/
    NSLog(@"after call dequeueReusableCellWithIdentifier:forIndexPath:");
    
    cell.titleLabel.text = [NSString stringWithFormat:@"%ld:%ld", indexPath.section, indexPath.row];
    cell.inputTextField.placeholder = @"输入";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"method: %s", __func__);
    return 44;
}


#pragma mark - Getter & Setter

-(NSArray *)sectionHeaders
{
    if (!_sectionHeaders) {
        _sectionHeaders = @[@"0",@"1",@"2"];
    }
    return _sectionHeaders;
}

-(UIView *)tableHeaderView
{
    if (!_tableHeaderView) {
        _tableHeaderView = [UIView new];
        
        //table view headerview 必须手动设置height. 但 width & origin自动设置
        //table view headerview 不应该创建时不建议使用 -newAutoLayoutView 方法！会显示不正确
        CGRect newFrame = _tableHeaderView.frame;
        newFrame.size.height = 60;
        _tableHeaderView.frame = newFrame;
        _tableHeaderView.backgroundColor = [UIColor whiteColor];
        
        
        UIButton *button = [UIButton newAutoLayoutView];
        [button setBackgroundColor:[UIColor blackColor]];
        [button setTitle:@"header" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [_tableHeaderView addSubview:button];
        
        // constraints
        [button autoCenterInSuperview];
        [button autoSetDimensionsToSize:CGSizeMake(100, 50)];
        
    }
    return _tableHeaderView;
}

-(UIView *)tableFooterView
{
    if (!_tableFooterView) {
        _tableFooterView = [UIView new];
        CGRect newFrame = _tableHeaderView.frame;
        newFrame.size.height = 60;
        _tableFooterView.frame = newFrame;
        _tableFooterView.backgroundColor = [UIColor clearColor];
        
        UIButton *button = [UIButton newAutoLayoutView];
        [button setBackgroundColor:[UIColor blackColor]];
        [button setTitle:@"footer" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [_tableFooterView addSubview:button];
        // constraints
        [button autoCenterInSuperview];
        [button autoSetDimensionsToSize:CGSizeMake(100, 50)];

    }
    return _tableFooterView;
}
@end
