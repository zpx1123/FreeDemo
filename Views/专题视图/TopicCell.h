//
//  TopicCell.h
//  爱限免
//
//  Created by qianfeng on 14-5-11.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFWebImageView.h"
#import "TopicModel.h"

@interface TopicCell : UITableViewCell
{
    UILabel         *_appTitleLabel;    //app标题
    UIImageView     *_lineImageView;        //线
    QFWebImageView  *_appBigImageView;     //app大图标
    
    QFWebImageView  *_appIconImageView1;   //app右侧小图标URL
    QFWebImageView  *_appIconImageView2;   //app右侧小图标URL
    QFWebImageView  *_appIconImageView3;   //app右侧小图标URL
    QFWebImageView  *_appIconImageView4;   //app右侧小图标URL
    
    UILabel         *_appNameLabel1;     //名字
    UILabel         *_appNameLabel2;     //名字
    UILabel         *_appNameLabel3;     //名字
    UILabel         *_appNameLabel4;     //名字
    
    UILabel         *_appComment1;     //评论
    UILabel         *_appComment2;     //评论
    UILabel         *_appComment3;     //评论
    UILabel         *_appComment4;     //评论
    
    UILabel         *_appDownload1;    //下载
    UILabel         *_appDownload2;    //下载
    UILabel         *_appDownload3;    //下载
    UILabel         *_appDownload4;    //下载
    
    UIImageView     *_appStarView1;      //星星
    UIImageView     *_appStarView2;      //星星
    UIImageView     *_appStarView3;      //星星
    UIImageView     *_appStarView4;      //星星
    
    QFWebImageView  *_appBottomIconImageView;        //app下面的图标
    UILabel         *_appEditorMessageLabel;       //小编寄语
    
    UIImageView     *_smallLineImageView; //每个app下方的线
    
    
}

@property(copy, nonatomic, readwrite)NSString *appTitle;                //app标题
@property(copy, nonatomic, readwrite)NSString *appBigIconImageUrlString;   //app左侧大图标url

@property(copy, nonatomic, readwrite)NSString *appIconImageUrlString1;   //app右侧小图标URL
@property(copy, nonatomic, readwrite)NSString *appIconImageUrlString2;   //app右侧小图标URL
@property(copy, nonatomic, readwrite)NSString *appIconImageUrlString3;   //app右侧小图标URL
@property(copy, nonatomic, readwrite)NSString *appIconImageUrlString4;   //app右侧小图标URL

@property(copy, nonatomic, readwrite)NSString *appName1;                 //app名字
@property(copy, nonatomic, readwrite)NSString *appName2;                 //app名字
@property(copy, nonatomic, readwrite)NSString *appName3;                 //app名字
@property(copy, nonatomic, readwrite)NSString *appName4;                 //app名字

@property(copy, nonatomic, readwrite)NSString *appComment1;                  //app评论
@property(copy, nonatomic, readwrite)NSString *appComment2;                  //app评论
@property(copy, nonatomic, readwrite)NSString *appComment3;                  //app评论
@property(copy, nonatomic, readwrite)NSString *appComment4;                  //app评论

@property(copy, nonatomic, readwrite)NSString *appDownload1;                 //app下载
@property(copy, nonatomic, readwrite)NSString *appDownload2;                 //app下载
@property(copy, nonatomic, readwrite)NSString *appDownload3;                 //app下载
@property(copy, nonatomic, readwrite)NSString *appDownload4;                 //app下载

@property(assign, nonatomic, readwrite)float  starRating1;               //星星个数
@property(assign, nonatomic, readwrite)float  starRating2;               //星星个数
@property(assign, nonatomic, readwrite)float  starRating3;               //星星个数
@property(assign, nonatomic, readwrite)float  starRating4;               //星星个数

@property(copy, nonatomic, readwrite)NSString *appBottomIconImageUrlString; //app下面的图标
@property(copy, nonatomic, readwrite)NSString *editorMessage; //小编寄语

@property (nonatomic,retain) TopicModel *currentModel;

@end
