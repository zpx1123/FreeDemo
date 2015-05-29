//
//  CategoryModel.m
//  爱限免
//
//  Created by qianfeng on 14-5-10.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "CategoryModel.h"
#import "CategoryCell.h"
#import "CONST.h"
#import "QFHTTPManager.h"

@implementation CategoryAppIntroductionInfo


@end


@implementation CategoryModel

/**
 *  析构,构造 函数
 */
- (void)dealloc
{
    [super dealloc];
}

- (id) init
{
    self = [super init];
    if (self != nil)
    {
        _appCategoryIntroductMutableArray = [[[NSMutableArray alloc] init]retain];
    }
    
    return self;
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
    return [_appCategoryIntroductMutableArray count];
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
    static NSString *cellId = @"_appCategoryIntroductCellID";
    
    CategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil)
    {
        cell = [[[CategoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId]autorelease];
    }
    
    CategoryAppIntroductionInfo *model = [_appCategoryIntroductMutableArray objectAtIndex:[indexPath row]];
    
    cell.categoryIcon = model.categoryIcon;
    cell.categoryName = [NSString stringWithFormat:@"%@",model.categoryName];
    cell.categoryAllOrLimitsFreeNumbers = [NSString stringWithFormat:@"共%@款应用，其中限免%@",model.categoryAllNumbers,model.categoryLimitsFreeNumbers];
    
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
    //清空所有数据
//    [_appCategoryIntroductMutableArray removeAllObjects];
    
    NSString  *urlString = APPCATE;
    
    [QFHTTPManager requestWithUrl:urlString Finish:^(NSData *data) {
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

        for (NSDictionary *dic in dictionary)
        {
            CategoryAppIntroductionInfo *model = [[CategoryAppIntroductionInfo alloc] init];
            
            model.categoryId = [dic objectForKey:@"categoryId"];
            model.categoryIcon = [dic objectForKey:@"picUrl"];
            model.categoryName = [dic objectForKey:@"categoryCname"];
            model.categoryAllNumbers = [dic objectForKey:@"categoryCount"];
            model.categoryLimitsFreeNumbers = [dic objectForKey:@"free"];
            [_appCategoryIntroductMutableArray addObject:model];

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
    return;
}

- (NSString *)getCategoryIdWithIndex:(int)index
{
    CategoryAppIntroductionInfo * model = [_appCategoryIntroductMutableArray objectAtIndex:index];
    return model.categoryId;
}

@end
