//
//  setCell.m
//  爱限免
//
//  Created by qianfeng on 14-5-9.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "setCell.h"

@implementation setCell
{
    UIImageView         *_setImageView;
    UILabel             *_titleLabel;
    UIImageView         *_imageArrow;       //箭头图标
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self uiConfig];
        
        //设置cell处于选中状态下的背景视图
        UIImageView *selectView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 320,50)];
        selectView.image = [UIImage imageNamed:@"选中3.png"];
        self.selectedBackgroundView = selectView;
        [selectView release];
        
        //箭头图标
        _imageArrow = [[UIImageView alloc] initWithFrame:CGRectMake(270, 15, 12, 15)];
        _imageArrow.image = [UIImage imageNamed:@"1.主页_11.png"];
        [self.contentView addSubview:_imageArrow];

        
    }
    return self;
}

- (void)uiConfig
{
    _setImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15,15,20,20)];
    [self.contentView addSubview:_setImageView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, 10, 100, 30)];
    _titleLabel.textColor = [UIColor colorWithRed:90/255.0 green:90/255.0 blue:90/255.0 alpha:1];
    [self.contentView addSubview:_titleLabel];
    
    for (int i = 0 ; i < 5; i++)
    {
        //cell的分割线图片
        UIImageView* _separatorImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,49+50*i, 320, 1)];
        _separatorImageView.image = [UIImage imageNamed:@"线1.png"];
        [self.contentView addSubview:_separatorImageView];
    }
    
}


- (void)fillData
{
    if (_currentModel)
    {
        _setImageView.image = _currentModel.image;
        _titleLabel.text = _currentModel.title;
    }
}


-(void)dealloc
{
    [_setImageView release];
    _setImageView = nil;
    
    [_titleLabel release];
    _titleLabel = nil;
    
    [super dealloc];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
