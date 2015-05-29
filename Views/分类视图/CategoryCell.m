//
//  CategoryCell.m
//  爱限免
//
//  Created by qianfeng on 14-5-10.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "CategoryCell.h"

@implementation CategoryCell

#pragma mark - 属性

/**
 *  @dynamic自己重写不用系统自动生成的
 */
@dynamic categoryName;
@dynamic categoryAllOrLimitsFreeNumbers;
@dynamic categoryIcon;

- (void)setCategoryIcon:(NSString *)categoryIcon
{
    _categoryImageView.urlString = categoryIcon;
}

- (NSString*) categoryIcon
{
    return _categoryImageView.urlString;
}

- (void) setCategoryName:(NSString *)categoryName
{
    _categoryNameLabel.text = categoryName;
}

- (NSString*) categoryName
{
    return _categoryNameLabel.text;
}

- (void) setCategoryAllOrLimitsFreeNumbers:(NSString *)categoryAllOrLimitsFreeNumbers
{
    _categoryInfoLabel.text = categoryAllOrLimitsFreeNumbers ;
}

- (NSString *) categoryAllOrLimitsFreeNumbers
{
    return _categoryInfoLabel.text;
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


- (void)uiConfig
{
    _categoryImageView = [[QFWebImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
    [self.contentView addSubview:_categoryImageView];
    
    _categoryNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 7, 100, 50)];
    _categoryNameLabel.font = [UIFont systemFontOfSize:20];
    _categoryNameLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:_categoryNameLabel];
    
    _categoryInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 37, 320, 50)];
    _categoryInfoLabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1];
    _categoryInfoLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_categoryInfoLabel];
    
    //箭头图标
    _imageArrow = [[UIImageView alloc] initWithFrame:CGRectMake(300, 30, 12, 15)];
    _imageArrow.image = [UIImage imageNamed:@"1.主页_11.png"];
    [self.contentView addSubview:_imageArrow];
    
}


- (void)dealloc
{
    [super dealloc];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
