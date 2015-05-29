//
//  DetailCell.m
//  爱限免
//
//  Created by qianfeng on 14-5-13.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "DetailCell.h"
#import "DetailViewController.h"
#import "MainViewController.h"

@implementation DetailCell

@dynamic appId;
@dynamic appIconImageUrlString;
@dynamic appName;
@dynamic appPrice;
@dynamic appSize;
@dynamic appType;
@dynamic appDetail;
@dynamic appTreand;
@dynamic appMark;
@dynamic shrinksImageUrlString1;
@dynamic shrinksImageUrlString2;
@dynamic shrinksImageUrlString3;
@dynamic shrinksImageUrlString4;
@dynamic shrinksImageUrlString5;
@dynamic nearbyApp1;
@dynamic nearbyApp2;
@dynamic nearbyApp3;
@dynamic nearbyApp4;
@dynamic nearbyApp5;

//-(void) setCurrModel:(DetailModel *)currModel
//{
//    [currModel retain];
//    [_detailModel release];
//    _detailModel = [currModel copy];
//    [currModel release];
//}
- (void) setAppIconImageUrlString:(NSString *)appIconImageUrlString
{
    _appImageView.urlString = appIconImageUrlString;
}
-(NSString*)appIconImageUrlString
{
    return _appImageView.urlString;
}

-(void)setAppName:(NSString *)appName
{
    _appNameLabel.text = appName;
}
-(NSString*)appName
{
  return   _appNameLabel.text;
}

-(void)setAppPrice:(NSString *)appPrice
{
    _appPriceLabel.text = appPrice;
}
-(NSString*) appPrice
{
    return _appPriceLabel.text;
}

-(void) setAppTreand:(NSString *)appTreand
{
    _appLimitLabel.text = appTreand;
}
-(NSString*) appTreand
{
    return _appLimitLabel.text;
}

-(void) setAppMark:(NSString *)appMark
{
    _appMarkLabel.text = appMark;
}
-(NSString*) appMark
{
    return _appMarkLabel.text;
}

-(void) setAppType:(NSString *)appType
{
    _appTypeLabel.text = appType;
}

-(NSString*) appType
{
    return _appTypeLabel.text;
}

-(void) setAppSize:(NSString *)appSize
{
    _appSizeLabel.text = appSize;
}
-(NSString*) appSize
{
    return _appSizeLabel.text;
}
-(void)setAppInfo:(NSString *)appInfo
{
    _appInfoLabel.text =appInfo;
}
-(NSString*) appInfo
{
    return _appInfoLabel.text;
}

- (void)setShrinksImageUrlString1:(NSString *)shrinksImageUrlString1
{
    _ShrinksImageView1.urlString  = shrinksImageUrlString1;
}

-(NSString*)shrinksImageUrlString1
{
    return _ShrinksImageView1.urlString;
}

-(void) setShrinksImageUrlString2:(NSString *)shrinksImageUrlString2
{
    _ShrinksImageView2.urlString = shrinksImageUrlString2;
}

-(NSString*) shrinksImageUrlString2
{
    return _ShrinksImageView2.urlString;
}

-(void) setShrinksImageUrlString3:(NSString *)shrinksImageUrlString3
{
    _ShrinksImageView3.urlString  = shrinksImageUrlString3;
}

-(NSString*) shrinksImageUrlString3
{
    return _ShrinksImageView3.urlString;
}
-(void) setShrinksImageUrlString4:(NSString *)shrinksImageUrlString4
{
    _ShrinksImageView4.urlString = shrinksImageUrlString4;
}

-(NSString*) shrinksImageUrlString4
{
    return _ShrinksImageView4.urlString;
}
-(void) setShrinksImageUrlString5:(NSString *)shrinksImageUrlString5
{
    _ShrinksImageView5.urlString = shrinksImageUrlString5;
}

-(NSString*) shrinksImageUrlString5
{
    return _ShrinksImageView5.urlString;
}

-(void)setNearbyApp1:(NSString *)nearbyApp1
{
    _nearbyApp1ImageView.urlString = nearbyApp1;
}
-(NSString*)nearbyApp1
{
    return _nearbyApp1ImageView.urlString;
}

-(void)setNearbyApp2:(NSString *)nearbyApp2
{
    _nearbyApp2ImageView.urlString = nearbyApp2;
}
-(NSString*)nearbyApp2
{
    return _nearbyApp2ImageView.urlString;
}

-(void)setNearbyApp3:(NSString *)nearbyApp3
{
    _nearbyApp3ImageView.urlString = nearbyApp3;
}
-(NSString*)nearbyApp3
{
    return _nearbyApp3ImageView.urlString;
}

