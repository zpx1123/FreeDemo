//
//  
//  爱限免
//
//  Created by qianfeng on 14-5-10.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryRootViewController.h"
#import "CategoryDetailViewController.h"
#import "DetailViewController.h"

@interface CategoryViewController : UIViewController
{
    UINavigationController        *_navigationController;
    CategoryRootViewController    *_categoryRootViewController;
    
    CategoryDetailViewController    *_categoryDetailViewController;

    DetailViewController            *_detailViewController;
}

+(CategoryViewController *) shareCategoryViewController;

- (void) showAppDetailViewWithCategoryID:(NSString *)categoryID animated:(BOOL)animated;
- (void)showAppDetailViewWithAppID:(NSString *)appid animated:(BOOL)animated;
- (void) showBackCategoryViewAnimated:(BOOL)animated;

@end
