//
//  CategoryDetailView.m
//  爱限免
//
//  Created by qianfeng on 14-5-21.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "CategoryDetailView.h"

@implementation CategoryDetailView


#pragma mark - 属性

@dynamic dataSource;


- (void)setDataSource:(id<UITableViewDataSource>)dataSource
{
    _tableView.dataSource = dataSource;
}

- (id<UITableViewDataSource>)dataSource
{
    return _tableView.dataSource;
}


- (void)setDelegate:(id<UITableViewDelegate>)delegate
{
    _tableView.delegate = delegate;
}

- (id<UITableViewDelegate>)delegate
{
    return _tableView.delegate;
}


#pragma mark - 构造、析构、布局

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
        _searchBar.showsCancelButton = NO;
        _searchBar.placeholder = @"输入应用名称";
        _searchBar.backgroundImage = [UIImage imageNamed:@"搜索框背景.png"];
        _searchBar.delegate = self;
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
        _tableView.tableHeaderView = _searchBar;
        _tableView.delegate = self;
        [self addSubview:_tableView];
        
    }
    return self;
}


- (void)dealloc
{
    [_searchBar release];
    _searchBar = nil;
    
    [_tableView release];
    _tableView = nil;
    
    [super dealloc];
}

- (void)layoutSubviews
{
    _tableView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}


#pragma mark - 搜索框 delegate 的函数

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
//    [[limitsExemptsViewController shareLimitsExemptsViewController] showAppSearchResultsAnimated:_searchBar.text];
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    
}

#pragma mark - 刷新数据

- (void)reloadData
{
    [_tableView reloadData];
}

@end
