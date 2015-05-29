//
//  SearchAppViewController.m
//  爱限免
//
//  Created by qianfeng on 14-5-16.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "SearchAppViewController.h"
#import "CONST.h"
#import "limitsExemptsViewController.h"
#import "freeViewController.h"
#import "hotAnnouncementViewController.h"

@interface SearchAppViewController ()

@end

@implementation SearchAppViewController

#pragma mark - 析构，构造函数

- (void)dealloc
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
        titleView.text = @"搜索结果";
        [titleView setTextColor:[UIColor whiteColor]];
        titleView.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:22];
        [titleView setTextAlignment:NSTextAlignmentCenter];
        [self.navigationItem setTitleView:titleView];
        [titleView release];
        
        
        UIBarButtonItem *leftBarButtonItem = nil;
        
        UIButton *leftBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBarButton.frame = CGRectMake(0, 0, 20, 20);
        
        [leftBarButton setImage:[UIImage imageNamed:@"btn_返回_正常.png"] forState:UIControlStateNormal];
        [leftBarButton addTarget:self action:@selector(settingButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarButton];
        
        self.navigationItem.leftBarButtonItem = leftBarButtonItem;
        
    }
    return self;
}

- (void) settingButtonClick:(id) sender
{
    [[limitsExemptsViewController shareLimitsExemptsViewController] showBackLimitsViewAnimated:YES];
    [[reductionViewController shareReductionViewController] showBackReductionViewAnimated:YES];
    [[freeViewController shareFreeViewController] showBackFreeViewAnimated:YES];
    [[hotAnnouncementViewController shareHotAnnouncementViewController] showBackHotAnnouncementViewAnimated:YES];
}

- (void) setNumberViewController:(NSString *)numberViewController
{
    if (_numberViewController == numberViewController || [_numberViewController isEqualToString:numberViewController])
    {
        return;
    }
    
    [numberViewController retain];
    [_numberViewController release];
    _numberViewController = [numberViewController copy] ;
    [numberViewController release];
}


-(void) setSearchBarText:(NSString *)searchBarText
{
    if (_searchBarText == searchBarText || [_searchBarText isEqualToString:searchBarText])
    {
        return;
    }
    
    [searchBarText retain];
    [_searchBarText release];
    _searchBarText = [searchBarText copy];
    [searchBarText release];
    
    if (![self isViewLoaded])
    {
        [self loadView];
    }
    
    _searchModel.searchText = _searchBarText;
    _searchModel.numberViewController = _numberViewController;
    
    [_searchModel refreshDataCompletion:^(BOOL finished) {
        
        if (finished)
        {
            [_limitFreeAppView reloadData];
        }
        
    }];
}



- (void)loadView
{
    [super loadView];
    
	_limitFreeAppView = [[limitFreeAppView alloc] initWithFrame:self.view.bounds];
    _limitFreeAppView.delegate = self ;
    _searchModel = [[SearchModel alloc] init];
    _limitFreeAppView.dataSource = _searchModel ;
    self.view = _limitFreeAppView;
}

- (void)QF_viewDidUnload
{
    self.view = nil;
    
    [_searchModel release];
    _searchModel = nil;
    
    [_limitFreeAppView release];
    _limitFreeAppView = nil;
}

#pragma mark - tableView delegate 的 函数

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
