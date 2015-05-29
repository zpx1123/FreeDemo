//
//  MainViewController.m
//  空
//
//  Created by qianfeng on 14-4-28.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "MainViewController.h"
#import "QFActivityIndicatorView.h"


static MainViewController* g_mainViewController = nil;

#pragma mark - 私有接口的声明
@interface MainViewController ()

@end

@implementation MainViewController


+ (MainViewController *)shareMainViewController
{
    return g_mainViewController;
}

#pragma mark - 析构,构造

-(void)dealloc
{
    [_limitsExemptsViewController release];
    _limitsExemptsViewController = nil;
    
    [_reductionViewController release];
    _reductionViewController = nil;
    
    [_freeViewController release];
    _freeViewController = nil;
    
    [_topicViewController release];
    _topicViewController = nil;
    
    [_hotAnnouncementViewController release];
    _hotAnnouncementViewController = nil;
    
    [_tabBarController release];
    _tabBarController = nil;
    
    [_actionSheet release];
    _actionSheet = nil;
    
    [super dealloc];
}


- (id)init
{
    self = [super init];
    if (self)
    {
        g_mainViewController = self;
    }
    return self;
}

#pragma mark - 视图控制器的函数

- (void)loadView
{
    [super loadView];
    
    _limitsExemptsViewController = [[limitsExemptsViewController alloc] init];
    _reductionViewController = [[reductionViewController alloc] init];
    _freeViewController = [[freeViewController alloc] init];
    _topicViewController = [[topicViewController alloc] init];
    _hotAnnouncementViewController = [[hotAnnouncementViewController alloc] init];
    _tabBarController = [[UITabBarController alloc] init];
    
    _tabBarController.viewControllers = [NSArray arrayWithObjects:_limitsExemptsViewController,_reductionViewController,_freeViewController,_topicViewController,_hotAnnouncementViewController, nil];
    
    [self.view addSubview:_tabBarController.view];
    
    _originalImageViewController = [[OriginalImageViewController alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - 各种触发事件

-(void)shareButtonClick:(id)sender
{
    _actionSheet = [[UIActionSheet alloc] initWithTitle:@"分享" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"新浪微博" otherButtonTitles:@"微信好友",@"微信圈子",@"邮件",@"短信",nil];
    [_actionSheet showInView:self.view];
}

//test
-(void)collectButtonClick:(id)sender
{
    NSLog(@"collectButtonClick");
}

/**
 *  显示屏幕截图的视图
 *
 *  @param imageUrlStringArray 五张截图url字符串数组
 *  @param animated            是否需要动画
 */
- (void)showOriginalImageViewWithImageUrlStringArray:(NSArray *)imageUrlStringArray animated:(BOOL)animated
{
    //屏幕截图原图视图控制器
    if (animated)
    {
        [UIView transitionWithView:self.view duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            
        } completion:^(BOOL finished) {
            
        }];
    }
    
    _originalImageViewController.imageUrlStringArray = imageUrlStringArray;
    _originalImageViewController.view.frame = self.view.bounds;
    [self.view addSubview:_originalImageViewController.view];
}

- (void)dismissOriginalImageViewAnimated:(BOOL)animated
{
    if (animated)
    {
        [UIView transitionWithView:self.view duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            
        } completion:^(BOOL finished) {
            
        }];
    }
    
    [_originalImageViewController.view removeFromSuperview];
    _originalImageViewController.view = nil;
}

- (void)setShowTabBar:(BOOL)isShow
{
    _tabBarController.tabBar.hidden = !isShow;
}

@end
