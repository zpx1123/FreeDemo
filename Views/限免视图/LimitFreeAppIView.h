//
//  LimitFreeAppIntroductionView.h
//  爱限免
//
//  Created by qianfeng on 14-5-7.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFTableView.h"

//限免分类——App简介视图
@interface limitFreeAppView : UIView<UITableViewDelegate, UISearchBarDelegate>
{
    UISearchBar             *_searchBar;
    QFTableView             *_tableView;
}

@property (nonatomic, assign, readwrite)   id <UITableViewDataSource> dataSource;
@property (nonatomic, assign, readwrite)   id <UITableViewDelegate> delegate;

- (void)reloadData;

@end
