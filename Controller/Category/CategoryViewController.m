//
//  CategoryViewController.m
//  爱限免
//
//  Created by qianfeng on 14-5-10.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "CategoryViewController.h"


static CategoryViewController *g_categoryViewController = nil;
@interface CategoryViewController ()

@end

@implementation CategoryViewController

+(CategoryViewController *) shareCategoryViewController
{
    return g_categoryViewController;
}

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
        g_categoryViewController  = self;
        
        _categoryRootViewController = [[CategoryRootViewController alloc] init];
        _navigationController = [[UINavigationController alloc] initWithRootViewController:_categoryRootViewController];
        
        _navigationController.navigationBar.tintColor = [UIColor whiteColor];
        
        [_navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"顶部条背景.png"] forBarMetrics:UIBarMetricsDefault];
        
        _navigationController.view.frame = self.view.bounds;
        
        [self.view addSubview:_navigationController.view];
        
        _categoryDetailViewController = [[CategoryDetailViewController alloc] init];
        
        _detailViewController = [[DetailViewController alloc] init];
    }
    return self;
}

#pragma mark - 视图跳转的函数
- (void) showAppDetailViewWithCategoryID:(NSString *)categoryID animated:(BOOL)animated
{
    _categoryDetailViewController.categoryID = categoryID;

    [_navigationController pushViewController:_categoryDetailViewController animated:animated];
}

- (void)showAppDetailViewWithAppID:(NSString *)appid animated:(BOOL)animated
{
    _detailViewController.appId = appid;
    
    [_navigationController pushViewController:_detailViewController animated:animated];
}

- (void) showBackCategoryViewAnimated:(BOOL)animated
{
    [_navigationController popViewControllerAnimated:animated];
}

- (void)QF_viewDidUnload
{
    
    [_categoryRootViewController release];
    _categoryRootViewController = nil;
    
    [_navigationController release];
    _navigationController = nil;
    
    [_detailViewController release];
    _detailViewController = nil;
    
    [_categoryDetailViewController release];
    _categoryDetailViewController = nil;
    
    self.view = nil;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
