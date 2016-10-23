//
//  DownloaderOperationManager.h
//  SZDNBWebImage
//
//  Created by Shenzhen_iOS_07 on 16/10/23.
//  Copyright © 2016年 Shenzhen_iOS_07. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DownloaderOperation.h"

@interface DownloaderOperationManager : NSObject

/**
 单例全局访问点
 
 @return 返回单例对象
 */
+ (instancetype)sharedManager;

/**
 单例下载的方法

 @param URLStr       接收外界传入的图片地址
 @param successBlock 接收外界传入的下载完成回调
 */
- (void)downloadWithURLStr:(NSString *)URLStr successBlock:(void(^)(UIImage *image))successBlock;


/**
 单例取消上次正在执行的方法

 @param lastURLStr 接收上次下载的图片地址
 */
- (void)cancelDownloadingOperationWithLastURLStr:(NSString *)lastURLStr;

@end
