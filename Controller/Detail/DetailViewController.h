//
//  DetailViewController.h
//  爱限免
//
//  Created by qianfeng on 14-5-17.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailModel.h"
#import "DetailView.h"


@interface DetailViewController : UIViewController
{
    DetailModel     *_detailModel;
    DetailView      *_detailView;
}

@property (copy ,nonatomic ,readwrite) NSString *appId;

+(DetailViewController *)shareDeteilViewController;

- (void) showAppDetailViewWithAppID:(NSString *)appid animated:(BOOL)animated;


@end
