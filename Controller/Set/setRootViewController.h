//
//  setRootViewController.h
//  爱限免
//
//  Created by qianfeng on 14-5-10.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface setRootViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView     *_tableView;
    UIImageView     *_imageView;       //tableView的背景图片
    
    NSArray         *_arrayName;        //设置页面的名称
    NSArray         *_arrayImage;       //设置页面用到的图标
    NSMutableArray  *_muArr;            //动态存储数组
}

@property (nonatomic ,copy ,readwrite) NSString *str; // 传判断字段


@end
