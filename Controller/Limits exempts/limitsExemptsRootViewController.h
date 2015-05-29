//
//  limitsExemptsRootViewController.h
//  爱限免
//
//  Created by qianfeng on 14-5-7.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LimitFreeAppIView.h"
#import "programModel.h"


@interface limitsExemptsRootViewController : UIViewController<UITableViewDelegate>
{
    limitFreeAppView                *_limitFreeAppView;
    programModel                    *_programModel;
    
}


- (void)refreshData;

- (void) settingButtonClick:(id)sender;

- (void) categoryButtonClick:(id)sender;


@end
