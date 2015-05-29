//
//  QFActivityIndicatorView.h
//  常用控件
//
//  Created by chen cheng on 14-4-28.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QFActivityIndicatorView;

@protocol QFActivityIndicatorViewDelegate <NSObject>


- (void)qfActivityIndicatorViewDidCancel:(QFActivityIndicatorView *)qfActivityIndicatorView;

@end

@interface QFActivityIndicatorView : UIView
{
    UILabel                     *_textLabel;
    id                          _delegate;
}

@property(assign, nonatomic)id<QFActivityIndicatorViewDelegate>delegate;
@property(copy, nonatomic)NSString *text;

@end


