//
//  YYGDataSoource.m
//  0802架构学习
//
//  Created by 区块国际－yin on 16/8/2.
//  Copyright © 2016年 区块国际－yin. All rights reserved.
//

#import "YYGDataSoource.h"
#import "YYGDataModel.h"
#import "YYGDataLayer.h"
#import "YYGNotification.h"

@interface YYGDataSoource()

@property(strong,nonatomic) NSNumber * data;

@end

@implementation YYGDataSoource

-(instancetype)init
{
    if (self=[super init])
    {
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(NotificationHandler)
                                                    name:YYGDataChangedNotification
                                                  object:nil];
        [self updata];
    }
    return self;
}
-(void)updata

{
    YYGDataModel * model1=[YYGDataLayer selectData];
    YYGDataModel * model2=[YYGDataLayer selectOtherData];
    self.data=@([model1.data intValue]+[model2.data intValue]);
}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

#pragma mark Classs Notification
-(void)NotificationHandler
{
    [self updata];
}

@end