-(void)setNearbyApp4:(NSString *)nearbyApp4
{
    _nearbyApp4ImageView.urlString = nearbyApp4;
}
-(NSString*)nearbyApp4
{
    return _nearbyApp4ImageView.urlString;
}

-(void)setNearbyApp5:(NSString *)nearbyApp5
{
    _nearbyApp5ImageView.urlString = nearbyApp5;
}
-(NSString*)nearbyApp5
{
    return _nearbyApp5ImageView.urlString;
}

-(void)setNearbyApp1Label:(NSString *)nearbyApp1Label
{
    _nearbyApp1Label.text = nearbyApp1Label;
}
-(NSString*)nearbyApp1Label
{
    return _nearbyApp1Label.text;
}
-(void)setNearbyApp2Label:(NSString *)nearbyApp2Label
{
    _nearbyApp2Label.text = nearbyApp2Label;
}
-(NSString*)nearbyApp2Label
{
    return _nearbyApp2Label.text;
}
-(void)setNearbyApp3Label:(NSString *)nearbyApp3Label
{
    _nearbyApp3Label.text = nearbyApp3Label;
}
-(NSString*)nearbyApp3Label
{
    return _nearbyApp3Label.text;
}
-(void)setNearbyApp4Label:(NSString *)nearbyApp4Label
{
    _nearbyApp4Label.text = nearbyApp4Label;
}
-(NSString*)nearbyApp4Label
{
    return _nearbyApp4Label.text;
}
-(void)setNearbyApp5Label:(NSString *)nearbyApp5Label
{
    _nearbyApp5Label.text = nearbyApp5Label;
}
-(NSString*)nearbyApp5Label
{
    return _nearbyApp5Label.text;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _appBigBgView = [[UIImageView alloc] initWithFrame:CGRectMake(7, 7, 306, 270)];
        _appBigBgView.image = [UIImage imageNamed:@"大框.png"];
        [self addSubview:_appBigBgView];
        
        _appSmallBgView = [[UIImageView alloc] initWithFrame:CGRectMake(7, 277, 306, 87)];
        _appSmallBgView.image = [UIImage imageNamed:@"小框.png"];
        [self addSubview:_appSmallBgView];
        
        [self uiConfig];
        
        //五张屏幕截屏图片
        for (int i=0; i<5; i++)
        {
            _screenshotImageView[i] = [[QFWebImageView alloc] initWithFrame:CGRectMake((60*i+7),150,50,70)];
            NSDictionary *dictionary =
            [[[DetailModel shareDetailModel] screenshotImageUrlDictionaryArray]objectAtIndex:i];
            _screenshotImageView[i].urlString = [dictionary valueForKey:@"smallUrl"];
            _screenshotImageView[i].userInteractionEnabled = YES;
            _screenshotImageView[i].tag = i;
            UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:[OriginalImageViewController shareOriginalImageViewController] action:@selector(screenshotImageViewTap:)];
            [_screenshotImageView[i] addGestureRecognizer:tapGestureRecognizer];
            [tapGestureRecognizer release];
            
            [_appBigBgView addSubview:_screenshotImageView[i]];
        }

    }
    return self;
}


/**
 *  布局函数
 */
