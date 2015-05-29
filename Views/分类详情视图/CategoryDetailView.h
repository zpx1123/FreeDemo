//
//  CategoryDetailView.h
//  爱限免
//
//  Created by qianfeng on 14-5-21.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryDetailView : UIView<UITableViewDelegate, UISearchBarDelegate>
{
    UISearchBar             *_searchBar;
    UITableView             *_tableView;
}

@property (nonatomic, assign, readwrite)   id <UITableViewDataSource> dataSource;
@property (nonatomic, assign, readwrite)   id <UITableViewDelegate> delegate;

- (void)reloadData;

@end
