//
//  reductionRootViewController.h
//  爱限免
//
//  Created by qianfeng on 14-5-7.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReductionView.h"
#import "ReductionModel.h"

@interface reductionRootViewController : UIViewController<UITableViewDelegate>
{
    ReductionModel  *_reductionModel;
    ReductionView   *_reductionView;
}

@property(copy,nonatomic,readwrite) NSString* appid;

- (void)refreshData;

- (void) settingButtonClick:(id)sender;

- (void) categoryButtonClick:(id)sender;


@end
