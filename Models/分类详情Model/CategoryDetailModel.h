//
//  CategoryDetailModel.h
//  爱限免
//
//  Created by qianfeng on 14-5-21.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QFTableView.h"

/**
 *  程序模型
 */
@interface CategoryDetailModel : NSObject<QFTableViewDataSource>
{
    NSMutableArray  *_appIntroductionMutableArray;
}

@property (copy ,nonatomic,readwrite) NSString    *categoryID;
@property(copy, nonatomic,readwrite) NSString     *appId;                   //app编号
@property (nonatomic,retain,readwrite) NSString   *appIconImageUrlString;   //app图标的URL
@property (nonatomic,retain,readwrite) NSString   *appName;                 //app的名字
@property (nonatomic,copy,readwrite) NSString     *expireDatetime;          //截止日期
@property (nonatomic,copy,readwrite) NSString     *appPrice;                //app价格
@property(assign, nonatomic,readwrite) float      starRating;               //app 星星的个数
@property (nonatomic,copy,readwrite) NSString     *appType;                 //app类型
@property (nonatomic,copy,readwrite) NSString     *appShareTimes;           //app分享的次数
@property (nonatomic,copy,readwrite) NSString     *appCollectTimes;         //app收藏的次数
@property (nonatomic,copy,readwrite) NSString     *appDownloadTimes;        //app下载的次数

- (NSString *)getAppIDWithIndex:(int)index;

@end
