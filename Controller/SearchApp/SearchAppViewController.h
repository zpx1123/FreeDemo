//
//  SearchAppViewController.h
//  爱限免
//
//  Created by qianfeng on 14-5-16.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LimitFreeAppIView.h"
#import "SearchModel.h"

@interface SearchAppViewController : UIViewController<UITableViewDelegate>
{
    SearchModel         *_searchModel;
    limitFreeAppView    *_limitFreeAppView;
}

@property (copy ,nonatomic ,readwrite) NSString *searchBarText;//搜索框里面的值
@property (copy ,nonatomic ,readwrite) NSString *numberViewController;//传参做判断带入的是什么控制器


@end
