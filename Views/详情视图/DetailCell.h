//
//  DetailCell.h
//  爱限免
//
//  Created by qianfeng on 14-5-13.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFWebImageView.h"
#import "DetailModel.h"

@interface DetailCell : UITableViewCell
{
    UIImageView     *_appBigBgView;       //大的背景图片
    UIImageView     *_appSmallBgView;     //小的背景图片
    
    QFWebImageView  *_appImageView;       //app 图标
    UILabel         *_appNameLabel;       //名字
    UILabel         *_appPriceLabel;      //原价
    UILabel         *_appLimitLabel;
    UILabel         *_appSizeLabel;       //app大小
    UILabel         *_appTypeLabel;        //app类型
    UILabel         *_appMarkLabel;         //app评分
    UIImageView     *_appShareView;       //分享图片
    
    UIImageView     *_appCollectView;     //收藏图片
    UIImageView     *_appDownloadView;    //分享图片
    UILabel         *_appInfoLabel;       //游戏简介
    
    UIScrollView       *_scrollView; //游戏图片阅览
    QFWebImageView     *_ShrinksImageView1;
    QFWebImageView     *_ShrinksImageView2;
    QFWebImageView     *_ShrinksImageView3;
    QFWebImageView     *_ShrinksImageView4;
    QFWebImageView     *_ShrinksImageView5;
    
    UIButton           *_button;
    
    QFWebImageView     *_nearbyApp1ImageView;
    QFWebImageView     *_nearbyApp2ImageView;
    QFWebImageView     *_nearbyApp3ImageView;
    QFWebImageView     *_nearbyApp4ImageView;
    QFWebImageView     *_nearbyApp5ImageView;
    
    UILabel            *_nearbyApp1Label;
    UILabel            *_nearbyApp2Label;
    UILabel            *_nearbyApp3Label;
    UILabel            *_nearbyApp4Label;
    UILabel            *_nearbyApp5Label;
    
    QFWebImageView         *_screenshotImageView[5];//五张截屏缩略图

}


@property(copy, nonatomic,readwrite) NSString     *appId;                   //app编号
@property (nonatomic,copy,readwrite) NSString     *appIconImageUrlString;   //app图标的URL
@property (nonatomic,copy,readwrite) NSString     *appName;                 //app的名字
@property (nonatomic,copy,readwrite) NSString     *appPrice;                //app原价
@property (nonatomic ,copy,readwrite)NSString     *appSize;                 //app大小
@property (nonatomic,copy,readwrite) NSString     *appType;                 //app类型
@property (nonatomic ,copy,readwrite) NSString    *appDetail;                 //app介绍
@property (nonatomic ,copy,readwrite) NSString    *appTreand;                 //app限免？
@property (nonatomic ,copy,readwrite) NSString    *appMark;
@property (nonatomic ,copy,readwrite) NSString    *appInfo;

@property (nonatomic ,copy,readwrite) NSString    *shrinksImageUrlString1;
@property (nonatomic ,copy,readwrite) NSString    *shrinksImageUrlString2;
@property (nonatomic ,copy,readwrite) NSString    *shrinksImageUrlString3;
@property (nonatomic ,copy,readwrite) NSString    *shrinksImageUrlString4;
@property (nonatomic ,copy,readwrite) NSString    *shrinksImageUrlString5;

@property (nonatomic ,copy,readwrite) NSString    *nearbyApp1;
@property (nonatomic ,copy,readwrite) NSString    *nearbyApp2;
@property (nonatomic ,copy,readwrite) NSString    *nearbyApp3;
@property (nonatomic ,copy,readwrite) NSString    *nearbyApp4;
@property (nonatomic ,copy,readwrite) NSString    *nearbyApp5;

@property (nonatomic ,copy,readwrite) NSString    *nearbyApp1Label;
@property (nonatomic ,copy,readwrite) NSString    *nearbyApp2Label;
@property (nonatomic ,copy,readwrite) NSString    *nearbyApp3Label;
@property (nonatomic ,copy,readwrite) NSString    *nearbyApp4Label;
@property (nonatomic ,copy,readwrite) NSString    *nearbyApp5Label;

@property (nonatomic ,copy,readwrite) NSString    *nearbyAppId1; //下方附近应用app
@property (nonatomic ,copy,readwrite) NSString    *nearbyAppId2;
@property (nonatomic ,copy,readwrite) NSString    *nearbyAppId3;
@property (nonatomic ,copy,readwrite) NSString    *nearbyAppId4;
@property (nonatomic ,copy,readwrite) NSString    *nearbyAppId5;

/**
 *  布局函数
 */
- (void)uiConfig;

@end
