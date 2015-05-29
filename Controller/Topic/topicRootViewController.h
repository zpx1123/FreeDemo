//
//  topicRootViewController.h
//  爱限免
//
//  Created by qianfeng on 14-5-7.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicAppView.h"
#import "TopicModel.h"


@interface topicRootViewController : UIViewController<UITableViewDelegate>
{
    TopicAppView    *_topicAppView;
    TopicModel      *_topicModel;
}



@end
