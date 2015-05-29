//
//  CategoryCell.h
//  爱限免
//
//  Created by qianfeng on 14-5-10.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFWebImageView.h"
/**
 *  程序cell
 */
@interface CategoryCell : UITableViewCell
{
    QFWebImageView     *_categoryImageView; //种类图标
    UILabel         *_categoryNameLabel; //种类名字
    UILabel         *_categoryInfoLabel; //应用详情
    UIImageView     *_imageArrow;        //箭头
}

@property (copy , nonatomic ,readwrite) NSString* categoryIcon;
@property (copy , nonatomic ,readwrite) NSString* categoryName;           //种类名称
@property (copy , nonatomic ,readwrite) NSString* categoryAllOrLimitsFreeNumbers;//限免app数目 ,全部app数目
@end



