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
        a、高度设置：1、委托方法 2、tableView.sectionHeaderHeight (推荐方法1。因为过程中发现方法2 会有tableView起始显示不正常的现象)
        b、view 委托方法

3、tableView header & footer
    headerview & footerview 必须手动设置height. 系统会自动设置 width = tableview.width & origin = (0, 0)
    headerview & footerview 创建时不推荐使用 -newAutoLayoutView (pureLayout方法，详见源码) 这样会显示不正常。但里面的subView可以创建约束关系
    

    