//
//  DetailView.m
//  爱限免
//
//  Created by qianfeng on 14-5-10.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "DetailView.h"
#import "limitsExemptsViewController.h"

@implementation DetailView


@dynamic dataSource;


- (void) setDataSource:(id<UITableViewDataSource>)dataSource
{
    _tabelView.dataSource = dataSource;
}

-(id<UITableViewDataSource>)dataSource
{
    return _tabelView.dataSource;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _tabelView =  [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tabelView.scrollEnabled = NO;
        _tabelView.delegate = self;
        [self addSubview:_tabelView]; 
        
    }
    return self;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 400;
}

-(void)reloadfreah
{
    [_tabelView reloadData];
}

#pragma mark - 析构函数
- (void)dealloc
{
    [super dealloc];
    
    [_tabelView release];
    _tabelView = nil;
}


@end
