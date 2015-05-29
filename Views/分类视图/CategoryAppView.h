//
//  CategoryAppView.h
//  爱限免
//
//  Created by qianfeng on 14-5-10.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFTableView.h"
#import "CategoryModel.h"

@interface CategoryAppView : UIView <UITableViewDelegate>
{
    QFTableView                 *_tableView;
    CategoryModel               *_categoryModel;
}

@property (nonatomic , assign , readwrite) id<UITableViewDataSource>dataSource;
@property (nonatomic , assign , readwrite) id <UITableViewDelegate> delegate;

- (void)reloadData;

@end
