//
//  limitsExemptsViewController.m
//  爱限免
//
//  Created by qianfeng on 14-5-7.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "limitsExemptsViewController.h"
#import "UIDevice+UIDeviceCategory.h"

#pragma mark - 私有接口的声明

static limitsExemptsViewController* g_limitsExemptsViewController = nil;

@interface limitsExemptsViewController ()

@end

@implementation limitsExemptsViewController


+ (limitsExemptsViewController *)shareLimitsExemptsViewController
{
    return g_limitsExemptsViewController;
}

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
        g_limitsExemptsViewController = self;

        UIImage * normalImage = [UIImage imageNamed:@"btn_限免_正常.png"];
        UIImage * clickImage = [UIImage imageNamed:@"btn_限免_点击.png"];
        NSString* str = [[NSString alloc] initWithString:@"限免1"];
        
//        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:100/255.f green:192/255.f blue:83/255.f alpha:1], NSForegroundColorAttributeName,nil ] forState:UIControlStateSelected]; //设置UITabBarItem文字颜色
//        
        
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
        self.edgesForExtendedLayout = UIRectEdgeTop|UIRectEdgeLeft | UIRectEdgeRight;
    }
    
    _limitsExemptsRootViewController = [[limitsExemptsRootViewController alloc] init];
    
    _navigationController = [[UINavigationController alloc] initWithRootViewController:_limitsExemptsRootViewController];
    
    _navigationController.navigationBar.tintColor = [UIColor whiteColor];

    [_navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"顶部条背景.png"] forBarMetrics:UIBarMetricsDefault];
    //如果上面是navigationBar，则searchBar不会移动，但如果是UINavigationController自带过来的，则会上移覆盖
    
    _navigationController.view.frame = self.view.bounds;
    
    _navigationController.delegate = self ;
    
    [self.view addSubview:_navigationController.view];
    
    _categoryViewController = [[CategoryViewController alloc] init]; //初始化分类页面
    
    _detailViewController = [[DetailViewController alloc] init]; //初始化详情页面
    
    _searchAppViewController = [[SearchAppViewController alloc] init];//初始化搜索
    
    _setRootViewController = [[setRootViewController alloc] init];
}

#pragma mark - 视图跳转的函数

- (void)showAppDetailViewWithAppID:(NSString *)appid animated:(BOOL)animated
{
    _detailViewController.appId = appid;
    
    [_navigationController pushViewController:_detailViewController animated:animated];
}

- (void) showBackLimitsViewAnimated:(BOOL)animated
{
    [_navigationController popViewControllerAnimated:animated];
}

- (void)showBackViewAnimated:(BOOL)animated
{
    [_navigationController popViewControllerAnimated:YES];
}

#pragma mark - 导航栏 按钮  事件 函数

- (void) showSetViewAnimated:(BOOL)animated
{
    [UIView transitionWithView:self.view duration:1 options:UIViewAnimationOptionTransitionCurlUp animations:^{

        _setRootViewController.str = @"limitsExemptsViewController";

        [_navigationController pushViewController:_setRootViewController animated:NO];

    } completion:^(BOOL finished) {


    }];

}


- (void) showCategoryViewAnimated:(BOOL)animated
{
    [_navigationController presentViewController:_categoryViewController animated:animated completion:^{
        
    }];
}

- (void) showAppSearchResultsAnimated:(NSString*)str
{
  [UIView transitionWithView:self.view duration:1 options:UIViewAnimationOptionTransitionCurlUp animations:^{
      
      _searchAppViewController.numberViewController = @"limitsExemptsViewController";
      _searchAppViewController.searchBarText = str;
      
      [_navigationController pushViewController:_searchAppViewController animated:NO];
      
      
  } completion:^(BOOL finished) {
      
      
  }];
    
}

#pragma mark - 自定义QF_viewDidUnload析构函数

- (void)QF_viewDidUnload
{
    self.view = nil;
    
    [_limitsExemptsRootViewController release];
    _limitsExemptsRootViewController = nil;
    
    [_navigationController release];
    _navigationController = nil;
    
    [_detailViewController release];
    _detailViewController = nil;
    
    [_categoryViewController release];
    _categoryViewController = nil;
    
    [_searchAppViewController  release];
    _searchAppViewController = nil;
    
    [_setRootViewController release];
    _setRootViewController = nil;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
