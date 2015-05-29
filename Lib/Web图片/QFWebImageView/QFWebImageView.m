//
//  QFWebImageView.m
//  异步下载图片
//
//  Created by chen cheng on 14-5-6.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFWebImageView.h"
#import "QFHTTPManager.h"

@implementation QFWebImageView

@synthesize urlString = _urlString;

- (void)setUrlString:(NSString *)urlString
{
    if (urlString == _urlString
        ||
        [urlString isEqualToString:_urlString])
    {
        return;
    }
    
    [urlString retain];
    [_urlString release];
    _urlString = [urlString copy];
    [urlString release];
    
    
    UIActivityIndicatorView *_activityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:self.bounds];
    _activityIndicatorView.backgroundColor = [UIColor grayColor];
    _activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    
    [self addSubview:_activityIndicatorView];
    
    [_activityIndicatorView startAnimating];
    
    [QFHTTPManager requestWithUrl:_urlString Finish:^(NSData *data) {
        
        [_activityIndicatorView removeFromSuperview];
        [_activityIndicatorView release];
        
        self.image = [UIImage imageWithData:data];
        
    } Failed:^(NSError *error) {
        
        [_activityIndicatorView removeFromSuperview];
        [_activityIndicatorView release];
    }];
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([_target respondsToSelector:_action])
    {
        [_target performSelector:_action withObject:self];
    }
}

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    if (UIControlEventTouchUpInside & controlEvents)
    {
        _target = target;
        _action = action;
    }
}

@end
