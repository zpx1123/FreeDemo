//
//  OriginalImageViewController.m
//  爱限免
//
//  Created by qianfeng on 14-5-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "OriginalImageViewController.h"
#import "MainViewController.h"
#import "limitsExemptsViewController.h"


static OriginalImageViewController * g_originalImageViewController = nil;

@interface OriginalImageViewController ()

@end

@implementation OriginalImageViewController

+(OriginalImageViewController*) shareOriginalImageViewController
{
    return g_originalImageViewController;
}
- (void)dealloc
{
    [_titleLabel release];
    _titleLabel = nil;
    
    [_scrollView release];
    _scrollView = nil;
    
    [super dealloc];
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        g_originalImageViewController = self;
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        _titleLabel.text = @"1/5";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:17];
        _titleLabel.textColor = [UIColor whiteColor];
        self.navigationItem.titleView = _titleLabel;
        
        [self.navigationItem setHidesBackButton:YES];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonClick:)];
    }
    return self;
}

- (void)viewDidLoad
{
    [super loadView];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    [tapGestureRecognizer release];
    
    
    self.view.backgroundColor = [UIColor blackColor];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(-5, 0, self.view.frame.size.width+10, self.view.frame.size.height)];
    
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeMake(_scrollView.bounds.size.width * 5, _scrollView.bounds.size.height);
    
    
    _navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
    _navigationBar.alpha = 0.8;
    [_navigationBar setBackgroundImage:[UIImage imageNamed:@"顶部条背景2.png"] forBarMetrics:UIBarMetricsDefault];
    _navigationBar.tintColor = [UIColor whiteColor];
    [_navigationBar pushNavigationItem:self.navigationItem animated:YES];
    [self.view addSubview:_navigationBar];

}


- (void)doneButtonClick:(id)sender
{
    [[MainViewController shareMainViewController] dismissOriginalImageViewAnimated:YES];
}

- (void)tap:(UITapGestureRecognizer *)tapGestureRecognizer
{
    _fullScreen = !_fullScreen;
    
    if (_fullScreen)
    {
        _navigationBar.hidden = YES;
    }
    else
    {
        _navigationBar.hidden = NO;
    }
    
    [[MainViewController shareMainViewController] setNeedsStatusBarAppearanceUpdate];
}

- (BOOL)prefersStatusBarHidden
{
    return _fullScreen;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/**
 *   缩图的每次点击查看大图
 *
 *  @param tapGestureRecognizer 添加一个UITapGestureRecognizer手势
 */
- (void)screenshotImageViewTap:(UITapGestureRecognizer *)tapGestureRecognizer
{
    for (int i=0; i<5; i++)
    {
        _webImageView[i] = [[QFWebImageView alloc] initWithFrame:CGRectMake(i*(self.view.bounds.size.width+10)+5, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        NSLog(@"[[[[DetailModel shareDetailModel] screenshotImageUrlDictionaryArray] = %@",[[[[DetailModel shareDetailModel] screenshotImageUrlDictionaryArray] objectAtIndex:i] valueForKey:@"originalUrl"]);
        _webImageView[i].urlString = [[[[DetailModel shareDetailModel] screenshotImageUrlDictionaryArray] objectAtIndex:i] valueForKey:@"originalUrl"];
        NSLog(@"_webImageView[i] = %@",_webImageView[i]);
        [_scrollView addSubview:_webImageView[i]];
    }
    [self.view addSubview:_scrollView];
}

@end
