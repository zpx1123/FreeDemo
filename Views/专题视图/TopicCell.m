//
//  TopicCell.m
//  爱限免
//
//  Created by qianfeng on 14-5-11.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "TopicCell.h"
#import "topicViewController.h"

@implementation TopicCell


#pragma mark - 属性

@dynamic appBigIconImageUrlString;

@dynamic appIconImageUrlString1;
@dynamic appIconImageUrlString2;
@dynamic appIconImageUrlString3;
@dynamic appIconImageUrlString4;

@dynamic appName1;
@dynamic appName2;
@dynamic appName3;
@dynamic appName4;

@dynamic appComment1;
@dynamic appComment2;
@dynamic appComment3;
@dynamic appComment4;

@dynamic appDownload1;
@dynamic appDownload2;
@dynamic appDownload3;
@dynamic appDownload4;

@synthesize  starRating1 = _starRating1;
@synthesize  starRating2 = _starRating2;
@synthesize  starRating3 = _starRating3;
@synthesize  starRating4 = _starRating4;

@dynamic appBottomIconImageUrlString;
@dynamic editorMessage;


-(void)setAppTitle:(NSString *)appTitle
{
    _appTitleLabel.text = appTitle;
}

-(NSString*) appTitle
{
    return _appTitleLabel.text;
}
- (void) setAppBigIconImageUrlString:(NSString *)appBigIconImageUrlString
{
    _appBigImageView.urlString = appBigIconImageUrlString;
}

-(NSString*) appBigIconImageUrlString
{
    return _appBigImageView.urlString;
}


- (void)setAppIconImageUrlString1:(NSString *)appIconImageUrlString1
{
    _appIconImageView1.urlString = appIconImageUrlString1;
}

- (NSString*) appIconImageUrlString1
{
    return _appIconImageView1.urlString;
}
- (void)setAppIconImageUrlString2:(NSString *)appIconImageUrlString2
{
    _appIconImageView2.urlString = appIconImageUrlString2;
}

- (NSString*) appIconImageUrlString2
{
    return _appIconImageView2.urlString;
}
- (void)setAppIconImageUrlString3:(NSString *)appIconImageUrlString3
{
    _appIconImageView3.urlString = appIconImageUrlString3;
}

- (NSString*) appIconImageUrlString3
{
    return _appIconImageView3.urlString;
}
- (void)setAppIconImageUrlString4:(NSString *)appIconImageUrlString4
{
    _appIconImageView4.urlString = appIconImageUrlString4;
}

- (NSString*) appIconImageUrlString4
{
    return _appIconImageView4.urlString;
}




-(void) setAppName1:(NSString *)appName1
{
    _appNameLabel1.text = appName1;
}

- (NSString* )appName1
{
    return _appNameLabel1.text;
}
-(void) setAppName2:(NSString *)appName2
{
    _appNameLabel2.text = appName2;
}

- (NSString* )appName2
{
    return _appNameLabel2.text;
}
-(void) setAppName3:(NSString *)appName3
{
    _appNameLabel3.text = appName3;
}

- (NSString* )appName3
{
    return _appNameLabel3.text;
}
-(void) setAppName4:(NSString *)appName4
{
    _appNameLabel4.text = appName4;
}

- (NSString* )appName4
{
    return _appNameLabel4.text;
}




-(void)setAppComment1:(NSString *)appComment1
{
    _appComment1.text = appComment1;
}

-(NSString*) appComment1
{
    return _appComment1.text ;
}
-(void)setAppComment2:(NSString *)appComment2
{
    _appComment2.text = appComment2;
}

-(NSString*) appComment2
{
    return _appComment2.text ;
}
-(void)setAppComment3:(NSString *)appComment3
{
    _appComment3.text = appComment3;
}

-(NSString*) appComment3
{
    return _appComment3.text ;
}
-(void)setAppComment4:(NSString *)appComment4
{
    _appComment4.text = appComment4;
}

-(NSString*) appComment4
{
    return _appComment4.text ;
}




-(void)setAppDownload1:(NSString *)appDownload1
{
    _appDownload1.text = appDownload1;
}

-(NSString*) appDownload1
{
    return _appDownload1.text;
}
-(void)setAppDownload2:(NSString *)appDownload2
{
    _appDownload2.text = appDownload2;
}

-(NSString*) appDownload2
{
    return _appDownload2.text;
}
-(void)setAppDownload3:(NSString *)appDownload3
{
    _appDownload3.text = appDownload3;
}

