//
//  topicViewController.m
//  爱限免
//
//  Created by qianfeng on 14-5-7.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "topicViewController.h"

static topicViewController* g_topicViewController = nil;

@interface topicViewController ()

@end

@implementation topicViewController

+(topicViewController*)shareTopicViewController
{
    return g_topicViewController;
}

#pragma mark - 析构，构造函数

-(void)dealloc
{
    [_detailViewController release];
    _detailViewController = nil;
    
    [_topicRootViewController release];
    _topicRootViewController = nil;
    
    [_navigationController release];
    _navigationController = nil;
    
    [super dealloc];
    
}
- (id)init
{
    self = [super init];
    
    if (self)
    {
        g_topicViewController = self;
        
        UIImage * normalImage = [UIImage imageNamed:@"btn_专题_正常.png"];
        UIImage * clickImage = [UIImage imageNamed:@"btn_专题_点击.png"];
        NSString* str = [[NSString alloc] initWithString:@"专题"];
        
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
    
    _topicRootViewController = [[topicRootViewController alloc] init];
    
    _navigationController = [[UINavigationController alloc] initWithRootViewController:_topicRootViewController];
    
    _navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [_navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"顶部条背景.png"] forBarMetrics:UIBarMetricsDefault];
    
    _navigationController.view.frame = self.view.bounds;
    
    _navigationController.delegate = self ;
    
    [self.view addSubview:_navigationController.view];
    
    
    _detailViewController = [[DetailViewController alloc] init];
}


#pragma mark - 视图跳转的函数

- (void)showAppDetailViewWithAppID:(NSString *)appid animated:(BOOL)animated
{
    _detailViewController.appId = appid;
    
    [_navigationController pushViewController:_detailViewController animated:animated];
}

- (void) showBackTopicViewAnimated:(BOOL)animated
{
    [_navigationController popViewControllerAnimated:animated];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
