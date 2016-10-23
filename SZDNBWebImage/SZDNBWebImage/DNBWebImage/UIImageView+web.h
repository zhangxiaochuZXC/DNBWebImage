//
//  UIImageView+web.h
//  SZDNBWebImage
//
//  Created by Shenzhen_iOS_07 on 16/10/23.
//  Copyright © 2016年 Shenzhen_iOS_07. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownloaderOperationManager.h"

@interface UIImageView (web)

/* 
 上次图片地址
 不会生成带下划线的成员变量,需要自己重写setter和getter方法
 分类不能拓展成员变量,但是类拓展 / 延展里面可以
 */
@property (copy, nonatomic) NSString *lastURLStr;

/**
 分类实现图片下载,取消,缓存的主方法

 @param URLStr 接收图片下载地址
 */
- (void)DNB_setImageWithURLStr:(NSString *)URLStr;

@end
