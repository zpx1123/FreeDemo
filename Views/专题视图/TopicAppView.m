//
//  TopicAppView.m
//  爱限免
//
//  Created by qianfeng on 14-5-11.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "TopicAppView.h"

@implementation TopicAppView

#pragma mark - 属性

@dynamic dataSource;
@dynamic delegate;

- (void)setDataSource:(id<QFTableViewDataSource>)dataSource
{
    _tableView.dataSource = dataSource;
}

- (id<QFTableViewDataSource>)dataSource
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
        _tableView = [[QFTableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone; //没有cell分割线

        _tableView.delegate = self;
        
        [self addSubview:_tableView];
        
    }
    return self;
}


- (void)dealloc
{
    [_tableView release];
    _tableView = nil;
    
    [super dealloc];
}

- (void)layoutSubviews
{
    _tableView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}



#pragma mark - 刷新数据

- (void)reloadData
{
    [_tableView reloadData];
}

@end
