//
//  UIDevice+UIDeviceCategory.m
//  VeryPhoto
//
//  Created by chen cheng on 12-12-14.
//  Copyright (c) 2012年 chen cheng. All rights reserved.
//


#import <sys/types.h>
#import <sys/sysctl.h>

#import "UIDevice+UIDeviceCategory.h"

@implementation UIDevice (UIDeviceCategory)

static float mainScreenWidth = 0;
static float mainScreenHeight = 0;
static int systemVersionFirstNumber = -1;

+ (int)modelId
{
    CGFloat  deviceWidth = [UIDevice width];
    if (deviceWidth == 768)
    {
        return DEVICE_MODELID_IPAD;
    }
    else if (deviceWidth == 320)
    {
        CGFloat deviceHeight = [UIDevice height];
        if (deviceHeight == 480)
        {
            return DEVICE_MODELID_IPHONE_480h;
        }
        else if (deviceHeight == 568)
        {
            return DEVICE_MODELID_IPHONE_568h;
        }
    }
    
    return DEVICE_MODELID_EOOR;
}

+ (CGFloat)width
{
    if (mainScreenWidth == 0)
    {
        mainScreenWidth = [UIScreen mainScreen].bounds.size.width;
    }
    return mainScreenWidth;
}

+ (CGFloat)height
{
    if (mainScreenHeight == 0)
    {
        mainScreenHeight = [UIScreen mainScreen].bounds.size.height;
    }

    return mainScreenHeight;
}

+ (int)screenType
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)]
        && ([UIScreen mainScreen].scale == 2.0))
    {
        return SCREEN_RETINA;
    }
    else
    {
        return SCREEN_NORMAL;
    }
}

+ (int)systemVersionFirstNumber
{
    if (systemVersionFirstNumber == -1)
    {
        NSString *systemVersionString = [[UIDevice currentDevice] systemVersion];
        systemVersionFirstNumber = [systemVersionString UTF8String][0] - '0';
    }
    
    return systemVersionFirstNumber;
}




+ (NSString *)machineName
{
    size_t size;
    if (sysctlbyname("hw.machine", NULL, &size, NULL, 0) < 0) {
        return nil;
    }
    char *name = malloc(size);
    if (sysctlbyname("hw.machine", name, &size, NULL, 0) < 0) {
        free(name);
        return nil;
    }
    
    NSString *machine = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
    free(name);
    return machine;
}

+ (BOOL)machineComponentsWithName:(NSString **)theName major:(NSString **)theMajor minor:(NSString **)theMinor
{
    NSString *machineName = [self machineName];
    if ([machineName length]) {
        int ii = 0;
        for (; ii < [machineName length]; ii++) {
            unichar c = [machineName characterAtIndex:ii];
            if (c >= '0' && c <= '9') {
                // End of name, begin of major
                if (theName) {
                    *theName = [machineName substringToIndex:ii];
                    break;
                }
            }
        }
        int jj = ii;
        for (; jj < [machineName length]; jj++) {
            if ([machineName characterAtIndex:jj] == ',') {
                if (theMajor) {
                    *theMajor = [machineName substringWithRange:NSMakeRange(ii, jj - ii)];
                }
                if (theMinor) {
                    *theMinor = [machineName substringFromIndex:jj + 1];
                }
                return YES;
            }
        }
    }
    return NO;
}

+ (BOOL)supportsAirdrop
{
    if ([UIDevice systemVersionFirstNumber] >= 7)
    {
        NSString *theName = nil;
        NSString *theMajor = nil;
        NSString *theMinor = nil;
        if ([self machineComponentsWithName:&theName major:&theMajor minor:&theMinor])
        {
            if ([theName isEqualToString:@"iPhone"] || [theName isEqualToString:@"iPod"])
            {
                return [theMajor intValue] >= 5;
            }
            if ([theName isEqualToString:@"iPad"])
            {
                return ([theMajor intValue] == 2 && [theMinor intValue] >= 5) // iPad mini
                ||
                ([theMajor intValue] == 3 && [theMinor intValue] >= 4)// iPad 4
                ||
                [theMajor intValue] >= 4; // Suppose all future models will support AirDrop
            }
        }
    }
    return NO;
}



@end