-(NSString*) appDownload3
{
    return _appDownload3.text;
}
-(void)setAppDownload4:(NSString *)appDownload4
{
    _appDownload4.text = appDownload4;
}

-(NSString*) appDownload4
{
    return _appDownload4.text;
}


- (void) setStarRating1:(float)starRating1
{
    _starRating1 = starRating1;
    //星星
    int i ;
    float t = starRating1;
    
    for (int i = 0; i<5; i++)
    {
        UIImageView *starImageView = [[UIImageView alloc]initWithFrame:CGRectMake(180 + i*15, 62, 15, 15)];
        starImageView.image = [UIImage imageNamed:@"1.主页_16.png"];
        [self.contentView addSubview:starImageView];
        [starImageView release];
    }
    
    if((t-(int)(t)) != 0)
    {
        
        for (i = 0 ; i < t; i++)
        {
            UIImageView *starImageView = [[UIImageView alloc]initWithFrame:CGRectMake(180 + i*15, 62, 15, 15)];
            starImageView.image = [UIImage imageNamed:@"1.主页_14.png"];
            [self.contentView addSubview:starImageView];
            [starImageView release];
        }
        
        i = i - 1 ;
        UIImageView *starImageView = [[UIImageView alloc]initWithFrame:CGRectMake(180 + i*15, 62, 15, 15)];
        starImageView.image = [UIImage imageNamed:@"5.专题_15.png"];
        [self.contentView addSubview:starImageView];
        [starImageView release];
    }
    else
    {
        for (i = 0 ; i < t; i++)
        {
            UIImageView *starImageView = [[UIImageView alloc]initWithFrame:CGRectMake(180 + i*15, 62, 15, 15)];
            starImageView.image = [UIImage imageNamed:@"1.主页_14.png"];
            [self.contentView addSubview:starImageView];
            [starImageView release];
        }
        
    }
    
}

- (void) setStarRating2:(float)starRating2
{
    _starRating2 = starRating2;
    //星星
    int i ;
    float t = starRating2;
    
    for (int i = 0; i<5; i++)
    {
        UIImageView *starImageView = [[UIImageView alloc]initWithFrame:CGRectMake(180 + i*15, 108, 15, 15)];
        starImageView.image = [UIImage imageNamed:@"1.主页_16.png"];
        [self.contentView addSubview:starImageView];
        [starImageView release];
    }
    
    
    if((t-(int)(t)) != 0)
    {
        
        for (i = 0 ; i < t; i++)
        {
            UIImageView *starImageView = [[UIImageView alloc]initWithFrame:CGRectMake(180 + i*15, 108, 15, 15)];
            starImageView.image = [UIImage imageNamed:@"1.主页_14.png"];
            [self.contentView addSubview:starImageView];
            [starImageView release];
        }
        
        i = i - 1 ;
        UIImageView *starImageView = [[UIImageView alloc]initWithFrame:CGRectMake(180 + i*15, 108, 15, 15)];
        starImageView.image = [UIImage imageNamed:@"5.专题_15.png"];
        [self.contentView addSubview:starImageView];
        [starImageView release];
    }
    else
    {
        for (i = 0 ; i < t; i++)
        {
            UIImageView *starImageView = [[UIImageView alloc]initWithFrame:CGRectMake(180 + i*15, 108, 15, 15)];
            starImageView.image = [UIImage imageNamed:@"1.主页_14.png"];
            [self.contentView addSubview:starImageView];
            [starImageView release];
        }
        
    }
}

- (void) setStarRating3:(float)starRating3
{
    _starRating3 = starRating3;
    //星星
    int i ;
    float t = starRating3;
    
    for (int i = 0; i<5; i++)
    {
        UIImageView *starImageView = [[UIImageView alloc]initWithFrame:CGRectMake(180 + i*15, 155, 15, 15)];
        starImageView.image = [UIImage imageNamed:@"1.主页_16.png"];
        [self.contentView addSubview:starImageView];
        [starImageView release];
    }
    
    
    if((t-(int)(t)) != 0)
    {
        
        for (i = 0 ; i < t; i++)
        {
            UIImageView *starImageView = [[UIImageView alloc]initWithFrame:CGRectMake(180 + i*15, 155, 15, 15)];
            starImageView.image = [UIImage imageNamed:@"1.主页_14.png"];
            [self.contentView addSubview:starImageView];
            [starImageView release];
        }
        
        i = i - 1 ;
        UIImageView *starImageView = [[UIImageView alloc]initWithFrame:CGRectMake(180 + i*15, 155, 15, 15)];
        starImageView.image = [UIImage imageNamed:@"5.专题_15.png"];
        [self.contentView addSubview:starImageView];
        [starImageView release];
    }
    else
    {
        for (i = 0 ; i < t; i++)
        {
            UIImageView *starImageView = [[UIImageView alloc]initWithFrame:CGRectMake(180 + i*15, 155, 15, 15)];
            starImageView.image = [UIImage imageNamed:@"1.主页_14.png"];
            [self.contentView addSubview:starImageView];
            [starImageView release];
        }
        
    }
}

