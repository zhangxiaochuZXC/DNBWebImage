//
//  DownloaderOperation.m
//  SZDNBWebImage
//
//  Created by Shenzhen_iOS_07 on 16/10/23.
//  Copyright © 2016年 Shenzhen_iOS_07. All rights reserved.
//

#import "DownloaderOperation.h"

/*
 图片下载
 1.需要在子线程异步下载
 */

@implementation DownloaderOperation

/*
 1.重写操作执行的入口方法 : 做你想做的事,默认就在子线程异步执行的
 2.一旦队列调度了操作执行,那么这个操作就会自动的执行main方法
 */
- (void)main
{
    // 图片下载
    NSLog(@"%@",[NSThread currentThread]);
}

@end
