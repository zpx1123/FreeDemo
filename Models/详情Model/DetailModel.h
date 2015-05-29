//
//  DetailModel.h
//  爱限免
//
//  Created by qianfeng on 14-5-10.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailModel : NSObject<UITableViewDataSource>
{
    NSDictionary    *_dictionary;
    NSDictionary    *_dictionary1;
    
    UIButton        *_shareButton;
    UIButton        *_collectButton;
    UIButton        *_downloadButton;
}

+(DetailModel*) shareDetailModel;

@property (copy ,nonatomic,readwrite) NSString* appId;
@property(retain, readwrite, nonatomic)NSMutableArray * screenshotImageUrlDictionaryArray;
//@property (retain,nonatomic,readwrite) NSMutableArray * appIconImageUrlArray;


- (void)refreshDataCompletion:(void (^)(BOOL finished))completion;


@end
