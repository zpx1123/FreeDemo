//
//  TopicModel.m
//  爱限免
//
//  Created by qianfeng on 14-5-11.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "TopicModel.h"
#import "CONST.h"
#import "QFHTTPManager.h"
#import "TopicCell.h"
#import "topicViewController.h"

@implementation TopicModel
{
    NSMutableArray  *_arr;
}
#pragma mark - 构造、析构


/**
 *  构造,析构函数
 */
- (id)init
{
    self = [super init];
    if (self != nil)
    {
        
        _appTopMutableArray = [[NSMutableArray alloc] init];

    }
    
    return self;
}

- (void)dealloc
{
    [_appTopMutableArray release];
    _appTopMutableArray = nil;
    
    [super dealloc];
}


#pragma mark - 表视图 UITableViewDataSource 的函数

/**
 *  创建多少个cell
 *
 *  @param tableView 在上面创建cell
 *  @param section   多少段
 *
 *  @return YES
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return [_appTopMutableArray count];
        
    }
    else
    {
        return 0;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
/**
 *  cell传值
 *
 *  @param tableView 在上面放置cell，每次只放置一定数量的cell，实现cell的复用
 *  @param indexPath 有个段cell
 *
 *  @return cell本身
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"TopAppIntroductionCellID";
    
    TopicCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil)
    {
        cell = [[[TopicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId]autorelease];
    }
    
    cell.currentModel = [_appTopMutableArray objectAtIndex:indexPath.row];//给topicCell传值

    cell.selectionStyle  = UITableViewCellSelectionStyleNone;
    
    TopicModel *model = [_appTopMutableArray objectAtIndex:[indexPath row]];
    
    cell.appTitle = model.appTitle;
    cell.appBigIconImageUrlString = model.appBigIconImageUrlString;
    cell.appBottomIconImageUrlString = model.appBottomIconImageUrlString;
    cell.editorMessage = model.editorMessage;
    
    cell.appIconImageUrlString1 = model.appIconImageUrlString1;
    cell.appIconImageUrlString2 = model.appIconImageUrlString2;
    cell.appIconImageUrlString3 = model.appIconImageUrlString3;
    cell.appIconImageUrlString4 = model.appIconImageUrlString4;
    
    cell.appName1 = [NSString stringWithFormat:@"%@", model.appName1];
    cell.appName2 = [NSString stringWithFormat:@"%@", model.appName2];
    cell.appName3 = [NSString stringWithFormat:@"%@", model.appName3];
    cell.appName4 = [NSString stringWithFormat:@"%@", model.appName4];
    
    cell.appComment1 = [NSString stringWithFormat:@"%@",model.appComment1];
    cell.appComment2 = [NSString stringWithFormat:@"%@",model.appComment2];
    cell.appComment3 = [NSString stringWithFormat:@"%@",model.appComment3];
    cell.appComment4 = [NSString stringWithFormat:@"%@",model.appComment4];
    
    cell.appDownload1 = [NSString stringWithFormat:@"%@",model.appDownload1];
    cell.appDownload2 = [NSString stringWithFormat:@"%@",model.appDownload2];
    cell.appDownload3 = [NSString stringWithFormat:@"%@",model.appDownload3];
    cell.appDownload4 = [NSString stringWithFormat:@"%@",model.appDownload4];
    
    cell.starRating1 = model.starRating1;
    cell.starRating2 = model.starRating2;
    cell.starRating3 = model.starRating3;
    cell.starRating4 = model.starRating4;
    
    
    
    return cell;
    
}


#pragma mark - 网络下载函数

/**
 *  下拉刷新数据
 *
 *  @param completion
 */
- (void)refreshDataCompletion:(void (^)(BOOL finished))completion
{
    NSString  *urlString = SUBJECT_URL;
    
    [QFHTTPManager requestWithUrl:urlString Finish:^(NSData *data) {
        
        id dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        for (int i = 0; i < [dictionary count] ; i++)
        {
        
            TopicModel *model = [[TopicModel alloc] init];
            
            NSDictionary* dic = [dictionary objectAtIndex:i];
            
            model.appBigIconImageUrlString = [dic objectForKey:@"img"];
            model.appTitle = [dic objectForKey:@"title"];
            model.appBottomIconImageUrlString = [dic objectForKey:@"desc_img"];
            model.editorMessage = [dic objectForKey:@"desc"];

            NSArray  *appInfoArray = [dic objectForKey:@"applications"] ;
            
            
            for (int i = 0; i < [appInfoArray count]; i++)
            {
                NSDictionary* diction = [appInfoArray objectAtIndex:i];

                if (i == 0 )
                {
                    model.appIconImageUrlString1 = [diction objectForKey:@"iconUrl"];
                    model.appName1 = [diction objectForKey:@"name"];
                    model.appComment1 = [diction objectForKey:@"comment"];
                    model.appDownload1 = [diction objectForKey:@"downloads"];
                    model.starRating1 = [[diction objectForKey:@"starOverall"]floatValue];
                    model.appId1 = [diction objectForKey:@"applicationId"];
                }
                if (i == 1)
                {
                    model.appIconImageUrlString2 = [diction objectForKey:@"iconUrl"];
                    model.appName2 = [diction objectForKey:@"name"];
                    model.appComment2 = [diction objectForKey:@"comment"];
                    model.appDownload2 = [diction objectForKey:@"downloads"];
                    model.starRating2 = [[diction objectForKey:@"starOverall"]floatValue];
                    model.appId2 = [diction objectForKey:@"applicationId"];
                }
                if (i == 2)
                {
                    model.appIconImageUrlString3 = [diction objectForKey:@"iconUrl"];
                    model.appName3 = [diction objectForKey:@"name"];
                    model.appComment3 = [diction objectForKey:@"comment"];
                    model.appDownload3 = [diction objectForKey:@"downloads"];
                    model.starRating3 = [[diction objectForKey:@"starOverall"]floatValue];
                    model.appId3 = [diction objectForKey:@"applicationId"];
                }
                if (i==3)
                {
                    model.appIconImageUrlString4 = [diction objectForKey:@"iconUrl"];
                    model.appName4 = [diction objectForKey:@"name"];
                    model.appComment4 = [diction objectForKey:@"comment"];
                    model.appDownload4 = [diction objectForKey:@"downloads"];
                    model.starRating4 = [[diction objectForKey:@"starOverall"]floatValue];
                    model.appId4 = [diction objectForKey:@"applicationId"];
                }
                
            }

            [_appTopMutableArray addObject:model];
            
            [model release];
        
        
      }
        if (completion != nil)
        {
            completion(YES);
        }
        
    } Failed:^(NSError *error) {
        
        if (completion != nil)
        {
            completion(NO);
        }
    }];
}

/**
 *  加载更多 //待用
 *
 *  @param completion
 */
- (void)loadMoreDataCompletion:(void (^)(BOOL))completion
{
    return;
}



@end
