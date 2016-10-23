//
//  NSString+path.m
//  01-异步下载网络图片
//
//  Created by Shenzhen_iOS_07 on 16/10/22.
//  Copyright © 2016年 Shenzhen_iOS_07. All rights reserved.
//

#import "NSString+path.h"

@implementation NSString (path)

- (NSString *)appendCaches
{
    // 实现沙盒缓存 : 沙盒里面需要存储图片的二进制
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    // 获取图片名字 : lastPathComponent 会遍历`/`,然后取出最后一个`/`后面的字符串
    // `self` 就是这个对象方法的调用者
    NSString *name = [self lastPathComponent];
    // 拼接全路径
    NSString *filePath = [path stringByAppendingPathComponent:name];
    
    // /Users/Shenzhen_iOS_07/Library/Developer/CoreSimulator/Devices/8D3F9291-6427-4820-B35F-C3571281CDFB/data/Containers/Data/Application/E774CFBA-D173-48EC-A329-8C8F016BAE76/Library/Caches/t0125e8d438ae9d2fbb.png
    
    // http://p16.qhimg.com/dr/48_48_/t0125e8d438ae9d2fbb.png
    
    return filePath;
}

@end
