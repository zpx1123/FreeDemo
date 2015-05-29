//
//  CategoryRootViewController.m
//  爱限免
//
//  Created by qianfeng on 14-5-10.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "CategoryRootViewController.h"
#import "UIDevice+UIDeviceCategory.h"
#import "limitsExemptsViewController.h"
#import "reductionViewController.h"
#import "freeViewController.h"
#import "hotAnnouncementViewController.h"


@interface CategoryRootViewController ()

@end

@implementation CategoryRootViewController


#pragma mark -析构，构造
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
        titleView.text = @"限免分类";
        [titleView setTextColor:[UIColor whiteColor]];
        titleView.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:20];
        [titleView setTextAlignment:NSTextAlignmentCenter];
        [self.navigationItem setTitleView:titleView];
        [titleView release];
        
        UIBarButtonItem *leftBarButtonItem = nil;
        
        UIButton *leftBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBarButton.frame = CGRectMake(0, 0, 20, 20);
        
        [leftBarButton setImage:[UIImage imageNamed:@"btn_返回_正常.png"] forState:UIControlStateNormal];
        [leftBarButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarButton];
        self.navigationItem.leftBarButtonItem = leftBarButtonItem;
        [leftBarButtonItem release];
        
    }
    return self;
}

#pragma mark - 导航栏 按钮  事件 函数

-(void)backButtonClick:(id)sender
{
    [[limitsExemptsViewController shareLimitsExemptsViewController] showBackViewAnimated:YES];
    [[reductionViewController shareReductionViewController] showBackViewAnimated:YES];
    [[freeViewController shareFreeViewController] showBackViewAnimated:YES];
    [[hotAnnouncementViewController shareHotAnnouncementViewController] showBackViewAnimated:YES];
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
    
    _categoryAppView = [[CategoryAppView alloc] initWithFrame:self.view.bounds];
    _categoryModel = [[CategoryModel alloc] init];
    _categoryAppView.delegate = self;
    _categoryAppView.dataSource = _categoryModel ;
    self.view = _categoryAppView;
    
    [self refreshData];
    
}



- (void)QF_viewDidUnload
{
    [_categoryAppView release];
    _categoryAppView = nil;
    
    [_categoryModel release];
    _categoryModel = nil;
    
    
    self.view = nil;
}

- (void)refreshData
{
    //刷新数据
    [_categoryModel refreshDataCompletion:^(BOOL finished) {
        
        if (finished)
        {
            [_categoryAppView reloadData];
        }
    }];
}

#pragma mark - tableView delegate 的 函数

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *categoryId = [_categoryModel getCategoryIdWithIndex:[indexPath row]];
    [[CategoryViewController shareCategoryViewController] showAppDetailViewWithCategoryID:categoryId animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