- (void)uiConfig
{
    _appImageView = [[QFWebImageView alloc] initWithFrame:CGRectMake(10, 20, 65, 65)];
    [_appBigBgView addSubview:_appImageView];
    
    _appNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 1, 250, 40)];
    _appNameLabel.font = [UIFont systemFontOfSize:17];
    [_appBigBgView addSubview:_appNameLabel];
    
    _appPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 30, 100, 30)];
    _appPriceLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
    _appPriceLabel.font = [UIFont systemFontOfSize:15];

    [_appBigBgView addSubview:_appPriceLabel];
    
    _appLimitLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 30, 100, 30)];
    _appLimitLabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1];
    _appLimitLabel.font = [UIFont systemFontOfSize:15];
    [_appBigBgView addSubview:_appLimitLabel];
    
    _appSizeLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 50, 200, 30)];
    _appSizeLabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1];
    _appSizeLabel.font = [UIFont systemFontOfSize:15];
    [_appBigBgView addSubview:_appSizeLabel];
    
    
    _appTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 70, 120, 30)];
    _appTypeLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    _appTypeLabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1];
    _appTypeLabel.font = [UIFont systemFontOfSize:15];
    [_appBigBgView addSubview:_appTypeLabel];
    
    _appMarkLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 65, 100, 40)];
    _appMarkLabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1];
    _appMarkLabel.font = [UIFont systemFontOfSize:14];
    [_appBigBgView addSubview:_appMarkLabel];
    
    _appInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 220, 295, 47)];
    _appInfoLabel.font = [UIFont systemFontOfSize:14];
    _appInfoLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
    _appInfoLabel.numberOfLines = 0 ;
    _appInfoLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    [_appBigBgView addSubview:_appInfoLabel];
    
    
    UIImageView *_shareImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 20, 20)];
    _appShareView = [[UIImageView alloc] initWithFrame:CGRectMake(3, 100, 100, 40)];
    [_appShareView setBackgroundColor:[UIColor colorWithRed:100/255.0 green:200/255.0 blue:90/255.0 alpha:1]];
    _shareImageView.image = [UIImage imageNamed:@"6.应用详情_12.png"];
    
    UILabel *_label = [[UILabel alloc] initWithFrame:CGRectMake(45, 10, 60, 20)];
    _label.text = @"分享";
    _label.textColor = [UIColor whiteColor];
    _label.font = [UIFont boldSystemFontOfSize:17];
    _label.textAlignment = NSTextAlignmentLeft;

    [_appShareView addSubview:_label];
    [_appShareView addSubview:_shareImageView];
    [_appBigBgView addSubview:_appShareView];
    [_label release];
    [_shareImageView release];
    
    
    
    UIImageView *_collectImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 20, 20)];
    _appCollectView = [[UIImageView alloc] initWithFrame:CGRectMake(104, 100, 100, 40)];
    [_appCollectView setBackgroundColor:[UIColor colorWithRed:100/255.0 green:200/255.0 blue:90/255.0 alpha:1]];
    _collectImageView.image = [UIImage imageNamed:@"6.应用详情_09.png"];
    
    UILabel *_label1 = [[UILabel alloc] initWithFrame:CGRectMake(45, 10, 60, 20)];
    _label1.text = @"收藏";
    _label1.textColor = [UIColor whiteColor];
    _label1.font = [UIFont boldSystemFontOfSize:17];
    _label1.textAlignment = NSTextAlignmentLeft;
    
    [_appCollectView addSubview:_label1];
    [_appCollectView addSubview:_collectImageView];
    [_appBigBgView addSubview:_appCollectView];
    [_label1 release];
    [_collectImageView release];
    
    
    UIImageView *_downloadImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 20, 20)];
    _appDownloadView = [[UIImageView alloc] initWithFrame:CGRectMake(205, 100, 100, 40)];
    [_appDownloadView setBackgroundColor:[UIColor colorWithRed:100/255.0 green:200/255.0 blue:90/255.0 alpha:1]];
    _downloadImageView.image = [UIImage imageNamed:@"6.应用详情_15.png"];
    
    UILabel *_label2 = [[UILabel alloc] initWithFrame:CGRectMake(45, 10, 60, 20)];
    _label2.text = @"下载";
    _label2.textColor = [UIColor whiteColor];
    _label2.font = [UIFont boldSystemFontOfSize:17];
    _label2.textAlignment = NSTextAlignmentLeft;
    
    [_appDownloadView addSubview:_label2];
    [_appDownloadView addSubview:_downloadImageView];
    [_appBigBgView addSubview:_appDownloadView];
    [_label2 release];
    [_downloadImageView release];
    
    
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(3, 150, 300, 70)];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.alwaysBounceHorizontal = YES ;
    _scrollView.directionalLockEnabled =YES;
    _scrollView.contentSize = CGSizeMake(300, 70);
    _appBigBgView.userInteractionEnabled =YES;
    
    
    /*
    _ShrinksImageView1 = [[QFWebImageView alloc] initWithFrame:CGRectMake(7, 0, 45, 70)];
    _ShrinksImageView1.userInteractionEnabled = YES;
    
    _ShrinksImageView2 = [[QFWebImageView alloc] initWithFrame:CGRectMake(70-3, 0, 45, 70)];
    _ShrinksImageView2.userInteractionEnabled = YES;
    
    _ShrinksImageView3 = [[QFWebImageView alloc] initWithFrame:CGRectMake(130-3, 0, 45, 70)];
    _ShrinksImageView3.userInteractionEnabled = YES;
    
    _ShrinksImageView4 = [[QFWebImageView alloc] initWithFrame:CGRectMake(190-3, 0, 45, 70)];
    _ShrinksImageView4.userInteractionEnabled = YES;
    
    _ShrinksImageView5 = [[QFWebImageView alloc] initWithFrame:CGRectMake(250-3, 0, 45, 70)];
    _ShrinksImageView5.userInteractionEnabled = YES;

    [_scrollView addSubview:_ShrinksImageView1];
    [_scrollView addSubview:_ShrinksImageView2];
    [_scrollView addSubview:_ShrinksImageView3];
    [_scrollView addSubview:_ShrinksImageView4];
    [_scrollView addSubview:_ShrinksImageView5];
    [_appBigBgView addSubview:_scrollView];
     */
    
    _button = [[UIButton buttonWithType:UIButtonTypeCustom]retain];
    _button.frame = CGRectMake(10, 8, 108, 18);
    _button.layer.masksToBounds = YES;
    _button.layer.cornerRadius = 5 ;
    [_button setBackgroundImage:[UIImage imageNamed:@"6.应用详情_0.png"] forState:UIControlStateNormal];
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 100, 20)];
    label4.text = @"附近的人还在用:";
    label4.textColor = [UIColor whiteColor];
    label4.font = [UIFont boldSystemFontOfSize:13];
    label4.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    [_button addSubview:label4];
    _appSmallBgView.userInteractionEnabled = YES;
    [_appSmallBgView addSubview:_button];
    
    
    _nearbyApp1ImageView = [[QFWebImageView alloc] initWithFrame:CGRectMake(35, 30, 37, 35)];
    [_nearbyApp1ImageView addTarget:self action:@selector(nearbyApp1ImageViewClick:) forControlEvents:UIControlEventTouchUpInside];
    _nearbyApp1ImageView.userInteractionEnabled = YES;
    
    _nearbyApp2ImageView = [[QFWebImageView alloc] initWithFrame:CGRectMake(85, 30, 37, 35)];
    [_nearbyApp2ImageView addTarget:self action:@selector(nearbyApp2ImageViewClick:) forControlEvents:UIControlEventTouchUpInside];
    _nearbyApp2ImageView.userInteractionEnabled = YES;
    
    _nearbyApp3ImageView = [[QFWebImageView alloc] initWithFrame:CGRectMake(133, 30, 37, 35)];
    [_nearbyApp3ImageView addTarget:self action:@selector(nearbyApp3ImageViewClick:) forControlEvents:UIControlEventTouchUpInside];
    _nearbyApp3ImageView.userInteractionEnabled = YES;
    
    _nearbyApp4ImageView = [[QFWebImageView alloc] initWithFrame:CGRectMake(80+45+45+13, 30, 37, 35)];
    [_nearbyApp4ImageView addTarget:self action:@selector(nearbyApp4ImageViewClick:) forControlEvents:UIControlEventTouchUpInside];
    _nearbyApp4ImageView.userInteractionEnabled  = YES;
    
    _nearbyApp5ImageView = [[QFWebImageView alloc] initWithFrame:CGRectMake(80+45+45+45+20, 30, 37, 35)];
    [_nearbyApp5ImageView addTarget:self action:@selector(nearbyApp5ImageViewClick:) forControlEvents:UIControlEventTouchUpInside];
    _nearbyApp5ImageView.userInteractionEnabled = YES;
    
    [_appSmallBgView addSubview:_nearbyApp1ImageView];
    [_appSmallBgView addSubview:_nearbyApp2ImageView];
    [_appSmallBgView addSubview:_nearbyApp3ImageView];
    [_appSmallBgView addSubview:_nearbyApp4ImageView];
    [_appSmallBgView addSubview:_nearbyApp5ImageView];
    
    
    
    _nearbyApp1Label = [[UILabel alloc] initWithFrame:CGRectMake(35, 60, 50, 30)];
    _nearbyApp1Label.font = [UIFont systemFontOfSize:10];
    _nearbyApp1Label.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
    _nearbyApp2Label = [[UILabel alloc] initWithFrame:CGRectMake(85, 60, 50, 30)];
    _nearbyApp2Label.font = [UIFont systemFontOfSize:10];
    _nearbyApp2Label.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
    _nearbyApp3Label = [[UILabel alloc] initWithFrame:CGRectMake(133, 60, 50, 30)];
    _nearbyApp3Label.font = [UIFont systemFontOfSize:10];
    _nearbyApp3Label.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
    _nearbyApp4Label = [[UILabel alloc] initWithFrame:CGRectMake(80+45+45+13, 60, 50, 30)];
    _nearbyApp4Label.font = [UIFont systemFontOfSize:10];
    _nearbyApp4Label.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
    _nearbyApp5Label = [[UILabel alloc] initWithFrame:CGRectMake(80+45+45+45+20, 60, 50, 30)];
    _nearbyApp5Label.font = [UIFont systemFontOfSize:10];
    _nearbyApp5Label.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
    [_appSmallBgView addSubview:_nearbyApp1Label];
    [_appSmallBgView addSubview:_nearbyApp2Label];
    [_appSmallBgView addSubview:_nearbyApp3Label];
    [_appSmallBgView addSubview:_nearbyApp4Label];
    [_appSmallBgView addSubview:_nearbyApp5Label];
}

