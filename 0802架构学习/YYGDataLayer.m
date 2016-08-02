//
//  YYGDataLayer.m
//  0802架构学习
//
//  Created by 区块国际－yin on 16/8/2.
//  Copyright © 2016年 区块国际－yin. All rights reserved.
//

#import "YYGDataLayer.h"
#import "YYGDataModel.h"

static int s_data = 55;

static int s_otherData = 15;

@implementation YYGDataLayer

+(YYGDataModel *)selectData
{
    YYGDataModel * model=[YYGDataModel new];
    model.data=@(s_data);
    
    return model;
}
+(void)setData:(int)Data
{
    if (Data!=s_data)
    {
        s_data=Data;
    }
}

+(YYGDataModel *)selectOtherData
{
    YYGDataModel * model=[YYGDataModel new];
    model.data=@(s_otherData);
    
    return model;
}
+(void)setOtherData:(int)Data
{
    if (Data!=s_otherData)
    {
        s_otherData=Data;
    }
}

@end
