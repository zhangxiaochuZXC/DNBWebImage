//
//  ViewController.m
//  SZDNBWebImage
//
//  Created by Shenzhen_iOS_07 on 16/10/23.
//  Copyright © 2016年 Shenzhen_iOS_07. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "YYModel.h"
#import "APPModel.h"
#import "DownloaderOperationManager.h"
#import "UIImageView+web.h"

@interface ViewController ()

/* 模型数组 */
@property (strong, nonatomic) NSArray *appList;
// 展示图片
@property (weak, nonatomic) IBOutlet UIImageView *iconImgView;
/* 记录上次图片地址 */
@property (copy, nonatomic) NSString *lastURLStr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1.先加载json数据
    [self loadJSONData];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 1.生成随机数
    int random = arc4random_uniform((u_int32_t)self.appList.count);
    // 2.随机获取模型对象
    APPModel *app = self.appList[random];
    
    // 3.DNBWebImage框架接管下载
    [self.iconImgView DNB_setImageWithURLStr:app.icon];
}

#pragma mark-获取json数据的主方法
/*
 测试框架是否可行,当获取到appList数据之后,再点击屏幕,实现图片的下载和展示
 */
- (void)loadJSONData
{
    // 1.创建网络请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 2.使用网络请求管理者,发送网络请求获取json数据;
    // GET方法默认是在子线程异步执行的,当AFN获取到网络数据之后,success回调是自动的默认在主线程执行的
    [manager GET:@"https://raw.githubusercontent.com/zhangxiaochuZXC/SZiOS07_FerverFile/master/apps.json" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // responseObject就是字典数组 (AFN自动实现字典转模型)
        NSArray *dictArr = responseObject;
        // 实现字典转模型 : 字典数组转模型数组
        self.appList = [NSArray yy_modelArrayWithClass:[APPModel class] json:dictArr];
        NSLog(@"%@",self.appList);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
