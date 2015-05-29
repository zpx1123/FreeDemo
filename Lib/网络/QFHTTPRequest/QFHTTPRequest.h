//
//  QFHTTPRequest.h
//  AiXianMian
//
//  Created by PK on 14-3-4.
//  Copyright (c) 2014年 PK. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^FinishBlock)(NSData* data);
typedef void (^FailedBlock)(NSError *error);

@interface QFHTTPRequest : NSObject<NSURLConnectionDataDelegate>
{
    NSMutableData* _mData;
}

@property (nonatomic,copy) NSString* url;
@property (nonatomic,copy) FinishBlock finishBlock;
@property (nonatomic,copy) FailedBlock failedBlock;

- (void)startRequest;

@end
