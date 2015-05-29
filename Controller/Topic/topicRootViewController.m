//
//  topicRootViewController.m
//  爱限免
//
//  Created by qianfeng on 14-5-7.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "topicRootViewController.h"
#import "UIDevice+UIDeviceCategory.h"


@interface topicRootViewController ()

@end

@implementation topicRootViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        UILabel *titleView = [[UILabel alloc]initWithFrame:CGRectMake(200, 30, 100, 40)];
        titleView.text = @"专题";
        [titleView setTextColor:[UIColor whiteColor]];
        titleView.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:20];
        [titleView setTextAlignment:NSTextAlignmentCenter];
        [self.navigationItem setTitleView:titleView];
        [titleView release];
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    if ([UIDevice systemVersionFirstNumber] < 7)
    {
        self.wantsFullScreenLayout = NO;
    }
    else
    {
        self.edgesForExtendedLayout = UIRectEdgeBottom|UIRectEdgeLeft | UIRectEdgeRight;
    }
    
    _topicAppView = [[TopicAppView alloc] initWithFrame:self.view.bounds];
    _topicAppView.delegate = self ;
    _topicModel = [[TopicModel alloc] init];
    _topicAppView.dataSource = _topicModel ;
    self.view = _topicAppView;
    
    [self refreshData];
    
}

#pragma mark - tableView delegate 的 函数

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300;
}


- (void)refreshData
{
    //刷新数据
    [_topicModel refreshDataCompletion:^(BOOL finished) {
        
        if (finished)
        {
            [_topicAppView reloadData];
        }
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
