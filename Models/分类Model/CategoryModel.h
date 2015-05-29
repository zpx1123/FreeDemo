//
//  CategoryModel.h
//  爱限免
//
//  Created by qianfeng on 14-5-10.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QFTableView.h"


@interface CategoryAppIntroductionInfo : NSObject

@property (nonatomic ,copy , readwrite) NSString    *categoryIcon;
@property (nonatomic ,copy , readwrite) NSString    *categoryName;
@property (nonatomic ,copy , readwrite) NSString    *categoryAllNumbers;  //全部应用数目
@property (nonatomic ,copy , readwrite) NSString    *categoryLimitsFreeNumbers; //限免应用数目
@property (copy, nonatomic , readwrite) NSString    *categoryInfoLabel;   //介绍label
@property (copy, nonatomic , readwrite) NSString    *categoryId;   //categoryId

@end


/**
 *  程序模型
 */
@interface CategoryModel : NSObject<QFTableViewDataSource ,UIActionSheetDelegate>
{
    NSMutableArray  *_appCategoryIntroductMutableArray;
}

- (NSString *)getCategoryIdWithIndex:(int)index;

@end
