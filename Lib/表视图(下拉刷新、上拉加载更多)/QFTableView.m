//
//  QFTableView.m
//  爱限免
//
//  Created by chen cheng on 14-5-8.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFTableView.h"

@implementation QFTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self != nil)
    {
        _egoRefreshTableHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.bounds.size.height, self.frame.size.width, self.bounds.size.height)];
        _egoRefreshTableHeaderView.delegate = self;
        [self addSubview:_egoRefreshTableHeaderView];
        
        [_egoRefreshTableHeaderView refreshLastUpdatedDate];
        
        _loadMoreTableFooterView = [[LoadMoreTableFooterView alloc] initWithFrame:CGRectMake(0.0f, self.contentSize.height, self.frame.size.width, self.bounds.size.height)];
		_loadMoreTableFooterView.delegate = self;
		[self addSubview:_loadMoreTableFooterView];
    }
    return self;
}

- (void)dealloc
{
    [_egoRefreshTableHeaderView release];
    _egoRefreshTableHeaderView = nil;
    
    [_loadMoreTableFooterView release];
    _loadMoreTableFooterView = nil;
    
    [super dealloc];
}


#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view
{
    _isRefreshing = YES;
    
    [self.dataSource refreshDataCompletion:^(BOOL finished) {
        
        _isRefreshing = NO;
        [self reloadData];
        
        [_egoRefreshTableHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self];
        
    }];
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view
{
    return _isRefreshing;
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view
{
    return [NSDate date];
}

#pragma mark LoadMoreTableFooterDelegate Methods

- (void)loadMoreTableFooterDidTriggerLoadMore:(LoadMoreTableFooterView*)view
{
    _isLoadMoreing = YES;
    
    [self.dataSource loadMoreDataCompletion:^(BOOL finished) {
        
        //下载完成
        _isLoadMoreing = NO;
        
        [self reloadData];
        
        [_loadMoreTableFooterView loadMoreScrollViewDataSourceDidFinishedLoading:self];

    }];
}

- (BOOL)loadMoreTableFooterDataSourceIsLoading:(LoadMoreTableFooterView*)view
{
    return _isLoadMoreing;
}

- (void)setContentOffset:(CGPoint)contentOffset
{
    [super setContentOffset:contentOffset];
    
    _loadMoreTableFooterView.frame = CGRectMake(0.0f, self.contentSize.height, self.frame.size.width, self.bounds.size.height);
}

- (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated
{
    [super setContentOffset:contentOffset animated:animated];
    
    _loadMoreTableFooterView.frame = CGRectMake(0.0f, self.contentSize.height, self.frame.size.width, self.bounds.size.height);
}


#pragma mark UITableViewDelegate 的函数

- (void)setDelegate:(id<UITableViewDelegate>)delegate
{
    [super setDelegate:self];
    _backupDelegate = delegate;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	[_egoRefreshTableHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
    [_loadMoreTableFooterView loadMoreScrollViewDidScroll:scrollView];
    
    if ([_backupDelegate respondsToSelector:@selector(scrollViewDidScroll:)])
    {
        [_backupDelegate scrollViewDidScroll:scrollView];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
	[_egoRefreshTableHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    
    [_loadMoreTableFooterView loadMoreScrollViewDidEndDragging:scrollView];
    
    if ([_backupDelegate respondsToSelector:@selector(scrollViewDidEndDragging:willDecelerate:)])
    {
        [_backupDelegate scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_backupDelegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)])
    {
        return [_backupDelegate tableView:tableView heightForRowAtIndexPath:indexPath];
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_backupDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)])
    {
        return [_backupDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

@end
