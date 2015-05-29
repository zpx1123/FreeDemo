//
//  ReductionCell.m
//  爱限免
//
//  Created by qianfeng on 14-5-15.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "ReductionCell.h"

@implementation ReductionCell


#pragma mark - 属性

@dynamic appIconImageUrlString;
@dynamic appName;
@dynamic expireDatetime;
@dynamic appPrice;
@synthesize  starRating = _starRating;
@dynamic appType;


- (void)setAppIconImageUrlString:(NSString *)appIconImageUrlString
{
    _appImageView.urlString = appIconImageUrlString;
}

- (NSString *)appIconImageUrlString
{
    return _appImageView.urlString;
}

- (void)setAppName:(NSString *)appName
{
    _appNameLabel.text = appName;
}

- (NSString *)appName
{
    return _appNameLabel.text;
}

- (void)setExpireDatetime:(NSString *)expireDatetime
{
    _appDataLabel.text = expireDatetime;
}

- (NSString *)expireDatetime
{
    return _appDataLabel.text;
}

- (void)setAppPrice:(NSString *)appPrice
{
    _appPriceLabel.text = appPrice;
}

- (NSString *)appPrice
{
    return _appPriceLabel.text;
}

- (void) setStarRating:(float)starRating
{
    _starRating = starRating;
    //星星
    int i ;
    float t = starRating;
    
    for (int i = 0; i < 5; i++)
    {
        UIImageView *starImageView = [[UIImageView alloc]initWithFrame:CGRectMake(80 + i*20, 45, 20, 20)];
        starImageView.image = [UIImage imageNamed:@"1.主页_16.png"];
        [self.contentView addSubview:starImageView];
        [starImageView release];
    }
    
    if((t-(int)(t)) != 0)
    {
        
        for (i = 0 ; i < t; i++)
        {
            UIImageView *starImageView = [[UIImageView alloc]initWithFrame:CGRectMake(80 + i*20, 45, 20, 20)];
            starImageView.image = [UIImage imageNamed:@"1.主页_14.png"];
            [self.contentView addSubview:starImageView];
            [starImageView release];
        }
        
        i = i - 1 ;
        UIImageView *starImageView = [[UIImageView alloc]initWithFrame:CGRectMake(80 + i*20, 45, 20, 20)];
        starImageView.image = [UIImage imageNamed:@"5.专题_15.png"];
        [self.contentView addSubview:starImageView];
        [starImageView release];
    }
    else
    {
        for (i = 0 ; i < t; i++)
        {
            UIImageView *starImageView = [[UIImageView alloc]initWithFrame:CGRectMake(80 + i*20, 45, 20, 20)];
            starImageView.image = [UIImage imageNamed:@"1.主页_14.png"];
            [self.contentView addSubview:starImageView];
            [starImageView release];
        }
        
    }
    
}

- (void) setAppType:(NSString *)appType
{
    _appTypeLabel.text = appType;
}

- (NSString *)appType
{
    return _appTypeLabel.text;
}

- (void) setAppShareTimes:(NSString *)appShareTimes
{
    _appShareLabel.text = appShareTimes;
}

- (NSString*)appShareTimes
{
    return _appCollectLabel.text;
}

- (void) setAppCollectTimes:(NSString *)appCollectTimes
{
    _appCollectLabel.text = appCollectTimes;
}

- (NSString*) appCollectTimes
{
    return _appCollectLabel.text;
}
- (void) setAppDownloadTimes:(NSString *)appDownloadTimes
{
    _appDownloadLabel.text = appDownloadTimes;
}

-(NSString *) appDownloadTimes
{
    return _appDownloadLabel.text;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self uiConfig];
        
        //设置cell的背景视图(处于常规状态下的)
        UIView *bgView  = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,70)];
        bgView.backgroundColor = [UIColor whiteColor];
        self.backgroundView = bgView;
        [bgView release];
        
        //设置cell处于选中状态下的背景视图
        UIView *selectView = [[UIView alloc] initWithFrame:CGRectMake(0,0, 320,70)];
        selectView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"选中条.png"]];
        self.selectedBackgroundView = selectView;
        [selectView release];
        
        _imageArrow = [[UIImageView alloc] initWithFrame:CGRectMake(290, 40, 12, 15)];
        _imageArrow.image = [UIImage imageNamed:@"1.主页_11.png"];
        [self.contentView addSubview:_imageArrow];
    }
    return self;
}


/**
 *  布局函数
 */
///*
- (void)uiConfig
{
    //图片
    _appImageView = [[QFWebImageView alloc]initWithFrame:CGRectMake(15, 10, 50, 50)];
    [self.contentView addSubview:_appImageView];
    
    //名字
    _appNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(80,0, 200, 30)];
    _appNameLabel.font = [UIFont systemFontOfSize:17];
    [self.contentView addSubview:_appNameLabel];
    
    //星星
    _appStarView = [[UIImageView alloc] initWithFrame:CGRectMake(80+100, 45, 20, 20)];
    [self.contentView addSubview:_appStarView];
    
    //剩余时间
    _appDataLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 25, 150, 20)];
    _appDataLabel.font = [UIFont systemFontOfSize:14];
    _appDataLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_appDataLabel];
    
    //价格
    _appPriceLabel = [[UILabel alloc]initWithFrame:CGRectMake(230, 25 , 60, 20)];
    _appPriceLabel.font = [UIFont systemFontOfSize:14];
    _appPriceLabel.textColor = [UIColor lightGrayColor];
    _priceDash = [[UIImageView alloc] initWithFrame:CGRectMake(225, 35, 50, 2)];
    _priceDash.image = [UIImage imageNamed:@"1.主页_08.png"];
    [self.contentView addSubview:_appPriceLabel];
    [self.contentView addSubview:_priceDash];
    
    //分享
    _appShareLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 70, 120, 20)];
    _appShareLabel.font = [UIFont systemFontOfSize:14];
    _appShareLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_appShareLabel];
    
    //收藏
    _appCollectLabel = [[UILabel alloc]initWithFrame:CGRectMake(110, 70, 120, 20)];
    _appCollectLabel.font = [UIFont systemFontOfSize:14];
    _appCollectLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_appCollectLabel];
    
    //下载
    _appDownloadLabel = [[UILabel alloc]initWithFrame:CGRectMake(200, 70, 120, 20)];
    _appDownloadLabel.font = [UIFont systemFontOfSize:14];
    _appDownloadLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_appDownloadLabel];
    
    //类型
    _appTypeLabel = [[UILabel alloc]initWithFrame:CGRectMake(230, 45, 90, 20)];
    _appTypeLabel.font = [UIFont systemFontOfSize:14];
    _appTypeLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_appTypeLabel];
    
}

/**
 *  析构函数
 */
- (void)dealloc
{
    [_appImageView release];
    _appImageView = nil;
    
    [_appNameLabel release];
    _appNameLabel = nil;
    
    [_appDataLabel release];
    _appDataLabel = nil;
    
    [_appPriceLabel release];
    _appPriceLabel = nil;
    
    [_appStarView release];
    _appStarView = nil;
    
    [_appTypeLabel release];
    _appTypeLabel = nil;
    
    [_appShareLabel release];
    _appShareLabel = nil;
    
    [_appCollectLabel release];
    _appCollectLabel = nil;
    
    [_appDownloadLabel release];
    _appDownloadLabel = nil;
    
    [_priceDash release];
    _priceDash = nil;
    
    [super dealloc];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}


@end
