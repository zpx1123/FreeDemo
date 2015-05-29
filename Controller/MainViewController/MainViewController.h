//
//  MainViewController.h
//  空
//
//  Created by qianfeng on 14-4-28.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "limitsExemptsViewController.h"
#import "reductionViewController.h"
#import "freeViewController.h"
#import "topicViewController.h"
#import "hotAnnouncementViewController.h"
#import "OriginalImageViewController.h"

@interface MainViewController : UIViewController<UIActionSheetDelegate,UINavigationControllerDelegate>
{
    limitsExemptsViewController     *_limitsExemptsViewController;
    reductionViewController         *_reductionViewController;
    freeViewController              *_freeViewController;
    topicViewController             *_topicViewController;
    hotAnnouncementViewController   *_hotAnnouncementViewController;
    
    UITabBarController              *_tabBarController;
    
    UIActionSheet   *_actionSheet;
    
    //其他非标签栏视图控制器管理的视图控制器 全屏截图视图控制器、设置视图控制器、分类视图控制器
    OriginalImageViewController *_originalImageViewController;

}

+(MainViewController *)shareMainViewController;


-(void)shareButtonClick:(id)sender;
-(void)collectButtonClick:(id)sender;

/**
 *  显示屏幕截图的视图
 *
 *  @param imageUrlStringArray 五张截图的url字符串数组
 *  @param animated            是否需要动画
 */
- (void)showOriginalImageViewWithImageUrlStringArray:(NSArray *)imageUrlStringArray animated:(BOOL)animated;

- (void)dismissOriginalImageViewAnimated:(BOOL)animated;

- (void)setShowTabBar:(BOOL)isShow;

@end
