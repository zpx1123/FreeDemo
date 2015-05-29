//
//  setCell.h
//  爱限免
//
//  Created by qianfeng on 14-5-9.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "setModel.h"

@interface setCell : UITableViewCell

//用于接收传递过来的setModel

@property (nonatomic,retain,readwrite) setModel *currentModel;

- (void)fillData;

@end
