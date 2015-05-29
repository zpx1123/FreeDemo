//
//  setModel.m
//  爱限免
//
//  Created by qianfeng on 14-5-9.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "setModel.h"

@implementation setModel

- (void)dealloc
{
    [_image release];
    _image = nil;
    
    [_title release];
    _title = nil;
    
    [super dealloc];
    
}

@end
