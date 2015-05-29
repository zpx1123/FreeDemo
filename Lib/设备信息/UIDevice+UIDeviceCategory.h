//
//  UIDevice+UIDeviceCategory.h
//  VeryPhoto
//
//  Created by chen cheng on 12-12-14.
//  Copyright (c) 2012年 chen cheng. All rights reserved.
//

#define DEVICE_MODELID_EOOR          0x00
#define DEVICE_MODELID_IPHONE_480h   0x01
#define DEVICE_MODELID_IPHONE_568h   0x02
#define DEVICE_MODELID_IPAD          0x03

#define SCREEN_NORMAL                0x01
#define SCREEN_RETINA                0x02

#import <UIKit/UIKit.h>

@interface UIDevice (UIDeviceCategory)

+ (int)modelId;

+ (CGFloat)width;
+ (CGFloat)height;

+ (int)screenType;

+ (int)systemVersionFirstNumber;

+ (BOOL)supportsAirdrop;

@end