- (void) setStarRating4:(float)starRating4
{
    _starRating4 = starRating4;
    //星星
    int i ;
    float t = starRating4;
    
    for (int i = 0; i<5; i++)
    {
        UIImageView *starImageView = [[UIImageView alloc]initWithFrame:CGRectMake(180 + i*15, 200, 15, 15)];
        starImageView.image = [UIImage imageNamed:@"1.主页_16.png"];
        [self.contentView addSubview:starImageView];
        [starImageView release];
    }
    
    
    if((t-(int)(t)) != 0)
    {
        
        for (i = 0 ; i < t; i++)
        {
            UIImageView *starImageView = [[UIImageView alloc]initWithFrame:CGRectMake(180 + i*15, 200, 15, 15)];
            starImageView.image = [UIImage imageNamed:@"1.主页_14.png"];
            [self.contentView addSubview:starImageView];
            [starImageView release];
        }
        
        i = i - 1 ;
        UIImageView *starImageView = [[UIImageView alloc]initWithFrame:CGRectMake(180 + i*15, 200, 15, 15)];
        starImageView.image = [UIImage imageNamed:@"5.专题_15.png"];
        [self.contentView addSubview:starImageView];
        [starImageView release];
    }
    else
    {
        for (i = 0 ; i < t; i++)
        {
            UIImageView *starImageView = [[UIImageView alloc]initWithFrame:CGRectMake(180 + i*15, 200, 15, 15)];
            starImageView.image = [UIImage imageNamed:@"1.主页_14.png"];
            [self.contentView addSubview:starImageView];
            [starImageView release];
        }
        
    }
}

- (void)setAppBottomIconImageUrlString:(NSString *)appBottomIconImageUrlString
{
    _appBottomIconImageView.urlString = appBottomIconImageUrlString;
}


-(NSString*)appBottomIconImageUrlString
{
    return _appBottomIconImageView.urlString ;
}

- (void)setEditorMessage:(NSString *)editorMessage
{
    _appEditorMessageLabel.text = editorMessage;
}

-(NSString*) editorMessage
{
    return _appEditorMessageLabel.text;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self uiConfig];
        
    }
    return self;
}


/**
 *  布局函数
 */

