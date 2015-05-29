//
//  CategoryDetailViewController.m
//  爱限免
//
//  Created by qianfeng on 14-5-21.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "CategoryDetailViewController.h"
#import "UIDevice+UIDeviceCategory.h"
#import "CategoryViewController.h"

@interface CategoryDetailViewController ()

@end

@implementation CategoryDetailViewController

- (id)init
{
    self = [super init];
    if (self)
    {

    }
    return self;
}

-(void) setCategoryID:(NSString *)categoryID
{
    if (_categoryID == categoryID || [_categoryID isEqualToString:categoryID])
    {
        return;
    }
    
    [categoryID retain];
    [_categoryID release];
    _categoryID = [categoryID copy];
    [categoryID release];
    
    if (![self isViewLoaded])
    {
        [self loadView];
    }
    
    _categoryDetailModel.categoryID = _categoryID;
    
    [_categoryDetailModel refreshDataCompletion:^(BOOL finished) {
        
        if (finished)
        {
            [_categoryDetailView reloadData];
        }
    }];
}



- (void)loadView
{
    [super loadView];
    
    [super loadView];
    
    if ([UIDevice systemVersionFirstNumber] < 7)
    {
        self.wantsFullScreenLayout = NO;
    }
    else
    {
        self.edgesForExtendedLayout = UIRectEdgeBottom|UIRectEdgeLeft | UIRectEdgeRight;
    }
    
    _categoryDetailView = [[CategoryDetailView alloc] initWithFrame:self.view.bounds];
    _categoryDetailModel = [[CategoryDetailModel alloc] init];
    _categoryDetailView.dataSource = _categoryDetailModel ;
    _categoryDetailView.delegate = self;
    self.view = _categoryDetailView;
    
    
    [self refreshData];

}


- (void)refreshData
{
    //刷新数据
    [_categoryDetailModel refreshDataCompletion:^(BOOL finished) {
        
        if (finished)
        {
            [_categoryDetailView reloadData];
        }
    }];
}

#pragma mark - tableView delegate 函数

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


- (void)tableView:(QFTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *appId = [_categoryDetailModel getAppIDWithIndex:[indexPath row]];
    
    [[CategoryViewController shareCategoryViewController] showAppDetailViewWithAppID:appId animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
