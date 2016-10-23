//
//  DownloaderOperation.h
//  SZDNBWebImage
//
//  Created by Shenzhen_iOS_07 on 16/10/23.
//  Copyright © 2016年 Shenzhen_iOS_07. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DownloaderOperation : NSOperation

/* 接收外界传入的图片地址 */
@property (copy, nonatomic) NSString *URLStr;
/* 接收外界传入的代码块 */
@property (copy, nonatomic) void(^successBlock)(UIImage *iamge);

@end
