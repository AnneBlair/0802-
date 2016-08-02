//
//  YYGDataLayer.h
//  0802架构学习
//
//  Created by 区块国际－yin on 16/8/2.
//  Copyright © 2016年 区块国际－yin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YYGDataModel;

@interface YYGDataLayer : NSObject

+(YYGDataModel *)selectData;

+(void)setData:(int)Data;

+(YYGDataModel *)selectOtherData;

+(void)setOtherData:(int)Data;

@end
