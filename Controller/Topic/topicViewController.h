//
//  topicViewController.h
//  爱限免
//
//  Created by qianfeng on 14-5-7.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "topicRootViewController.h"
#import "DetailViewController.h"
#import "TopicModel.h"

@interface topicViewController : UIViewController<UINavigationControllerDelegate>
{
    UINavigationController          *_navigationController;
    topicRootViewController         *_topicRootViewController;
    
    DetailViewController            *_detailViewController;
    
    TopicModel      *_topicModel;
}

@property(copy,nonatomic,readwrite) NSString* appid1;
@property(copy,nonatomic,readwrite) NSString* appid2;
@property(copy,nonatomic,readwrite) NSString* appid3;
@property(copy,nonatomic,readwrite) NSString* appid4;

@property (nonatomic,retain) TopicModel *currentModel;


+(topicViewController*) shareTopicViewController;

- (void) showBackTopicViewAnimated:(BOOL)animated;
- (void) showAppDetailViewWithAppID:(NSString *)appid animated:(BOOL)animated;

@end
