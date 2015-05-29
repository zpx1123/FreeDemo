//
//  QFHTTPManager.m
//  AiXianMian
//
//  Created by PK on 14-3-4.
//  Copyright (c) 2014年 PK. All rights reserved.
//

#import "QFHTTPManager.h"

@implementation QFHTTPManager

+ (void)requestWithUrl:(NSString *)url Finish:(FinishBlock)finish Failed:(FailedBlock)failed
{
    QFHTTPRequest* request = [[[QFHTTPRequest alloc] init] autorelease];
    request.url = url;
    request.failedBlock = failed;
    request.finishBlock = finish;
    [request startRequest];
}





@end