- (void)uiConfig
{
    
    //标题
    _appTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, 320, 30)];
    _appTitleLabel.font = [UIFont systemFontOfSize:19];
    [self.contentView addSubview:_appTitleLabel];
    
    //线
    _lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 35, 290, 2)];
    _lineImageView.image = [UIImage imageNamed:@"5.专题_03.png"];
    [self.contentView addSubview:_lineImageView];

    //左侧图标
    _appBigImageView = [[QFWebImageView alloc] initWithFrame:CGRectMake(15, 40, 120, 180)];
    [self.contentView addSubview:_appBigImageView];
    
    //右侧图片
    _appIconImageView1 = [[QFWebImageView alloc]initWithFrame:CGRectMake(140, 40 , 35, 35)];
    [self.contentView addSubview:_appIconImageView1];
    _appIconImageView2 = [[QFWebImageView alloc]initWithFrame:CGRectMake(140, 85 , 35, 35)];
    [self.contentView addSubview:_appIconImageView2];
    _appIconImageView3 = [[QFWebImageView alloc]initWithFrame:CGRectMake(140, 130 , 35, 35)];
    [self.contentView addSubview:_appIconImageView3];
    _appIconImageView4 = [[QFWebImageView alloc]initWithFrame:CGRectMake(140, 175 , 35, 35)];
    [self.contentView addSubview:_appIconImageView4];
    
    

    //名字
    _appNameLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(180,30, 140, 30)];
    _appNameLabel1.font = [UIFont systemFontOfSize:14];
    _appNameLabel1.textAlignment = NSTextAlignmentLeft;
    _appNameLabel1.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
    _appNameLabel1.lineBreakMode = NSLineBreakByTruncatingMiddle;
    [self.contentView addSubview:_appNameLabel1];
    
    _appNameLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(180,75, 140, 30)];
    _appNameLabel2.font = [UIFont systemFontOfSize:14];
    _appNameLabel2.textAlignment = NSTextAlignmentLeft;
    _appNameLabel2.lineBreakMode = NSLineBreakByTruncatingMiddle;
    _appNameLabel2.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
    [self.contentView addSubview:_appNameLabel2];
    
    _appNameLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(180,120, 140, 30)];
    _appNameLabel3.font = [UIFont systemFontOfSize:14];
    _appNameLabel3.lineBreakMode = NSLineBreakByTruncatingMiddle;
    _appNameLabel3.textAlignment = NSTextAlignmentLeft;
    _appNameLabel3.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
    [self.contentView addSubview:_appNameLabel3];
    
    _appNameLabel4 = [[UILabel alloc]initWithFrame:CGRectMake(180,165, 140, 30)];
    _appNameLabel4.font = [UIFont systemFontOfSize:14];
    _appNameLabel4.textAlignment = NSTextAlignmentLeft;
    _appNameLabel4.lineBreakMode = NSLineBreakByTruncatingMiddle;
    _appNameLabel4.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
    [self.contentView addSubview:_appNameLabel4];
    
    
    //评价
    for (int i = 0; i < 4; i++)
    {
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(180, 46*i+53, 15,10)];
        imageView.image = [UIImage imageNamed:@"11.png"];
        [self.contentView addSubview:imageView];
    }
    _appComment1 = [[UILabel alloc] initWithFrame:CGRectMake(199, 45, 30, 30)];
    _appComment1.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:_appNameLabel1];
    
    _appComment2 = [[UILabel alloc] initWithFrame:CGRectMake(199, 90, 30, 30)];
    _appComment2.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:_appComment2];
    
    _appComment3 = [[UILabel alloc] initWithFrame:CGRectMake(199, 135, 30, 30)];
    _appComment3.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:_appComment3];
    
    _appComment4 = [[UILabel alloc] initWithFrame:CGRectMake(199, 180, 30, 30)];
    _appComment4.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:_appComment4];
    
    
    
    // 下载
    for (int i = 0 ; i<4; i++)
    {
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(250, 46*i+53, 12,10)];
        imageView.image = [UIImage imageNamed:@"123.png"];
        [self.contentView addSubview:imageView];
    }
    _appDownload1 = [[UILabel alloc] initWithFrame:CGRectMake(270, 45, 30, 30)];
    _appDownload1.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:_appDownload1];
    
    _appDownload2 = [[UILabel alloc] initWithFrame:CGRectMake(270, 90, 30, 30)];
    _appDownload2.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:_appDownload2];
    
    _appDownload3 = [[UILabel alloc] initWithFrame:CGRectMake(270, 135, 30, 30)];
    _appDownload3.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:_appDownload3];
    
    _appDownload4 = [[UILabel alloc] initWithFrame:CGRectMake(270, 180, 30, 30)];
    _appDownload4.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:_appDownload4];
    
    
    //星星
    _appStarView1 = [[UIImageView alloc] initWithFrame:CGRectMake(80+100, 55, 167, 167)];
    [self.contentView addSubview:_appStarView1];

    _appStarView2 = [[UIImageView alloc] initWithFrame:CGRectMake(80+100, 100, 167, 167)];
    [self.contentView addSubview:_appStarView2];
    
    _appStarView3 = [[UIImageView alloc] initWithFrame:CGRectMake(80+100, 145, 167, 167)];
    [self.contentView addSubview:_appStarView3];

    _appStarView4 = [[UIImageView alloc] initWithFrame:CGRectMake(80+100, 190, 167, 167)];
    [self.contentView addSubview:_appStarView4];
  

    // 下面图标
    _appBottomIconImageView = [[QFWebImageView alloc] initWithFrame:CGRectMake(15, 240, 50, 50)];
    [self.contentView addSubview:_appBottomIconImageView];
    
    //小编寄语
    _appEditorMessageLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 226, 220, 80)];
    _appEditorMessageLabel.textAlignment = NSTextAlignmentLeft;
    _appEditorMessageLabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1];
    _appEditorMessageLabel.numberOfLines = 0;
    _appEditorMessageLabel.font = [UIFont systemFontOfSize:15];
    _appEditorMessageLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    [self.contentView addSubview:_appEditorMessageLabel];
    
    for (int  i = 0 ; i < 4; i++)
    {
        _smallLineImageView = [[UIImageView alloc]
                               initWithFrame:CGRectMake(140, 80+46*i, 167, 1)];
        _smallLineImageView.image = [UIImage imageNamed:@"5.专题_07.png"];
        [self.contentView addSubview:_smallLineImageView];
    }
    
    
    //按钮
    UIButton* smallImage1Button = [[UIButton alloc] initWithFrame:CGRectMake(140, 37, 200, 40)];
    [smallImage1Button addTarget:self action:@selector(smallImage1Button:) forControlEvents:UIControlEventTouchUpInside];
    smallImage1Button.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:smallImage1Button];
    
    UIButton* smallImage2Button = [[UIButton alloc] initWithFrame:CGRectMake(140, 85, 200, 40)];
    [smallImage2Button addTarget:self action:@selector(smallImage2Button:) forControlEvents:UIControlEventTouchUpInside];
    smallImage2Button.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:smallImage2Button];
    
    UIButton* smallImage3Button = [[UIButton alloc] initWithFrame:CGRectMake(140, 130, 200, 40)];
    [smallImage3Button addTarget:self action:@selector(smallImage3Button:) forControlEvents:UIControlEventTouchUpInside];
    smallImage3Button.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:smallImage3Button];
    
    UIButton* smallImage4Button = [[UIButton alloc] initWithFrame:CGRectMake(140, 175, 200, 40)];
    [smallImage4Button addTarget:self action:@selector(smallImage4Button:) forControlEvents:UIControlEventTouchUpInside];
    smallImage4Button.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:smallImage4Button];
    
}