#pragma mark - 触发点击事件

-(void)nearbyApp1ImageViewClick:(id)sender
{
    [[DetailViewController shareDeteilViewController] showAppDetailViewWithAppID:_nearbyAppId1 animated:YES];
}
-(void)nearbyApp2ImageViewClick:(id)sender
{
    [[DetailViewController shareDeteilViewController] showAppDetailViewWithAppID:_nearbyAppId2 animated:YES];
}
-(void)nearbyApp3ImageViewClick:(id)sender
{
    [[DetailViewController shareDeteilViewController] showAppDetailViewWithAppID:_nearbyAppId3 animated:YES];
}
-(void)nearbyApp4ImageViewClick:(id)sender
{
    [[DetailViewController shareDeteilViewController] showAppDetailViewWithAppID:_nearbyAppId4 animated:YES];
}
-(void)nearbyApp5ImageViewClick:(id)sender
{
    [[DetailViewController shareDeteilViewController] showAppDetailViewWithAppID:_nearbyAppId5 animated:YES];
}

///**
// *   缩图的每次点击查看大图
// *
// *  @param tapGestureRecognizer 添加一个UITapGestureRecognizer手势
// */
//- (void)screenshotImageViewTap:(UITapGestureRecognizer *)tapGestureRecognizer
//{
//    NSMutableArray *imageUrlStringMutableArray = [[NSMutableArray alloc] init];
//    
//    for (int i=0; i<5; i++)
//    {
//        NSDictionary * dictionary= [[[DetailModel shareDetailModel] screenshotImageUrlDictionaryArray] objectAtIndex:i];
//
//        NSString *originalUrl = [dictionary valueForKey:@"originalUrl"];
//        [imageUrlStringMutableArray addObject:originalUrl];
//    }
//    
//    
//    [[MainViewController shareMainViewController] showOriginalImageViewWithImageUrlStringArray:imageUrlStringMutableArray animated:YES];
//    
//    [imageUrlStringMutableArray release];
//}


