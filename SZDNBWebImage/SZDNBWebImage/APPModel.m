//
//  APPModel.m
//  01-异步下载网络图片
//
//  Created by Shenzhen_iOS_07 on 16/10/22.
//  Copyright © 2016年 Shenzhen_iOS_07. All rights reserved.
//

#import "APPModel.h"

@implementation APPModel

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@-%@-%@",self.name,self.download,self.icon];
}

@end
