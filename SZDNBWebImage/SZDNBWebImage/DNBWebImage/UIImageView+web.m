//
//  UIImageView+web.m
//  SZDNBWebImage
//
//  Created by Shenzhen_iOS_07 on 16/10/23.
//  Copyright © 2016年 Shenzhen_iOS_07. All rights reserved.
//

#import "UIImageView+web.h"

@implementation UIImageView (web)

/*
- (void)setLastURLStr:(NSString *)lastURLStr
{
    
}

- (NSString *)lastURLStr
{
    
}
 */

- (void)DNB_setImageWithURLStr:(NSString *)URLStr
{
    // 判断当前图片地址和上次图片地址是否一样,如果不一样就取消上次正在执行的下载操作
    // cancel : 仅仅是改变了操作的状态而已,并没有真真的取消这个操作
    if (![URLStr isEqualToString:self.lastURLStr] && self.lastURLStr != nil) {
        
        // 单例接管取消操作
        [[DownloaderOperationManager sharedManager] cancelDownloadingOperationWithLastURLStr:self.lastURLStr];
    }
    
    // 记录本次图片地址,当再次点击时,它自然而然就是上次的地址了.(前任)
    self.lastURLStr = URLStr;
    
    // 3.单例接管下载
    [[DownloaderOperationManager sharedManager] downloadWithURLStr:URLStr successBlock:^(UIImage *image) {
        self.image = image;
    }];
}

@end
