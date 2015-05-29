//
//  CategoryRootViewController.h
//  爱限免
//
//  Created by qianfeng on 14-5-10.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryAppView.h"
#import "CategoryModel.h"

@interface CategoryRootViewController : UIViewController<UITableViewDelegate>
{
    CategoryAppView *_categoryAppView;
    CategoryModel   *_categoryModel;
    
}

- (void)refreshData;

@end
