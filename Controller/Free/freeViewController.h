//
//  freeViewController.h
//  爱限免
//
//  Created by qianfeng on 14-5-7.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "freeRootViewController.h"
#import "CategoryViewController.h"

#import "DetailViewController.h"
#import "DetailView.h"

#import "SearchAppViewController.h"
#import "setRootViewController.h"

@interface freeViewController : UIViewController<UINavigationControllerDelegate>
{
    UINavigationController          *_navigationController;
    freeRootViewController          *_freeRootViewController;
    DetailViewController            *_detailViewController;
    
    CategoryViewController          *_categoryViewController;   // 分类
    
    DetailView  *_detailView;
    SearchAppViewController         *_searchAppViewController;//查询

    setRootViewController           *_setRootViewController;
}

@property(copy,nonatomic,readwrite) NSString* appid;

+ (freeViewController *) shareFreeViewController;

- (void) showBackViewAnimated:(BOOL)animated;
- (void) showSetViewAnimated:(BOOL)animated;
- (void) showCategoryViewAnimated:(BOOL)animated;
- (void) showBackFreeViewAnimated:(BOOL)animated;
- (void) showAppDetailViewWithAppID:(NSString *)appid animated:(BOOL)animated;
- (void) showAppSearchResultsAnimated:(NSString*)str;


@end
