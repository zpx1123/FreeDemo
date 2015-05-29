//
//  TopicModel.h
//  爱限免
//
//  Created by qianfeng on 14-5-11.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QFTableView.h"

@interface TopicModel : NSObject<QFTableViewDataSource>
{
    NSMutableArray  *_appTopMutableArray;
    UIButton        *_button; //每个app做一个无背景的button
    
    UITableView     *_tabelView;
    
    
}


@property (nonatomic, copy,readwrite) NSString     *appTitle; //app标题

@property (nonatomic,retain,readwrite) NSString   *appIconImageUrlString1;   //app1图标的URL
@property (nonatomic,retain,readwrite) NSString   *appIconImageUrlString2;   //app2图标的URL
@property (nonatomic,retain,readwrite) NSString   *appIconImageUrlString3;   //app3图标的URL
@property (nonatomic,retain,readwrite) NSString   *appIconImageUrlString4;   //app4图标的URL

@property (nonatomic,retain,readwrite) NSString   *appName1;                 //app1的名字
@property (nonatomic,retain,readwrite) NSString   *appName2;                 //app2的名字
@property (nonatomic,retain,readwrite) NSString   *appName3;                 //app3的名字
@property (nonatomic,retain,readwrite) NSString   *appName4;                 //app4的名字

@property (nonatomic,copy,readwrite) NSString     *appComment1;     //app评论1
@property (nonatomic,copy,readwrite) NSString     *appComment2;     //app评论2
@property (nonatomic,copy,readwrite) NSString     *appComment3;     //app评论3
@property (nonatomic,copy,readwrite) NSString     *appComment4;     //app评论4

@property (nonatomic, copy,readwrite) NSString     *appDownload1;                 //app下载1
@property (nonatomic, copy,readwrite) NSString     *appDownload2;                 //app下载2
@property (nonatomic, copy,readwrite) NSString     *appDownload3;                 //app下载3
@property (nonatomic, copy,readwrite) NSString     *appDownload4;                 //app下载4


@property (nonatomic, copy,readwrite) NSString     *appBigIconImageUrlString;  //app 大图标
@property (nonatomic, copy,readwrite) NSString     *appBottomIconImageUrlString; //app下面的图标
@property (nonatomic, copy,readwrite) NSString     *editorMessage; //小编寄语

@property(assign, nonatomic,readwrite) float      starRating1;             //app 星星的个数
@property(assign, nonatomic,readwrite) float      starRating2;             //app 星星的个数
@property(assign, nonatomic,readwrite) float      starRating3;             //app 星星的个数
@property(assign, nonatomic,readwrite) float      starRating4;             //app 星星的个数

@property(copy, nonatomic,readwrite) NSString    *appId1;
@property(copy, nonatomic,readwrite) NSString    *appId2;
@property(copy, nonatomic,readwrite) NSString    *appId3;
@property(copy, nonatomic,readwrite) NSString    *appId4;


@end
