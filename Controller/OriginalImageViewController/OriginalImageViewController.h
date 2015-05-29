//
//  OriginalImageViewController.h
//  爱限免
//
//  Created by qianfeng on 14-5-22.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFWebImageView.h"

@interface OriginalImageViewController : UIViewController
{
    UINavigationBar *_navigationBar;
    UILabel         *_titleLabel;
    UIScrollView    *_scrollView;
    
    QFWebImageView  *_webImageView[5];
    
    NSArray         *_imageUrlStringArray;
    
    BOOL             _fullScreen;
}

+(OriginalImageViewController*) shareOriginalImageViewController;

@property(retain, readwrite, nonatomic)NSArray *imageUrlStringArray;

- (void)screenshotImageViewTap:(UITapGestureRecognizer *)tapGestureRecognizer;

@end
