//
//  DownloaderOperationManager.m
//  SZDNBWebImage
//
//  Created by Shenzhen_iOS_07 on 16/10/23.
//  Copyright © 2016年 Shenzhen_iOS_07. All rights reserved.
//

#import "DownloaderOperationManager.h"

@interface DownloaderOperationManager ()

/* 队列 */
@property (strong, nonatomic) NSOperationQueue *queue;
/* 操作缓存池 */
@property (strong, nonatomic) NSMutableDictionary *OPCache;

@end

@implementation DownloaderOperationManager

+ (instancetype)sharedManager
{
    static id instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.queue = [[NSOperationQueue alloc] init];
        self.OPCache = [[NSMutableDictionary alloc] init];
    }
    return self;
}

// 单例下载的主方法 : 单例封装DownloaderOperation的下载代码
- (void)downloadWithURLStr:(NSString *)URLStr successBlock:(void (^)(UIImage *))successBlock
{
    // 单例定义代码块,传递给自定义操作
    void(^managerBlock)() = ^(UIImage *image){
        
        // 回调VC传给单例的代码块,把image传递到VC
        if (successBlock != nil) {
            // 执行完这行代码,VC里面的successBlock就会执行,拿到image
            successBlock(image);
        }
        
        // 图片下载完成之后,移除操作
        [self.OPCache removeObjectForKey:URLStr];
    };
    
    // 创建自定义操作
    DownloaderOperation *op = [DownloaderOperation downloadWithURLStr:URLStr successBlock:managerBlock];
    
    // 把创建的操作添加到操作缓存池
    [self.OPCache setObject:op forKey:URLStr];
    
    // 把自定义操作添加到队列
    [self.queue addOperation:op];
}

@end
