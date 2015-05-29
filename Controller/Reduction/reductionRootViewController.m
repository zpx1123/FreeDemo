//
//  reductionRootViewController.m
//  爱限免
//
//  Created by qianfeng on 14-5-7.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "reductionRootViewController.h"
#import "UIDevice+UIDeviceCategory.h"
#import "reductionViewController.h"

@interface reductionRootViewController ()

@end

@implementation reductionRootViewController

-(void)dealloc
{
    [self QF_viewDidUnload];
    
    [super dealloc];
    
}
- (id)init
{
    self = [super init];
    if (self)
    {
        UILabel *titleView = [[UILabel alloc]initWithFrame:CGRectMake(200, 30, 100, 40)];
        titleView.text = @"降价";
        [titleView setTextColor:[UIColor whiteColor]];
        titleView.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:20];
        [titleView setTextAlignment:NSTextAlignmentCenter];
        [self.navigationItem setTitleView:titleView];
        [titleView release];
        
        UIBarButtonItem *leftBarButtonItem = nil;
        UIBarButtonItem *rightBarButtonItem = nil;
        
        if ([UIDevice systemVersionFirstNumber] < 7)
        {
            UIButton *leftBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
            leftBarButton.frame = CGRectMake(0, 0, 40, 40);
            
            [leftBarButton setImage:[UIImage imageNamed:@"btn_设置_正常.png"] forState:UIControlStateNormal];
            [leftBarButton addTarget:self action:@selector(settingButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarButton];
            
            
            UIButton *rightBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
            rightBarButton.frame = CGRectMake(0, 0, 40, 40);
            
            [rightBarButton setImage:[UIImage imageNamed:@"btn_分类_正常.png"] forState:UIControlStateNormal];
            [rightBarButton addTarget:self action:@selector(categoryButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBarButton];
        }
        else
        {
            leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_设置_正常.png"] style:UIBarButtonItemStylePlain target:self action:@selector(settingButtonClick:)];
            
            rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_分类_正常.png"] style:UIBarButtonItemStylePlain target:self action:@selector(categoryButtonClick:)];
        }
        
        self.navigationItem.leftBarButtonItem = leftBarButtonItem;
        [leftBarButtonItem release];
        
        self.navigationItem.rightBarButtonItem = rightBarButtonItem;
        [rightBarButtonItem release];
        
    }
    return self;
}

#pragma mark - 导航栏 按钮  事件 函数

- (void)settingButtonClick:(id)sender
{
    [[reductionViewController shareReductionViewController] showSetViewAnimated:YES];
}

- (void) categoryButtonClick:(id)sender
{
    [[reductionViewController shareReductionViewController] showCategoryViewAnimated:YES];
}

#pragma mark - 视图控制器的函数

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
    
    
    _reductionModel = [[ReductionModel alloc] init];
    _reductionView = [[ReductionView alloc] initWithFrame:self.view.bounds];
    _reductionView.delegate = self;
    _reductionView.dataSource = _reductionModel;
    self.view = _reductionView;
    
    //第一次加载视图时刷新数据
    [self refreshData];
    
}

- (void)QF_viewDidUnload
{
    self.view = nil;
    
    [_reductionView release];
    _reductionView = nil;
    
    [_reductionModel release];
    _reductionModel = nil;
    
}

#pragma mark - tableView delegate 的 函数

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(QFTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *appId = [_reductionModel getAppIDWithIndex:[indexPath row]];
    
    [[reductionViewController shareReductionViewController] showAppDetailViewWithAppID:appId animated:YES];
}


- (void)refreshData
{
    //刷新数据
    [_reductionModel refreshDataCompletion:^(BOOL finished) {
        
        if (finished)
        {
            [_reductionView reloadData];
        }
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
