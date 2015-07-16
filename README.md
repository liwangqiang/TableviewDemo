测试UITableView的显示

1、不同的style下，会有什么影响
   
    UITableViewStylePlain
        随着滑动，相应的 section header & footer 会停留在屏幕的最上方和最下方
    UITableViewStyleGrouped
        section header & footer 不会停留在当前屏幕的上下方，而是直接滚动
    
    plain模式下不设置section view 的高度 则不显示section View
    group模式下不设置section view 的高度 header view不显示 但footer view 有一定的高度显示

2、section header & footer

    section view的高度与view分离
        a、高度设置：1、委托方法 2、tableView.sectionHeaderHeight 
        (推荐方法1。因为过程中发现方法2 会有tableView起始显示不正常的现象)
        
        b、view 委托方法

    section view默认颜色 = clearColor

3、tableView header & footer

    headerview & footerview 必须手动设置height. 系统会自动设置 width = tableview.width & origin = (0, 0)
    headerview & footerview 创建时不推荐使用 -newAutoLayoutView 
      (pureLayout方法，详见源码) 这样会显示不正常。但里面的subView可以创建约束关系
    
4、方法 dequeueReusableCellWithIdentifier: 与 dequeueReusableCellWithIdentifier:forIndexPath: 的区别
    
    后者调用了一次 -tableView:heightForRowAtIndexPath:获取了正确的高度。打印日志可以看出
    http://stackoverflow.com/questions/25826383/when-to-use-dequeuereusablecellwithidentifier-vs-dequeuereusablecellwithidentifi

5、关于table view的 selection 

    -reloadData方法 会清除所有的维护的selection,即使在delegate方法 -(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 中设置selected，也被清除，可在 -(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath 中想办法
    UITableViewController 在-viewWillAppear 中实现了清除 selection 可设置属性clearsSelectionOnViewWillAppear 改变
    详见 苹果开发文档 UITableView & UITableViewController 的 Overview

6、关于 cell 的分割线 separator line

    iOS7.x 与 iOS8.x 对分割线的操作不同
    iOS7.x 
        table view -setSeparatorInset: 即可
    iOS8.x
        cell        -setSeparatorInset: & -setLayoutMargins    定制的cell中统一设置 或者 更灵活的 -tableView:willDisplayCell:forRowAtIndexPath:
        table view  -setSeparatorInset: & -setLayoutMargins    推荐在 -viewDidLayoutSubviews: 中调用 
    
    #warning调用了 [self.tableView setLayoutMargins:UIEdgeInsetsZero], cell的 -setSeparatorInset才能正确的影响cell的左右分割线
    
    颜色 table view -separatorColor:

    UITableView 的style不同 则对 separator line 的显示会有影响
        如果是 group style, table 会自动在section两边加上一条顶起屏幕边缘的separator line, 而不管你的cell separator line 设置
        如果是 plain sytle, 则不会加这条线




