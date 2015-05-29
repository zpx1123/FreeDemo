//
//  DetailView.h
//  爱限免
//
//  Created by qianfeng on 14-5-10.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailView.h"
#import "DetailModel.h"

@interface DetailView : UIView<UITableViewDelegate>
{
    UITableView     *_tabelView;
    UIActionSheet   *_actionSheet;
}


-(void)reloadfreah;

@property(assign, readwrite, nonatomic)DetailModel *currModel;
@property (nonatomic,assign,readwrite) id<UITableViewDataSource>dataSource;

@end
