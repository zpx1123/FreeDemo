//
//  CategoryDetailViewController.h
//  爱限免
//
//  Created by qianfeng on 14-5-21.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryDetailModel.h"
#import "CategoryDetailView.h"

@interface CategoryDetailViewController : UIViewController<UITableViewDelegate>
{
    CategoryDetailModel *_categoryDetailModel;
    CategoryDetailView  *_categoryDetailView;
}


@property (copy ,nonatomic ,readwrite) NSString *categoryID;


@end
