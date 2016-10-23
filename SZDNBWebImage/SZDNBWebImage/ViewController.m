//
//  ViewController.m
//  SZDNBWebImage
//
//  Created by Shenzhen_iOS_07 on 16/10/23.
//  Copyright © 2016年 Shenzhen_iOS_07. All rights reserved.
//

#import "ViewController.h"
#import "DownloaderOperation.h"
#import "AFNetworking.h"
#import "YYModel.h"
#import "APPModel.h"

@interface ViewController ()

/* 队列 */
@property (strong, nonatomic) NSOperationQueue *queue;
/* 模型数组 */
@property (strong, nonatomic) NSArray *appList;
@property (weak, nonatomic) IBOutlet UIImageView *iconImgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.创建队列
    self.queue = [[NSOperationQueue alloc] init];
    
    // 2.先加载json数据
    [self loadJSONData];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 1.生成随机数
    int random = arc4random_uniform((u_int32_t)self.appList.count);
    // 2.随机获取模型对象
    APPModel *app = self.appList[random];
    
    // 3.使用自定义的NSOperation实现图片的随机下载
    // 下载完成回调
    void(^successBlock)() = ^(UIImage *image){
        // 刷新UI
        self.iconImgView.image = image;
    };
    
    // 4.创建自定义操作
    DownloaderOperation *op = [DownloaderOperation downloadWithURLStr:app.icon successBlock:successBlock];
    
    // 5.把自定义操作添加到队列
    [self.queue addOperation:op];
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
