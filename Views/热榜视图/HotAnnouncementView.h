//
//  HotAnnouncementView.h
//  爱限免
//
//  Created by qianfeng on 14-5-15.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFTableView.h"

@interface HotAnnouncementView : UIView<UITableViewDelegate,UISearchBarDelegate>
{
    UISearchBar             *_searchBar;
    QFTableView             *_tableView;
}

- (void)reloadData;

@property (nonatomic,assign,readwrite) id<UITableViewDelegate> delegate;
@property (nonatomic,assign,readwrite) id<UITableViewDataSource>dataSource;

@end
