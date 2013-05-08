//
//  YashiViewController.m
//  LPTimer
//
//  Created by Chen Terence on 13-5-6.
//  Copyright (c) 2013年 神楽坂雅詩. All rights reserved.
//

#import "YashiViewController.h"
#import "XCFrame.h"
#import "XCProgressView.h"
#import "BGQuan.h"
#import "AboutTV.h"
#import "InfoTV.h"
#import "BackGroundMusicView.h"
#import "settTV.h"
@interface YashiViewController ()

@end

@implementation YashiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //[self UI];
    }
    return self;
}
- (void)UI
{
    XCFrame *cf = [[XCFrame alloc] init];
    [self backColor];
    
    BGQuan *bgYuan = [[BGQuan alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"yuan" ofType:@"png"]]];
    bgYuan.frame = [cf mainViewRects:@"bgYuan"];
    bgYuan.tag = 101;
    [self.view addSubview:bgYuan];
    [bgYuan startAni:0.7];
    [bgYuan release];
    
    UIImageView *titlebarIV = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"titlebar" ofType:@"png"]]];
    titlebarIV.frame = [cf mainViewRects:@"titlebarIV"];
    titlebarIV.alpha = 0.7;
    titlebarIV.tag = 102;
    [self.view addSubview:titlebarIV];
    [titlebarIV release];
    
    UILabel *titlebarL = [[UILabel alloc] initWithFrame:[cf mainViewRects:@"titlebarL"]];
    titlebarL.text = @"LP恢復計時器：默認設備";
    titlebarL.font = [UIFont systemFontOfSize:15];
    titlebarL.backgroundColor = [UIColor clearColor];
    titlebarL.tag = 103;
    [self.view addSubview:titlebarL];
    [titlebarL release];
    
    UIImageView *youshang = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"rank" ofType:@"png"]]];
    youshang.frame = [cf mainViewRects:@"youshang"];
    youshang.tag = 104;
    [self.view addSubview:youshang];
    [youshang release];
    
    UILabel *lpTxt = [[UILabel alloc] initWithFrame:[cf mainViewRects:@"lpTxt"]];
    lpTxt.text = @"LP";
    lpTxt.font = [UIFont systemFontOfSize:17];
    lpTxt.backgroundColor = [UIColor clearColor];
    lpTxt.textColor = [UIColor colorWithRed:34/255.0 green:187/255.0 blue:204/255.0 alpha:1.0];
    lpTxt.tag = 105;
    [self.view addSubview:lpTxt];
    [lpTxt release];
    
    UILabel *timeInfo = [[UILabel alloc] initWithFrame:[cf mainViewRects:@"timeInfo"]];
    timeInfo.text = @"00/00   剩余：00:00";
    timeInfo.font = [UIFont systemFontOfSize:17];
    timeInfo.backgroundColor = [UIColor clearColor];
    timeInfo.textColor = [UIColor colorWithRed:62/255.0 green:169/255.0 blue:1.0 alpha:1.0];
    timeInfo.tag = 106;
    [self.view addSubview:timeInfo];
    [timeInfo release];
    
    XCProgressView *progress = [[XCProgressView alloc] initWithFrame:[cf mainViewRects:@"progress"]];
    progress.maxValue = 100.0;
    progress.minValue = 0.0;
    progress.autoColor = YES;
    progress.animated = YES;
    progress.nowValue = 40.0;
    //progress.progressTintColor = [UIColor blueColor];
    progress.trackTintColor = [UIColor blackColor];
    progress.tag = 107;
    [self.view addSubview:progress];
    [progress release];
    
    BackGroundMusicView *bgmBtn = [[BackGroundMusicView alloc] initWithFrame:[cf mainViewRects:@"bgmBtn"]];
    [self.view addSubview:bgmBtn];
    [bgmBtn release];
    
    NSArray *btntxts = [NSArray arrayWithObjects:@"總體狀況",@"變更參數",@"操作記錄",@"開始計時",@"啟動遊戲",@"停止任務",@"關於聲明", nil];
    for (int i = 1; i < btntxts.count+1; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = [cf mainBtnRects:[NSString stringWithFormat:@"btn%d",i]];
        [button setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"button%d",i] ofType:@"png"]] forState:UIControlStateNormal];
        button.alpha = 0.9;
        button.tag = 200 + i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
        UILabel *btnTxt = [[UILabel alloc] initWithFrame:[cf mainBtnRectsT:[NSString stringWithFormat:@"btn%d",i]]];
        btnTxt.text = [btntxts objectAtIndex:i-1];
        btnTxt.font = [UIFont systemFontOfSize:12];
        btnTxt.backgroundColor = [UIColor clearColor];
        btnTxt.tag = 300 + i;
        [self.view addSubview:btnTxt];
    }
    [self openAbout];
    [cf release];
    [self initTimer];
}
- (void)removeOldView
{
    UIView *oldTable = (UIView *)[self.view viewWithTag:888];
    if (oldTable) {
        [oldTable removeFromSuperview];
    } else {
        NSLog(@"错误：没有找到需要消除的当前画面");
    }
}
- (void)buttonClick:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case 201:
            [self openInfo]; [self removeOldView]; self.onBtn = btn.tag;
            break;
        case 202:
            [self openSett]; [self removeOldView]; self.onBtn = btn.tag;
            break;
        case 203:
            
            break;
        case 204:
            [self startTime];
            break;
        case 205:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"jp.klab.lovelive:"]];
            break;
        case 206:
            
            break;
        case 207:
            [self openAbout]; [self removeOldView]; self.onBtn = btn.tag;
            break;
        default:
            break;
    }
    [self backColor];
}
- (void)backColor
{
    NSArray *colors = [NSArray arrayWithObjects:[UIColor purpleColor],[UIColor orangeColor],[UIColor greenColor],[UIColor grayColor],[UIColor redColor], nil];
    int selectColor = 0;
    for (int i = 0; i < 10; i++) {
        selectColor = arc4random() % colors.count;
        UIColor *select = [colors objectAtIndex:selectColor];
        if (self.view.backgroundColor != select) {
            self.view.backgroundColor = select;
            break;
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self UI];
}
- (void)openAbout
{
    AboutTV *tv = [[AboutTV alloc] initWithFrame:[XCFrame tableRect]];
    tv.tag = 888;
    [self.view addSubview:tv];
    [tv release];
}
- (void)openInfo
{
    InfoTV *tv = [[InfoTV alloc] initWithFrame:[XCFrame tableRect]];
    tv.tag = 888;
    [self.view addSubview:tv];
    [tv release];
}
- (void)openSett
{
    settTV *tv = [[settTV alloc] initWithFrame:[XCFrame tableRect]];
    tv.tag = 888;
    [self.view addSubview:tv];
    [tv release];
}
- (void)startTime
{
    if (self.onBtn == 202) {
        settTV *sett = (settTV *)[self.view viewWithTag:888];
        [SharedSettings settings].allLP = sett.allLP;
        [SharedSettings settings].nowLP = sett.nowLP;
        [SharedSettings settings].sLP = sett.nowLP;
        [SharedSettings settings].alertLP = sett.alertLP;
        [SharedSettings settings].speed = sett.speed;
        [SharedSettings settings].running = YES;
        [SharedSettings settings].sTime = [self stringFromDate:[NSDate date]];
        [sett removeFromSuperview];
        [self openInfo];
        self.onBtn = 201;
    }
}
- (void)initTimer
{
    [NSTimer scheduledTimerWithTimeInterval:0.5 target: self selector: @selector(handleTimer:) userInfo: nil repeats: YES];
}
- (void)handleTimer:(NSTimer *)timer
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"time" object:nil];
    if ([SharedSettings settings].running) {
        NSDate *SDate = [self dateFromString:[SharedSettings settings].sTime];
        int sec = [SDate timeIntervalSinceNow];
        NSLog(@"sec=%d",sec);
        if (sec > 0) {
            [SharedSettings settings].running = NO;//提醒錯誤
        } else {
            //當前LP＝起始LP＋超過的時間÷每LP速度
            [SharedSettings settings].nowLP = [SharedSettings settings].sLP+(sec*(-1))/[SharedSettings settings].speed;
            
            NSLog(@"[SharedSettings settings].nowLP=%d",[SharedSettings settings].speed);
            //警報剩餘時間＝（提醒LP﹣當前LP）＊每秒速度
            [SharedSettings settings].alertLPtime = ([SharedSettings settings].alertLP - (sec*(-1.0))/[SharedSettings settings].speed) * [SharedSettings settings].speed;
            //總剩餘時間＝（總LP﹣當前LP）＊每秒速度
            [SharedSettings settings].allLPtime = ([SharedSettings settings].allLP - (sec*(-1.0))/[SharedSettings settings].speed) * [SharedSettings settings].speed;
        }
    }
}
- (NSDate *)dateFromString:(NSString *)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    [dateFormatter release];
    return destDate;
}
- (NSString *)stringFromDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    [dateFormatter release];
    return destDateString;
}
- (void)addLocalNotificationWithText:(NSString*)text Time:(int)time
{
    NSLog(@"qq=%@",[NSDate dateWithTimeIntervalSinceNow:100000]);
}
- (void)delLocalNotification
{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