#pragma mark - 触发点击事件

-(void)smallImage1Button:(id)sender
{
    [[topicViewController shareTopicViewController] showAppDetailViewWithAppID:_currentModel.appId1 animated:YES];
}
-(void)smallImage2Button:(id)sender
{
    [[topicViewController shareTopicViewController] showAppDetailViewWithAppID:_currentModel.appId2 animated:YES];
}
-(void)smallImage3Button:(id)sender
{
    [[topicViewController shareTopicViewController] showAppDetailViewWithAppID:_currentModel.appId3 animated:YES];
}
-(void)smallImage4Button:(id)sender
{
   [[topicViewController shareTopicViewController] showAppDetailViewWithAppID:_currentModel.appId4 animated:YES];
}




/**
 *  析构函数
 */
- (void)dealloc
{
    [_smallLineImageView release];
    _smallLineImageView= nil;
    
    [_appBigImageView release];
    _appBigImageView = nil;
    
    [_appIconImageView1 release];
    _appIconImageView1 = nil;
    [_appIconImageView2 release];
    _appIconImageView2 = nil;
    [_appIconImageView3 release];
    _appIconImageView3 = nil;
    [_appIconImageView4 release];
    _appIconImageView4 = nil;
    
    [_appNameLabel1 release];
    _appNameLabel1 = nil;
    [_appNameLabel2 release];
    _appNameLabel2 = nil;
    [_appNameLabel3 release];
    _appNameLabel3 = nil;
    [_appNameLabel4 release];
    _appNameLabel4 = nil;
    
    [_appComment1 release];
    _appComment1 = nil;
    [_appComment2 release];
    _appComment2 = nil;
    [_appComment3 release];
    _appComment3 = nil;
    [_appComment4 release];
    _appComment4 = nil;
    
    [_appStarView1 release];
    _appStarView1 = nil;
    [_appStarView2 release];
    _appStarView2 = nil;
    [_appStarView3 release];
    _appStarView3 = nil;
    [_appStarView4 release];
    _appStarView4 = nil;
    
    [_appDownload1 release];
    _appDownload1 = nil;
    [_appDownload2 release];
    _appDownload2 = nil;
    [_appDownload3 release];
    _appDownload3 = nil;
    [_appDownload4 release];
    _appDownload4 = nil;
    
    [_appTitleLabel release];
    _appTitleLabel = nil;
    
    [_appBottomIconImageView release];
    _appBottomIconImageView = nil;
    
    [_appEditorMessageLabel release];
    _appEditorMessageLabel = nil;
    
    [_lineImageView release];
    _lineImageView = nil;
    
    [super dealloc];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}


@end
