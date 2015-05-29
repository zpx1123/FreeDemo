//
//  QFActivityIndicatorView.m
//  常用控件
//
//  Created by chen cheng on 14-4-28.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "QFActivityIndicatorView.h"

@implementation QFActivityIndicatorView

@synthesize delegate = _delegate;

- (void)dealloc
{
    [_textLabel release];
    _textLabel = nil;
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.5;
        self.layer.cornerRadius = 10;
        
        _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 80, self.frame.size.width, 40)];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.textColor = [UIColor whiteColor];
        _textLabel.text = @"收藏成功";
        
        [self addSubview:_textLabel];
        
    }
    return self;
}

- (void)layoutSubviews
{
    _textLabel.frame = CGRectMake(0, self.frame.size.height - 80, self.frame.size.width, 40);
}


- (void)cancelButtonClick:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(qfActivityIndicatorViewDidCancel:)])
    {
        [self.delegate qfActivityIndicatorViewDidCancel:self];
    }
}

- (void)setText:(NSString *)text
{
    _textLabel.text = text;
}

- (NSString *)text
{
    return [[_textLabel.text copy] autorelease];
}

@end













