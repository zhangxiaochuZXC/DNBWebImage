//
//  APPModel.h
//  01-异步下载网络图片
//
//  Created by Shenzhen_iOS_07 on 16/10/22.
//  Copyright © 2016年 Shenzhen_iOS_07. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APPModel : NSObject

/* APP名字 */
@property (copy, nonatomic) NSString *name;
/* APP下载量 */
@property (copy, nonatomic) NSString *download;
/* APP图标 */
@property (copy, nonatomic) NSString *icon;

@end

/*
{
    "name" : "植物大战僵尸",
    "download" : "10311万",
    "icon" : "http:\/\/p16.qhimg.com\/dr\/48_48_\/t0125e8d438ae9d2fbb.png"
},
*/
