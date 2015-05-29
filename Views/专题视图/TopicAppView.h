//
//  TopicAppView.h
//  爱限免
//
//  Created by qianfeng on 14-5-11.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"
#import "LoadMoreTableFooterView.h"
#import "QFTableView.h"

@interface TopicAppView : UIView<UITableViewDelegate>
{
    QFTableView             *_tableView;
}

@property (nonatomic, assign, readwrite)   id <UITableViewDataSource> dataSource;
@property (nonatomic, assign, readwrite)   id <UITableViewDelegate> delegate;

- (void)reloadData;


@end



