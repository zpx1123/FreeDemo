//
//  limitsExemptsViewController.h
//  爱限免
//
//  Created by qianfeng on 14-5-7.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "limitsExemptsRootViewController.h"
#import "CategoryViewController.h"

#import "DetailViewController.h"
#import "DetailView.h"

#import "reductionViewController.h"
#import "SearchAppViewController.h"
#import "setRootViewController.h"

@interface limitsExemptsViewController : UIViewController
{
    UINavigationController          *_navigationController;
    limitsExemptsRootViewController *_limitsExemptsRootViewController;
    DetailViewController            *_detailViewController;
    reductionViewController          *_reductionViewController;
    
    CategoryViewController          *_categoryViewController;   // 分类
    
    DetailView  *_detailView;
    
    SearchAppViewController         *_searchAppViewController;//搜索
    
    setRootViewController           *_setRootViewController;
}


+ (limitsExemptsViewController *) shareLimitsExemptsViewController;

- (void) showBackViewAnimated:(BOOL)animated;
- (void) showBackLimitsViewAnimated:(BOOL)animated;
- (void) showSetViewAnimated:(BOOL)animated;
- (void) showCategoryViewAnimated:(BOOL)animated;
- (void) showAppDetailViewWithAppID:(NSString *)appid animated:(BOOL)animated;
- (void) showAppSearchResultsAnimated:(NSString*) str;



@end
