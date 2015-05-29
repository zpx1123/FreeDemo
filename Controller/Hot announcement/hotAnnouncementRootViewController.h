//
//  hotAnnouncementRootViewController.h
//  爱限免
//
//  Created by qianfeng on 14-5-7.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotAnnouncementView.h"
#import "HotAnnouncementModel.h"

@interface hotAnnouncementRootViewController : UIViewController<UITableViewDelegate>
{
    HotAnnouncementModel    *_hotAnnouncementModel;
    HotAnnouncementView     *_hotAnnouncementView;
}

@property(copy,nonatomic,readwrite) NSString* appid;

- (void)refreshData;

- (void) settingButtonClick:(id)sender;

- (void) categoryButtonClick:(id)sender;


@end
