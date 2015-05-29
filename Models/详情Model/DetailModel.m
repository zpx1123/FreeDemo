//
//  DetailModel.m
//  爱限免
//
//  Created by qianfeng on 14-5-10.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "DetailModel.h"
#import "QFHTTPManager.h"
#import "DetailCell.h"
#import "DetailModel.h"
#import "CONST.h"
#import "MainViewController.h"

@implementation DetailModel

{
    NSMutableArray  *muArrPhotos;
    NSMutableArray  *muArrNear;
}
static DetailModel* g_shareDetailModel;
+(DetailModel*) shareDetailModel
{
    return g_shareDetailModel;
}
/**
 *  初始化函数，构造
 *
 *  @return self
 */

-(id) init
{
    self = [super init];
    
    if (self!=nil)
    {
        _dictionary = nil;
        g_shareDetailModel =self;
        
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_dictionary == nil)
    {
        return 0;
    }
    else
    {
        return 1;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString* cellid=@"appDetailsCellID";
    
    DetailCell* cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if(cell ==nil)
    {
        cell = [[[DetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid]autorelease];
        
        _shareButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
        _shareButton.frame = CGRectMake(10, 107, 100, 40);
        [_shareButton addTarget:[MainViewController shareMainViewController] action:@selector(shareButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:_shareButton];
        
        _collectButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
        _collectButton.frame = CGRectMake(110, 107, 100, 40);
        [_collectButton addTarget:[MainViewController shareMainViewController] action:@selector(collectButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:_collectButton];
        
        
        _downloadButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
        _downloadButton.frame = CGRectMake(210, 107, 100, 40);
        [_downloadButton addTarget:self action:@selector(downloadButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:_downloadButton];
        
    }
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.appName = [_dictionary valueForKey:@"name"];
    cell.appMark=[_dictionary valueForKey:@"starCurrent"];
    cell.appIconImageUrlString=[_dictionary valueForKey:@"iconUrl"];
    cell.appPrice = [NSString stringWithFormat:@"原价：¥ %@",[_dictionary valueForKey:@"lastPrice"]];
    cell.appSize = [NSString stringWithFormat:@"大小：%@MB",[_dictionary valueForKey:@"fileSize"]];
    cell.appTreand = [NSString stringWithFormat:@"(%@)",[_dictionary valueForKey:@"priceTrend"]];
    cell.appType = [NSString stringWithFormat:@"类型：%@",[_dictionary valueForKey:@"categoryName"]];
    cell.appMark = [NSString stringWithFormat:@"评分：%@",[_dictionary valueForKey:@"starCurrent"]];
    cell.appInfo = [NSString stringWithFormat:@"游戏简介：%@",[_dictionary valueForKey:@"description"]];
    
    muArrPhotos = [_dictionary valueForKey:@"photos"];
/*
    for (int i = 0 ; i<[muArrPhotos count];i++)
    {
        NSDictionary* dic = [muArrPhotos objectAtIndex:i];
        
        if (i == 0)
        {
            cell.shrinksImageUrlString1 = [dic valueForKey:@"smallUrl"];
        }
        else if (i==1)
        {
            cell.shrinksImageUrlString2 = [dic valueForKey:@"smallUrl"];
        }
        else if (i==2)
        {
            cell.shrinksImageUrlString3 = [dic valueForKey:@"smallUrl"];
        }
        else if (i==3)
        {
            cell.shrinksImageUrlString4 = [dic valueForKey:@"smallUrl"];
        }
        else if (i==4)
        {
            cell.shrinksImageUrlString5 = [dic valueForKey:@"smallUrl"];
        }
        
    }
    */
    
    muArrNear = [_dictionary1 valueForKey:@"applications"];
    
    for (int i = 0; i < [muArrNear count]; i++)
    {
        NSDictionary *dic = [muArrNear objectAtIndex:i];
        
        if (i==0)
        {
            cell.nearbyApp1 = [dic valueForKey:@"iconUrl"];
            cell.nearbyApp1Label = [dic valueForKey:@"name"];
            cell.nearbyAppId1 = [dic valueForKey:@"applicationId"];
        }
        else if (i==1)
        {
            cell.nearbyApp2 = [dic valueForKey:@"iconUrl"];
            cell.nearbyApp2Label = [dic valueForKey:@"name"];
            cell.nearbyAppId2 = [dic valueForKey:@"applicationId"];
        }
        else if (i==2)
        {
            cell.nearbyApp3 = [dic valueForKey:@"iconUrl"];
            cell.nearbyApp3Label = [dic valueForKey:@"name"];
            cell.nearbyAppId3 = [dic valueForKey:@"applicationId"];
        }
        else if (i==3)
        {
            cell.nearbyApp4 = [dic valueForKey:@"iconUrl"];
            cell.nearbyApp4Label = [dic valueForKey:@"name"];
            cell.nearbyAppId4 = [dic valueForKey:@"applicationId"];
        }
        else if (i==4)
        {
            cell.nearbyApp5 = [dic valueForKey:@"iconUrl"];
            cell.nearbyApp5Label = [dic valueForKey:@"name"];
            cell.nearbyAppId5 = [dic valueForKey:@"applicationId"];
        }
            
    }
    
    return cell;
}

-(void) downloadButtonClick:(id)sender
{
    NSString* str = [_dictionary valueForKey:@"iconUrl"];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

/**
 *  获取appid
 *
 *  @param appId copy函数获取
 */
-(void) setAppId:(NSString *)appId
{
    [appId retain];
    [_appId release];
    _appId = [appId copy];
    [appId release];
}


/**
 *  下拉刷新
 *
 *  @param completion
 */
- (void)refreshDataCompletion:(void (^)(BOOL finished))completion
{

    NSString* str = [NSString stringWithFormat:@"http://iappfree.candou.com:8080/free/applications/%@",self.appId];
        
    [QFHTTPManager requestWithUrl:str Finish:^(NSData *data)
    {
         _dictionary = [[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil] retain];

        self.screenshotImageUrlDictionaryArray = [_dictionary objectForKey:@"photos"];
        
        
        if (completion) {
             completion(YES);
         }
         
     } Failed:^(NSError *error) {
         
         if(completion)
         {
             completion(NO);
         }
     }];
    
    
    NSString * str1 = RECOMMENT_URL;
    
    [QFHTTPManager requestWithUrl:str1 Finish:^(NSData *data)
    {
        
        _dictionary1 = [[NSJSONSerialization
                         JSONObjectWithData:data
                                    options:NSJSONReadingMutableContainers
                                      error:nil] retain];
        
        if (completion)
        {
            completion(YES);
        }
        
    } Failed:^(NSError *error) {
        
        if (completion)
        {
            completion(NO);
        }
        
    }];
    
}


/**
 *  析构函数
 */
- (void)dealloc
{
    [_appId release];
    _appId = nil;
    
    self.screenshotImageUrlDictionaryArray = nil;
    
    [super dealloc];
    
} 

@end
