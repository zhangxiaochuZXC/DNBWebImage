//
//  NSString+path.h
//  01-异步下载网络图片
//
//  Created by Shenzhen_iOS_07 on 16/10/22.
//  Copyright © 2016年 Shenzhen_iOS_07. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (path)


/**
 获取caches全路径的方法

 @return 返回caches全路径
 */
- (NSString *)appendCaches;

@end
