//
//  QFHTTPManager.h
//  AiXianMian
//
//  Created by PK on 14-3-4.
//  Copyright (c) 2014年 PK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QFHTTPRequest.h"

@interface QFHTTPManager : NSObject

/**
 *  该函数实现了HTTP的异步请求功能
 *
 *  @param url    链接地址
 *  @param finish 异步下载完成并成功后要回调的代码块
 *  @param failed 异步下载失败后要回调的代码块
 */
+ (void)requestWithUrl:(NSString*)url Finish:(FinishBlock)finish Failed:(FailedBlock)failed;


@end
