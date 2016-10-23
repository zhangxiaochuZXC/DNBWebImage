//
//  DownloaderOperation.h
//  SZDNBWebImage
//
//  Created by Shenzhen_iOS_07 on 16/10/23.
//  Copyright © 2016年 Shenzhen_iOS_07. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSString+path.h"

@interface DownloaderOperation : NSOperation

/**
 类方法实例化操作,并传入图片地址和下载完成回调

 @param URLStr       图片地址
 @param successBlock 下载完成回到

 @return 返回自定义操作对象
 */
+ (instancetype)downloadWithURLStr:(NSString *)URLStr successBlock:(void(^)(UIImage *))successBlock;

@end