#pragma mark - 析构函数
    
- (void)dealloc
{
    [super dealloc];
    
    [_appImageView release];
    _appImageView = nil;
    
    [_appNameLabel release];
    _appNameLabel = nil;
    
    [_appBigBgView release];
    _appBigBgView = nil;
    
    [_appSmallBgView release];
    _appSmallBgView = nil;
    
    [_appPriceLabel release];
    _appPriceLabel = nil;
    
    [_appLimitLabel release];
    _appLimitLabel = nil;
    
    [_appSizeLabel release];
    _appSizeLabel = nil;
    
    [_appTypeLabel release];
    _appTypeLabel = nil;
    
    [_appMarkLabel release];
    _appMarkLabel = nil;
    
    [_appShareView release];
    _appShareView = nil;
    
    [_appCollectView release];
    _appCollectView = nil;
    
    [_appDownloadView release];
    _appDownloadView = nil;
    
    [_appInfoLabel release];
    _appInfoLabel = nil;
    
    [_scrollView release];
    _scrollView = nil;
    
    [_ShrinksImageView1 release];
    _ShrinksImageView1 = nil;
    
    [_ShrinksImageView2 release];
    _ShrinksImageView2 = nil;
    
    [_ShrinksImageView3 release];
    _ShrinksImageView3 = nil;
    
    [_ShrinksImageView4 release];
    _ShrinksImageView4 = nil;
    
    [_ShrinksImageView5 release];
    _ShrinksImageView5 = nil;
    
    [_button release];
    _button = nil;
    
    [_nearbyApp1ImageView release];
    _nearbyApp1ImageView = nil;
    
    [_nearbyApp2ImageView release];
    _nearbyApp2ImageView = nil;
    
    [_nearbyApp3ImageView release];
    _nearbyApp3ImageView = nil;
    
    
    [_nearbyApp4ImageView release];
    _nearbyApp4ImageView = nil;
    
    
    [_nearbyApp5ImageView release];
    _nearbyApp5ImageView = nil;
    
    [_nearbyApp1Label release];
    _nearbyApp1Label = nil;
    
    [_nearbyApp2Label release];
    _nearbyApp2Label = nil;
    
    [_nearbyApp3Label release];
    _nearbyApp3Label = nil;
    
    [_nearbyApp4Label release];
    _nearbyApp4Label = nil;
    
    [_nearbyApp5Label release];
    _nearbyApp5Label = nil;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
