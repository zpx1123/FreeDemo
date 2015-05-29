//
//  reductionViewController.h
//  爱限免
//
//  Created by qianfeng on 14-5-7.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "reductionRootViewController.h"
#import "CategoryViewController.h"
#import "setRootViewController.h"
#import "DetailViewController.h"
#import "DetailView.h"
#import "SearchAppViewController.h"

@interface reductionViewController : UIViewController<UINavigationControllerDelegate>
{
    UINavigationController          *_navigationController;
    reductionRootViewController     *_reductionRootViewController;
    DetailViewController            *_detailViewController;
    
    CategoryViewController          *_categoryViewController;   // 分类
    
    DetailView  *_detailView;
    
    SearchAppViewController         *_searchAppViewController;//查询
    setRootViewController           *_setRootViewController;

}

@property(copy,nonatomic,readwrite) NSString* appid;

+ (reductionViewController *) shareReductionViewController;

- (void) showBackViewAnimated:(BOOL)animated;
- (void) showSetViewAnimated:(BOOL)animated;
- (void) showCategoryViewAnimated:(BOOL)animated;
- (void) showBackReductionViewAnimated:(BOOL)animated;
- (void) showAppDetailViewWithAppID:(NSString *)appid animated:(BOOL)animated;
- (void) showAppSearchResultsAnimated:(NSString*)str;

@end
