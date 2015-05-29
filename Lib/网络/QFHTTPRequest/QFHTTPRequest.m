//
//  QFHTTPRequest.m
//  AiXianMian
//
//  Created by PK on 14-3-4.
//  Copyright (c) 2014年 PK. All rights reserved.
//

#import "QFHTTPRequest.h"

@implementation QFHTTPRequest

- (id)init
{
    if (self = [super init])
    {
        _mData = [[NSMutableData alloc] init];
    }
    return self;
}

- (void)startRequest
{
    //判断需不需要缓存
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30.0];
    
    //发起异步请求 立刻返回
    [NSURLConnection connectionWithRequest:request delegate:self];

    [self retain];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_mData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    self.finishBlock(_mData);
    [self release];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    self.failedBlock(error);
    [self release];
}

- (void)dealloc
{
    [_mData release];
    self.url = nil;
    [super dealloc];
}


@end
