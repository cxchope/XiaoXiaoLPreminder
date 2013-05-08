//
//  SharedSettings.h
//  PrettyGirl
//
//  Created by 陈霄驰 on 13-1-23.
//  Copyright (c) 2013年 im@chenxiaochi.com. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface SharedSettings : NSObject //单例类

#pragma mark - 全局方法
//全局变量访问对象
+ (SharedSettings *)settings;
//載入設置
+ (void)loadSettings;
//保存设置
+ (void)saveSettings;
//初始化設置
+ (void)resetSettings;
//检查是否还有正在进行微博类网络通信的任务，YES=可以继续，NO=不要继续
+ (BOOL)netWorkNotBusy;
//限制图片宽度，计算高度
+ (float)pictureHeight:(UIImage *)image Width:(float)width;

#pragma mark - 全局变量
//是否还有正在进行微博类网络通信的任务
@property (nonatomic, assign) BOOL isNetworkBusy;
//第一次運行
@property (nonatomic, assign) BOOL noFirstRUN;
@property (nonatomic, assign) BOOL running;
//开始时间
@property (nonatomic, retain) NSString *sTime;
@property (nonatomic, assign) int sLP;
//LP总量
@property (nonatomic, assign) int allLP;
@property (nonatomic, assign) int speed;
@property (nonatomic, assign) int alertLP;
@property (nonatomic, assign) int nowLP;
//臨時
@property (nonatomic, assign) int alertLPtime;
@property (nonatomic, assign) int allLPtime;
@end
