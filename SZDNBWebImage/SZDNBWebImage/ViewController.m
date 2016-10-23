//
//  ViewController.m
//  SZDNBWebImage
//
//  Created by Shenzhen_iOS_07 on 16/10/23.
//  Copyright © 2016年 Shenzhen_iOS_07. All rights reserved.
//

#import "ViewController.h"
#import "DownloaderOperation.h"

@interface ViewController ()

/* 队列 */
@property (strong, nonatomic) NSOperationQueue *queue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.创建队列
    self.queue = [[NSOperationQueue alloc] init];
    
    // 图片地址
    NSString *URLStr = @"http://img05.tooopen.com/images/20140604/sy_62331342149.jpg";
    // 下载完成回调
    void(^successBlock)() = ^(UIImage *image){
        // 先检测是否可以成功的拿到图片对象
        NSLog(@"VC %@ %@",image,[NSThread currentThread]);
    };
    
    // 2.创建自定义操作
    DownloaderOperation *op = [DownloaderOperation downloadWithURLStr:URLStr successBlock:successBlock];
    
    // 3.把自定义操作添加到队列
    [self.queue addOperation:op];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
