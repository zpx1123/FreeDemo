//
//  ReductionCell.h
//  爱限免
//
//  Created by qianfeng on 14-5-15.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFWebImageView.h"

@interface ReductionCell : UITableViewCell
{
    
    QFWebImageView  *_appImageView;     //app 图标
    UILabel         *_appNameLabel;     //名字
    UILabel         *_appDataLabel;     //剩余事件
    UILabel         *_appPriceLabel;    //价格
    UIImageView     *_appStarView;      //星星
    UILabel         *_appTypeLabel;     //类型
    UILabel         *_appShareLabel;    //分享
    UILabel         *_appCollectLabel;  //收藏
    UILabel         *_appDownloadLabel; //下载次数
    UIImageView     *_priceDash;        //价格上面的横线
    UIImageView     *_imageArrow;       //箭头图标
    
}

@property(copy, nonatomic, readwrite)NSString *appIconImageUrlString;   //app图标URL
@property(copy, nonatomic, readwrite)NSString *appName;                 //app名字
@property(copy, nonatomic, readwrite)NSString *expireDatetime;          //截止时间
@property(copy, nonatomic, readwrite)NSString *appPrice;                //app价格
@property(copy, nonatomic, readwrite)NSString *appType;                 //app类型
@property(assign, nonatomic, readwrite)float  starRating;               //星星个数
@property(copy, nonatomic, readwrite)NSString *appShareTimes;           //app分享
@property(copy, nonatomic, readwrite)NSString *appCollectTimes;         //app收藏
@property(copy, nonatomic, readwrite)NSString *appDownloadTimes;        //app下载


/**
 *  布局函数
 */

- (void)uiConfig;


@end
