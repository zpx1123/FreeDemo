//
//  setRootViewController.m
//  爱限免
//
//  Created by qianfeng on 14-5-10.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "setRootViewController.h"
#import "UIDevice+UIDeviceCategory.h"
#import "setCell.h"
#import "setModel.h"
#import "limitsExemptsViewController.h"
#import "reductionViewController.h"
#import "freeViewController.h"
#import "hotAnnouncementViewController.h"
#import "MainViewController.h"

@interface setRootViewController ()

@end

@implementation setRootViewController


-(void)dealloc
{
    [self QF_viewDidUnload];
    
    [super dealloc];
    
}



-(void) setStr:(NSString *)str
{
    if (_str == str || [_str isEqualToString:str])
    {
        return;
    }
    
    [str retain];
    [_str release];
    _str = [str copy] ;
    [str release];

}



- (id)init
{
    self = [super init];
    if (self)
    {   
        UILabel *titleView = [[UILabel alloc]initWithFrame:CGRectMake(200, 30, 100, 40)];
        titleView.text = @"设置详情";
        [titleView setTextColor:[UIColor whiteColor]];
        titleView.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:20];
        [titleView setTextAlignment:NSTextAlignmentCenter];
        [self.navigationItem setTitleView:titleView];
        [titleView release];
        
        UIBarButtonItem *leftBarButtonItem = nil;
        
        UIButton *leftBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBarButton.frame = CGRectMake(0, 0, 20, 20);
        
        [leftBarButton setImage:[UIImage imageNamed:@"btn_返回_正常.png"] forState:UIControlStateNormal];
        [leftBarButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarButton];
        self.navigationItem.leftBarButtonItem = leftBarButtonItem;
        [leftBarButtonItem release];
        
    }
    return self;
}


#pragma mark - 导航栏 按钮  事件 函数

-(void)backButtonClick:(id)sender
{
    if ([self.str isEqual:@"limitsExemptsViewController"])
    {
        [[limitsExemptsViewController shareLimitsExemptsViewController] showBackViewAnimated:YES];
    }
    else if ([self.str isEqual:@"reductionViewController"])
    {
        [[reductionViewController shareReductionViewController] showBackViewAnimated:YES];
    }
    else if ([self.str isEqual:@"freeViewController"])
    {
        [[freeViewController shareFreeViewController] showBackViewAnimated:YES];
    }
    else if ([self.str isEqual:@"hotAnnouncementViewController"])
    {
        [[hotAnnouncementViewController shareHotAnnouncementViewController] showBackViewAnimated:YES];
    } 
    
}


- (void)prepareSetData
{
    _muArr = [[NSMutableArray alloc] init];
    
    for (int i = 0; i<6; i++)
    {
        setModel *model = [[setModel alloc] init];
        model.image = [UIImage imageNamed:[_arrayImage objectAtIndex:i]];
        model.title = [_arrayName objectAtIndex:i];
        [_muArr addObject:model];
        [model release];
    }
    
}


- (void)loadView
{
    [super loadView];
    
    if ([UIDevice systemVersionFirstNumber] < 7)
    {
        self.wantsFullScreenLayout = NO;
    }
    else
    {
        self.edgesForExtendedLayout = UIRectEdgeBottom|UIRectEdgeLeft | UIRectEdgeRight;
    }
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 300, 300)];
    _imageView.image = [UIImage imageNamed:@"背景1.png"];
    [self.view addSubview:_imageView];
    
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(13,13,290,290) style:UITableViewStylePlain];
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.showsVerticalScrollIndicator = NO ;
    _tableView.scrollEnabled = NO; //固定tableview
    _tableView.delegate = self;
    _tableView.dataSource = self ;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone; //没有cell分割线
    
    [self.view addSubview:_tableView];

}

- (void)tableView:(QFTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected!");
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"deSelected!");
}


-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [_tableView setEditing:editing animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString* cellID = @"cellID";
    
    NSUInteger  row = [indexPath row];
    
    setCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[[setCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID]autorelease];
    }
    
    cell.currentModel = [_muArr objectAtIndex:row];
    [cell fillData];
    
    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _arrayName = [[NSArray arrayWithObjects:@"我的设置",@"我的关注",@"我的收藏",@"我的下载",@"我的评论",@"千锋项目", nil] retain];
    
    _arrayImage = [[NSArray arrayWithObjects:@"9.设置_06.png",@"关注.png",@"9.设置_14.png",@"9.设置_20.png",@"9.设置_25.png",@"9.设置_29.png", nil] retain];
    
    [self prepareSetData];
}


- (void)QF_viewDidUnload
{
    
    [_arrayName release];
    _arrayName = nil;
    
    [_arrayImage release];
    _arrayImage = nil;
    
    [_tableView release];
    _tableView = nil;
    
    [_imageView release];
    _imageView = nil;
    
    [_muArr release];
    _muArr = nil;
    
    self.view = nil;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
