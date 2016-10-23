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

@interface DownloaderOperation ()

/* 接收外界传入的图片地址 */
@property (copy, nonatomic) NSString *URLStr;
/* 接收外界传入的代码块 */
@property (copy, nonatomic) void(^successBlock)(UIImage *iamge);

@end

@implementation DownloaderOperation

/*
 1.自定义操作实例化的方法
 2.此方法先于main方法执行
 */
+ (instancetype)downloadWithURLStr:(NSString *)URLStr successBlock:(void (^)(UIImage *))successBlock
{
    // 1.实例化自定义操作
    DownloaderOperation *op = [[DownloaderOperation alloc] init];
    
    // 2.保存图片地址和下载完成回调,就可以在当前类全局使用;把外界传入的数据变成自己的
    op.URLStr = URLStr;
    op.successBlock = successBlock;
    
    // 3.返回自定义操作
    return op;
}

/*
 1.重写操作执行的入口方法 : 做你想做的事,默认就在子线程异步执行的
 2.一旦队列调度了操作执行,那么这个操作就会自动的执行main方法
 */
- (void)main
{
    NSLog(@"传入 %@",self.URLStr);
    
    // 模拟网络延迟
    [NSThread sleepForTimeInterval:1.0];
    
    // 图片下载
    NSURL *URL = [NSURL URLWithString:self.URLStr];
    NSData *data = [NSData dataWithContentsOfURL:URL];
    UIImage *image = [UIImage imageWithData:data];
    
    // 判断当前的操作是否被取消,去过被取消就直接return,不在往下执行;
    // 注意 : 可以在这个方法的多个地方判断,但是,必须能够拦截回调;并且,至少在延迟操作的后面有一个判断
    if (self.isCancelled == YES) {
        NSLog(@"取消 %@",self.URLStr);
        return;
    }
    
    // 断言 : 保证某一个条件一定是满足的,如果不满足就崩溃,可以自定义崩溃的原因;是在Debug时有效,Release模式下无效;方便在开发阶段避免不必要的错误;Debug : 上线之前;Release : 上线之后;
    NSAssert(self.successBlock != nil, @"下载完成的回调,不能为空");
    
    // 图片下载完成之后,需要把图片回调 / 传递到展示的地方
    // 执行完这行代码,VC里面的successBlock就会执行,并拿到image
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        NSLog(@"完成 %@",self.URLStr);
        self.successBlock(image);
    }];
}

@end
