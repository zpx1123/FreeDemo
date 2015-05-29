//
//  QFWebImageView.h
//  异步下载图片
//
//  Created by chen cheng on 14-5-6.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QFWebImageView : UIImageView
{
    NSString   *_urlString;
    SEL        _action;
    id         _target;
}

@property(copy, nonatomic)NSString *urlString;

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;


@end
