//
//  ViewController.m
//  HCTableViewSectionIndex
//
//  Created by 光 on 16/8/22.
//  Copyright © 2016年 光. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate>
{
    NSArray *_rowArr;// row arr
    NSArray *_sectionArr;// section arr
    NSMutableArray *_searchResultArr;// 搜索结果Arr
}

@property (nonatomic,strong) UISearchBar *searchBar;// 搜索框
@property (nonatomic,strong) UISearchDisplayController *searchDisplayController;// 搜索VC, iOS:3.0-8.0


@end

@implementation ViewController

/**
 *  实现通讯录右边栏快速链接，适用于：1、通讯录；2、城市选择等需求
 */


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

#pragma mark - UITableViewDataSource 中 必须实现的两个关于侧边栏设置的方法
/**
 *  创建tableView时会调用该方法
 *
 *  @return 返回侧边栏数据
 */
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
    if (tableView != _searchDisplayController.searchResultsTableView) {
        // 非搜索状态时，显示侧边栏
        return _sectionArr;
        
    }else{
        // 搜索状态，隐藏侧边栏
        return nil;
    }
}

/**
 *  点击侧边栏定位时，响应事件，跳转section
 */
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    
    return index-1;
}












@end
