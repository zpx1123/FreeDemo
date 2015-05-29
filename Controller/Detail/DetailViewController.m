//
//  DetailViewController.m
//  爱限免
//
//  Created by qianfeng on 14-5-17.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "DetailViewController.h"
#import "UIDevice+UIDeviceCategory.h"
#import "limitsExemptsViewController.h"
#import "reductionViewController.h"
#import "freeViewController.h"
#import "topicViewController.h"
#import "hotAnnouncementViewController.h"

static DetailViewController *g_detailViewController = nil;

@interface DetailViewController ()

@end

@implementation DetailViewController

+(DetailViewController *)shareDeteilViewController
{
    return g_detailViewController;
}

-(void) setAppId:(NSString *)appId
{
    if (_appId == appId || [_appId isEqualToString:appId])
    {
        return;
    }
    
    [appId retain];
    [_appId release];
    _appId = [appId copy];
    [appId release];
    
    if (![self isViewLoaded])
    {
        [self loadView];
    }
    
    _detailModel.appId = _appId;
    
    [_detailModel refreshDataCompletion:^(BOOL finished) {
        
        if (finished)
        {
            [_detailView reloadfreah];
        }
    }];
}




- (id) init
{
    self = [super init];
    if (self)
    {
        g_detailViewController = self;
        
        if ([UIDevice systemVersionFirstNumber] < 7)
        {
            self.wantsFullScreenLayout = NO;
        }
        else
        {
            self.edgesForExtendedLayout = UIRectEdgeLeft | UIRectEdgeRight;
        }
        
        UILabel *titleView = [[UILabel alloc]initWithFrame:CGRectMake(200, 30, 100, 40)];
        titleView.text = @"应用详情";
        [titleView setTextColor:[UIColor whiteColor]];
        titleView.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:20];
        [titleView setTextAlignment:NSTextAlignmentCenter];
        [self.navigationItem setTitleView:titleView];
        [titleView release];
        
        UIBarButtonItem *leftBarButtonItem = nil;
        
        UIButton *leftBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBarButton.frame = CGRectMake(0, 0, 20, 20);
        
        [leftBarButton setImage:[UIImage imageNamed:@"btn_返回_正常.png"] forState:UIControlStateNormal];
        [leftBarButton addTarget:self action:@selector(detailButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarButton];
        
        self.navigationItem.leftBarButtonItem = leftBarButtonItem;
        [leftBarButtonItem release];
        
        
        
    }
    return self;
}

#pragma mark - 导航栏 按钮  事件 函数

- (void) detailButtonClick:(id) sender
{
    [[limitsExemptsViewController shareLimitsExemptsViewController] showBackLimitsViewAnimated:YES];
    [[reductionViewController shareReductionViewController] showBackReductionViewAnimated:YES];
    [[freeViewController shareFreeViewController] showBackFreeViewAnimated:YES];
    [[topicViewController shareTopicViewController] showBackTopicViewAnimated:YES];
    [[hotAnnouncementViewController shareHotAnnouncementViewController] showBackHotAnnouncementViewAnimated:YES];
    [[CategoryViewController shareCategoryViewController] showBackCategoryViewAnimated:YES];
    
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
    
	_detailModel = [[DetailModel alloc] init];
    _detailView = [[DetailView alloc] initWithFrame:self.view.bounds];
    _detailModel.appId = _appId;
    
    _detailView.dataSource = _detailModel;
    self.view = _detailView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 400;
}

-(void) reloaddata
{
    [_detailModel refreshDataCompletion:^(BOOL finished) {
        if(finished)
        {
            [_detailView reloadfreah];
        }
    }];
}

- (void) dealloc
{
    [_detailView release];
    _detailView = nil;
    
    [super dealloc];
}

#pragma mark - 视图跳转的函数

- (void)showAppDetailViewWithAppID:(NSString *)appid animated:(BOOL)animated
{
     self.appId = appid;
    [self reloaddata];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
