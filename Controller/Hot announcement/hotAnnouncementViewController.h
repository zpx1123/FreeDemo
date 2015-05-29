//
//  hotAnnouncementViewController.h
//  爱限免
//
//  Created by qianfeng on 14-5-7.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "hotAnnouncementRootViewController.h"
#import "CategoryViewController.h"

#import "DetailViewController.h"
#include "DetailView.h"

#import "SearchAppViewController.h"
#import "setRootViewController.h"

@interface hotAnnouncementViewController : UIViewController<UINavigationControllerDelegate>
{
    UINavigationController              *_navigationController;
    hotAnnouncementRootViewController   *_hotAnnouncementRootViewController;
    DetailViewController            *_detailViewController;
    
    setRootViewController           *_setRootViewController;//设置
    CategoryViewController          *_categoryViewController;   // 分类
    
    DetailView  *_detailView;
    SearchAppViewController         *_searchAppViewController;//查询

}

@property(copy,nonatomic,readwrite) NSString* appid;

+ (hotAnnouncementViewController *) shareHotAnnouncementViewController;

- (void) showBackViewAnimated:(BOOL)animated;
- (void) showSetViewAnimated:(BOOL)animated;
- (void) showCategoryViewAnimated:(BOOL)animated;
- (void) showBackHotAnnouncementViewAnimated:(BOOL)animated;
- (void) showAppDetailViewWithAppID:(NSString *)appid animated:(BOOL)animated;
- (void) showAppSearchResultsAnimated:(NSString*)str;

@end
