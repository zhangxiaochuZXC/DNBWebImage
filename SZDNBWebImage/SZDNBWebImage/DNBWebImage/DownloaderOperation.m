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
 2.图片下载需要图片地址
 3.把图片对象传递到展示的地方 (Block / 代理 / 通知)
 */

@implementation DownloaderOperation

/*
 1.重写操作执行的入口方法 : 做你想做的事,默认就在子线程异步执行的
 2.一旦队列调度了操作执行,那么这个操作就会自动的执行main方法
 */
- (void)main
{
//    NSLog(@"传入 %@",self.URLStr);
    
    // 图片下载
    NSURL *URL = [NSURL URLWithString:self.URLStr];
    NSData *data = [NSData dataWithContentsOfURL:URL];
    UIImage *image = [UIImage imageWithData:data];
    
    // 图片下载完成之后,需要把图片回调 / 传递到展示的地方
    if (self.successBlock != nil) {
        // 执行完这行代码,VC里面的successBlock就会执行,并拿到image
        // 注意 : 在哪个线程回调代码块,那么代码块就在哪个线程执行;代理 / 通知也是这样的
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.successBlock(image);
        }];
    }
}

@end
