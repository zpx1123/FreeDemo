//
//  freeRootViewController.h
//  爱限免
//
//  Created by qianfeng on 14-5-7.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FreeModel.h"
#import "FreeView.h"

@interface freeRootViewController : UIViewController<UITableViewDelegate>
{
    FreeModel       *_freeModel;
    FreeView        *_freeView;
}

@property(copy,nonatomic,readwrite) NSString* appid;

- (void)refreshData;

- (void) settingButtonClick:(id)sender;

- (void) categoryButtonClick:(id)sender;

@end
