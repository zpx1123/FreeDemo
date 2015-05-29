//
//  hotAnnouncementViewController.m
//  爱限免
//
//  Created by qianfeng on 14-5-7.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "hotAnnouncementViewController.h"

static hotAnnouncementViewController* g_hotAnnouncementViewController= nil;

@interface hotAnnouncementViewController ()

@end

@implementation hotAnnouncementViewController

+ (hotAnnouncementViewController *) shareHotAnnouncementViewController
{
    return g_hotAnnouncementViewController;
}

#pragma mark - 构造、析构

/**
 *  析构函数
 */

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
        g_hotAnnouncementViewController = self;
        
        UIImage * normalImage = [UIImage imageNamed:@"btn_热点_正常.png"];
        UIImage * clickImage = [UIImage imageNamed:@"btn_热点_点击.png"];
        NSString* str = [[NSString alloc] initWithString:@"热榜"];
        
        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:100/255.f green:192/255.f blue:83/255.f alpha:1], NSForegroundColorAttributeName,nil ] forState:UIControlStateSelected]; //设置UITabBarItem文字颜色
        
        
        [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                            NSForegroundColorAttributeName :
                                                                [UIColor colorWithRed: 146/255.f
                                                                                green: 146/255.f
                                                                                 blue: 146/255.f
                                                                                alpha: 1],
                                                            NSFontAttributeName:[UIFont fontWithName:@"Arial Rounded MT Bold" size:13]}
                                                 forState:UIControlStateNormal]; //设置UITabBarItem的字体和大小颜色
        
        [[UITabBar appearance] setTintColor:[UIColor colorWithRed:100/255.f green:192/255.f blue:83/255.f alpha:1]]; //设置图片选中后颜色
        
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:str image:normalImage selectedImage:clickImage];
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    _hotAnnouncementRootViewController = [[hotAnnouncementRootViewController alloc] init];
    
    
    _navigationController = [[UINavigationController alloc] initWithRootViewController:_hotAnnouncementRootViewController];
    
    _navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [_navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"顶部条背景.png"] forBarMetrics:UIBarMetricsDefault];
    
    _navigationController.view.frame = self.view.bounds;
    
    _navigationController.delegate = self ;
    
    [self.view addSubview:_navigationController.view];
    
    _categoryViewController = [[CategoryViewController alloc] init]; //初始化分类页面
    _detailViewController = [[DetailViewController alloc] init];

    _searchAppViewController = [[SearchAppViewController alloc] init];//初始化搜索

    _setRootViewController = [[setRootViewController alloc] init];
}

#pragma mark - 自定义QF_viewDidUnload析构函数

- (void)QF_viewDidUnload
{
    self.view = nil;
    
    [_detailViewController release];
    _detailViewController = nil;
    
    [_navigationController release];
    _navigationController = nil;
    
    [_hotAnnouncementRootViewController release];
    _hotAnnouncementRootViewController = nil;
    
    [_categoryViewController release];
    _categoryViewController = nil;
    
    [_setRootViewController release];
    _setRootViewController = nil;
    
    [_searchAppViewController release];
    _searchAppViewController = nil;
    
}

#pragma mark - 视图跳转的函数

-(void) showSetViewAnimated:(BOOL)animated
{
    [UIView transitionWithView:self.view duration:1 options:UIViewAnimationOptionTransitionCurlUp animations:^{
        
        _setRootViewController.str = @"hotAnnouncementViewController";

        [_navigationController pushViewController:_setRootViewController animated:NO];
        
    } completion:^(BOOL finished) {
        
        
    }];

}

- (void) showCategoryViewAnimated:(BOOL)animated
{
    [_navigationController presentViewController:_categoryViewController animated:animated completion:^{
        
        
    }];
}

- (void)showBackViewAnimated:(BOOL)animated
{
    [_navigationController popViewControllerAnimated:YES];
}

- (void)showAppDetailViewWithAppID:(NSString *)appid animated:(BOOL)animated
{
    _detailViewController.appId = appid;
    
    [_navigationController pushViewController:_detailViewController animated:animated];
}

- (void) showBackHotAnnouncementViewAnimated:(BOOL)animated;
{
    [_navigationController popViewControllerAnimated:animated];
}

- (void) showAppSearchResultsAnimated:(NSString*)str
{
    [UIView transitionWithView:self.view duration:1 options:UIViewAnimationOptionTransitionCurlUp animations:^{
        
        _searchAppViewController.numberViewController = @"hotAnnouncementViewController";
        _searchAppViewController.searchBarText = str;
        [_navigationController pushViewController:_searchAppViewController animated:NO];
        
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
