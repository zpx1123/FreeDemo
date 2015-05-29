//
//  CategoryDetailModel.m
//  爱限免
//
//  Created by qianfeng on 14-5-21.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "CategoryDetailModel.h"
#import "QFHTTPManager.h"
#import "categoryDetailCell.h"

@implementation CategoryDetailModel

#pragma mark - 构造、析构

/**
 *  构造,析构函数
 */
- (id)init
{
    self = [super init];
    if (self != nil)
    {
        _appIntroductionMutableArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)dealloc
{
    [_appIntroductionMutableArray release];
    _appIntroductionMutableArray = nil;
    
    [super dealloc];
}

/**
 *  获取categoryID
 *
 *  @param categoryID
 */
-(void) setCategoryID:(NSString *)categoryID
{
    [categoryID retain];
    [_categoryID release];
    _categoryID = [categoryID copy];
    [categoryID release];
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
        return [_appIntroductionMutableArray count];
    }
    else
    {
        return 0;
    }
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
    static NSString *cellId = @"CategoryDetailCellID";
    
    categoryDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil)
    {
        cell = [[[categoryDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId]autorelease];
    }
    
    CategoryDetailModel *model = [_appIntroductionMutableArray objectAtIndex:[indexPath row]];
    
    cell.appIconImageUrlString = model.appIconImageUrlString;
    cell.appName = [NSString stringWithFormat:@"%ld.%@", [indexPath row]+1, model.appName];
    
    //日期
    //结束日期
    NSString* expireDataStr = [NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%@",model.expireDatetime]];
    //获取限免结束日期，计算出剩下多少时间：时：分：秒
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.z"];
    NSDate *destDate= [dateFormatter dateFromString:expireDataStr];
    //计算结束日期距离现在还有多少毫秒
    NSTimeInterval sec = [destDate timeIntervalSinceDate:[NSDate date]];
    //把剩余毫秒数组装成时间格式
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    NSString * dateStr = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceReferenceDate:sec]];
    [dateFormatter release];
    cell.expireDatetime = [NSString stringWithFormat:@"剩余:%@",dateStr];
    
    cell.appPrice = [NSString stringWithFormat:@"$%@", model.appPrice];
    cell.appType = model.appType;
    cell.starRating = model.starRating;
    cell.appShareTimes = [NSString stringWithFormat:@"分享%@次",model.appShareTimes];
    cell.appCollectTimes = [NSString stringWithFormat:@"收藏%@次",model.appCollectTimes];
    cell.appDownloadTimes = [NSString stringWithFormat:@"下载%@次",model.appDownloadTimes];
    
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
    
    NSString  *urlString = [NSString stringWithFormat:@"http://1000phone.net:8088/app/iAppFree/api/limited.php?page=1&number=20&cate_id=%@",self.categoryID];

    NSString* urlStr = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [QFHTTPManager requestWithUrl:urlStr Finish:^(NSData *data) {
        
        //清空所有数据
        [_appIntroductionMutableArray removeAllObjects];
        
        NSDictionary *dictionary = [[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil]retain];

        NSArray  *appInfoArray = [dictionary valueForKey:@"applications"];
        
        for (NSDictionary *dic in appInfoArray)
        {
            CategoryDetailModel *model = [[CategoryDetailModel alloc] init];
            
            model.appIconImageUrlString = [dic objectForKey:@"iconUrl"];
            model.appName = [dic objectForKey:@"name"];
            model.expireDatetime = [dic objectForKey:@"expireDatetime"];//结束时间
            model.appPrice = [dic objectForKey:@"lastPrice"];
            model.starRating = [[dic objectForKey:@"starCurrent"]floatValue];
            model.appType = [dic objectForKey:@"categoryName"];
            model.appShareTimes = [dic objectForKey:@"shares"];
            model.appCollectTimes = [dic objectForKey:@"favorites"];
            model.appDownloadTimes = [dic objectForKey:@"downloads"];
            model.appId = [dic objectForKey:@"applicationId"];
            
            [_appIntroductionMutableArray addObject:model];
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
 *  加载更多
 *
 *  @param completion
 */
- (void)loadMoreDataCompletion:(void (^)(BOOL))completion
{
    return ;
}

/**
 *  获取ID
 *
 *  @param index
 *
 *  @return model.appid
 */
- (NSString *)getAppIDWithIndex:(int)index
{
    CategoryDetailModel    *model = [_appIntroductionMutableArray objectAtIndex:index];
    return model.appId;
}


@end
