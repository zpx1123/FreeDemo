//
//  limitsExemptsRootViewController.m
//  爱限免
//
//  Created by qianfeng on 14-5-7.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "limitsExemptsRootViewController.h"
#import "UIDevice+UIDeviceCategory.h"
#import "limitsExemptsViewController.h"
#import "MainViewController.h"

#pragma mark - 私有接口的声明


@interface limitsExemptsRootViewController ()

@end

@implementation limitsExemptsRootViewController

#pragma mark - 构造、析构


/**
 *  析构函数
 */

-(void)dealloc
{
    [self QF_viewDidUnload];
    
    [super dealloc];
}

/**
 *  初始化函数
 *
 *  @return self
 */
- (id)init
{
    self = [super init];
    if (self)
    {
        UILabel *titleView = [[UILabel alloc]initWithFrame:CGRectMake(200, 30, 100, 40)];
        titleView.text = @"限免";
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
    [[limitsExemptsViewController shareLimitsExemptsViewController] showSetViewAnimated:YES];
}

- (void) categoryButtonClick:(id)sender
{
    [[limitsExemptsViewController shareLimitsExemptsViewController] showCategoryViewAnimated:YES];
}

#pragma mark - 视图控制器的函数

/**
 *  view开始加载
 */

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
    
    _limitFreeAppView = [[limitFreeAppView alloc] initWithFrame:self.view.bounds];
    _limitFreeAppView.delegate = self ;
    _programModel = [[programModel alloc] init];
    _limitFreeAppView.dataSource = _programModel ;
    self.view = _limitFreeAppView;
    
    //第一次加载视图时刷新数据
    [self refreshData];

}


- (void)QF_viewDidUnload
{
    self.view = nil;
    
    [_limitFreeAppView release];
    _limitFreeAppView = nil;
    
    [_programModel release];
    _programModel = nil;
    
}

#pragma mark - tableView delegate 的 函数

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(QFTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *appId = [_programModel getAppIDWithIndex:[indexPath row]];
    
    [[limitsExemptsViewController shareLimitsExemptsViewController] showAppDetailViewWithAppID:appId animated:YES];
}


- (void)refreshData
{
    //刷新数据
    [_programModel refreshDataCompletion:^(BOOL finished) {
        
        if (finished)
        {
            [_limitFreeAppView reloadData];
        }
    }];
}


@end
