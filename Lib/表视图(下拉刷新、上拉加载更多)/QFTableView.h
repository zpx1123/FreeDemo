//
//  QFTableView.h
//  爱限免
//
//  Created by chen cheng on 14-5-8.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"
#import "LoadMoreTableFooterView.h"

@protocol QFTableViewDataSource <NSObject, UITableViewDataSource>

@required
- (void)refreshDataCompletion:(void (^)(BOOL finished))completion;

- (void)loadMoreDataCompletion:(void (^)(BOOL finished))completion;

@end


/**
 *  自带下拉刷新和上拉加载更多的效果、QFTableView的DataSource必须遵循QFTableViewDataSource协议
 */
@interface QFTableView : UITableView<EGORefreshTableHeaderDelegate, LoadMoreTableFooterDelegate, UITableViewDelegate>
{
    EGORefreshTableHeaderView *_egoRefreshTableHeaderView;
    BOOL  _isRefreshing;
    
    LoadMoreTableFooterView *_loadMoreTableFooterView;
    BOOL  _isLoadMoreing;
    
    id<UITableViewDelegate> _backupDelegate;
}

@property (nonatomic, assign)   id <QFTableViewDataSource> dataSource;

@end
