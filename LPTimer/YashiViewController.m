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
#import "XCAlertView.h"
#import "XCLocalNotification.h"
#import "UIView+Hierarchy.h"
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
    self.logojs = 0;
    [self initTimer];
    XCFrame *cf = [[XCFrame alloc] init];
    
    BackGroundMusicView *bgmBtn = [[BackGroundMusicView alloc] initWithFrame:[cf mainViewRects:@"bgmBtn"]];
    bgmBtn.tag = 909;
    [self.view addSubview:bgmBtn];
    [bgmBtn release];
    [cf release];
    
    UIImageView *title = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"title" ofType:@"jpg"]]];
    int xp = 0;
    if ([XCFrame deviceID] == 3) xp = 20;
    title.frame = CGRectMake(0, 0, self.view.frame.size.height+xp, self.view.frame.size.width+20);
    title.backgroundColor = [UIColor blackColor];
    title.contentMode = UIViewContentModeScaleAspectFit;
    title.tag = 901;
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:YES];
    [self.view addSubview:title];
    [title release];
}
- (void)UII
{
    self.logojs = 100;
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
    titlebarL.text = @"LP恢復計時器";
    titlebarL.font = [cf mainFont:@"titlebarL"];
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
    lpTxt.font = [cf mainFont:@"lpTxt"];
    lpTxt.backgroundColor = [UIColor clearColor];
    lpTxt.textColor = [UIColor colorWithRed:34/255.0 green:187/255.0 blue:204/255.0 alpha:1.0];
    lpTxt.tag = 105;
    [self.view addSubview:lpTxt];
    [lpTxt release];
    
    UILabel *timeInfo = [[UILabel alloc] initWithFrame:[cf mainViewRects:@"timeInfo"]];
    timeInfo.text = @"00/00   剩餘：00:00";
    timeInfo.font = [cf mainFont:@"timeInfo"];
    timeInfo.backgroundColor = [UIColor clearColor];
    timeInfo.textColor = [UIColor purpleColor];//[UIColor colorWithRed:62/255.0 green:169/255.0 blue:1.0 alpha:1.0];
    timeInfo.tag = 106;
    [self.view addSubview:timeInfo];
    [timeInfo release];
    
    XCProgressView *progress = [[XCProgressView alloc] initWithFrame:[cf mainViewRects:@"progress"]];
    progress.maxValue = 0.0;
    progress.minValue = 0.0;
    progress.nowValue = 0.0;
    progress.autoColor = YES;
    progress.animated = YES;
    //progress.progressTintColor = [UIColor blueColor];
    progress.trackTintColor = [UIColor blackColor];
    progress.tag = 107;
    [self.view addSubview:progress];
    [progress release];
    
    BackGroundMusicView *bgmBtn = (BackGroundMusicView*)[self.view viewWithTag:909];
    [bgmBtn bringToFront];
    
    NSArray *btntxts = [NSArray arrayWithObjects:@"總體狀況",@"變更參數",@"待定功能",@"開始計時",@"啟動遊戲",@"停止任務",@"關於聲明", nil];
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
        btnTxt.font = [cf mainFont:@"btnTxt"];
        btnTxt.backgroundColor = [UIColor clearColor];
        btnTxt.tag = 300 + i;
        [self.view addSubview:btnTxt];
    }
    if ([SharedSettings settings].running) {
        [self openInfo];
    } else {
        [self openAbout];
    }
    [cf release];
}
- (void)removeOldView
{
    UIView *oldTable = (UIView *)[self.view viewWithTag:888];
    if (oldTable) {
        [oldTable removeFromSuperview];
    } else {
        NSLog(@"錯誤：沒有找到需要消除的當前畫面");
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
            [self openAlt:@"這裏的功能還處於待定狀態，沒有製作。\n我還沒有想好在這裏放什麼，比如為其它遊戲計時，或者保存歷史記錄，或者顯示一些在線信息什麼的。這裏在以後的版本中添加吧。"];
            break;
        case 204:
            [self startTime];
            break;
        case 205:
            [SharedSettings openGAME];
            break;
        case 206:
            [self stopTimer:NO];
            break;
        case 207:
            [self openAbout]; [self removeOldView]; self.onBtn = btn.tag;
            break;
        default:
            break;
    }
    [self backColor];
}
- (void)openAlt:(NSString *)text
{
    XCAlertView *av = [[XCAlertView alloc] initWithText:text];
    [self.view addSubview:av];
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
    [self loadConfig];
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
- (void)loadConfig
{
    NSLog(@"继续计时=%d",[SharedSettings settings].readyrunning);
    if ([SharedSettings settings].readyrunning) {
        [self startTask];
        self.isSentLocalNot = YES;
    } else {
        self.isSentLocalNot = NO;
    }
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
        [SharedSettings settings].sTime = [self stringFromDate:[NSDate date]];
        [sett removeFromSuperview];
        [self startTask];
        [SharedSettings settings].readyrunning = YES;
        [SharedSettings saveSettings];
    } else {
        [self openAlt:@"請在“變更參數”中輸入數值後，\n再點擊開始計時按鈕。\n\n如果當前有正在計時的任務，將自動被覆蓋。"];
    }
}

- (void)startTask
{
    UIImageView *title = (UIImageView*)[self.view viewWithTag:901];
    if (!title) {
        [self removeOldView];
        [self openInfo];
    }
    self.onBtn = 201;
    XCProgressView *progress = (XCProgressView*)[self.view viewWithTag:107];
    progress.minValue = 0;
    progress.nowValue = [SharedSettings settings].nowLP;
    progress.maxValue = [SharedSettings settings].allLP;
    [SharedSettings settings].running = YES;
}
- (void)stopTimer:(BOOL)isAutoStop
{
    [XCLocalNotification deleteLocalNotification];
//    XCProgressView *progress = (XCProgressView*)[self.view viewWithTag:107];
//    progress.minValue = 0;
//    progress.maxValue = 1;
//    progress.nowValue = 1;
    [SharedSettings settings].nowLP = [SharedSettings settings].alertLPtime;
    [SharedSettings settings].alertLPtime = 0;
    [SharedSettings settings].allLPtime = 0;

    [SharedSettings settings].running = NO;
    [SharedSettings settings].readyrunning = NO;
    self.isSentLocalNot = NO;
    [SharedSettings saveSettings];
    if (isAutoStop) {
        [self openAlt:@"到達預設時間！\n計時器已自動停止。\n\n遊戲已經自動啟動，如果遊戲未能啟動，請聯繫作者更新。"];
        [SharedSettings openGAME];
    } else {
        [self openAlt:@"計時已經停止，數值不再更新。"];
        [XCLocalNotification deleteLocalNotification];
    }
    UILabel *titlebarL = (UILabel*)[self.view viewWithTag:103];
    titlebarL.text = @"LP恢復計時器：已停止 ■";
}
- (void)initTimer
{
    [NSTimer scheduledTimerWithTimeInterval:0.5 target: self selector: @selector(handleTimer:) userInfo: nil repeats: YES];
}
- (void)handleTimer:(NSTimer *)timer
{
    if (self.logojs > 99) {
        [self postTimer];
    } else {
        [self intro];
    }
}
- (void)intro
{
    if (self.logojs == 5) {
        if ([SharedSettings settings].noFirstRUN) {
            [self UII];
        } else {
            UIImageView *title = (UIImageView*)[self.view viewWithTag:901];
            [title setImage:nil];
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:YES];
            int xp = 0;
            if ([XCFrame deviceID] == 3) xp = 20;
            self.view.frame = CGRectMake(self.view.frame.origin.x+xp, self.view.frame.origin.y, self.view.frame.size.width-20, self.view.frame.size.height);
            XCProgressView *xcp = [[XCProgressView alloc] initWithFrame:CGRectMake(50, self.view.frame.size.width/2, self.view.frame.size.height-100, 10)];
            xcp.minValue = 4;
            xcp.maxValue = 10;
            xcp.nowValue = self.logojs;
            xcp.autoColor = NO;
            xcp.trackTintColor = [UIColor blackColor];
            xcp.progressTintColor = [UIColor whiteColor];
            xcp.tag = 902;
            [self.view addSubview:xcp];
            UILabel *zz = [[UILabel alloc] initWithFrame:CGRectMake(0, xcp.frame.origin.y - 28, self.view.frame.size.height, 14)];
            zz.backgroundColor = [UIColor clearColor];
            zz.textColor = [UIColor lightGrayColor];
            zz.font = [UIFont systemFontOfSize:12];
            int devID = [XCFrame deviceID];
            if (devID == 1) {
                zz.text = @"第一次運行,正在為您的 非寬屏iPhone/Touch 優化佈局……";
            } else if (devID == 2) {
                zz.text = @"第一次運行,正在為您的 寬屏iPhone/Touch 優化佈局……";
            } else if (devID == 3) {
                zz.text = @"第一次運行,正在為您的 iPad 優化佈局……";
            }
            #if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_6_0
            zz.textAlignment = UITextAlignmentCenter;
            #else
            zz.textAlignment = NSTextAlignmentCenter;
            #endif
            zz.tag = 904;
            [self.view addSubview:zz];
            [zz release];
            [xcp release];
            UIImageView *ll = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ll" ofType:@"png"]]];
            ll.frame = CGRectMake(50, self.view.frame.size.width - 100, self.view.frame.size.height - 100, 100);
            ll.backgroundColor = [UIColor clearColor];
            ll.contentMode = UIViewContentModeScaleAspectFit;
            ll.tag = 903;
            [self.view addSubview:ll];
            [ll release];
        }
    } else if (self.logojs > 5 && self.logojs <= 10) {
        XCProgressView *xcp = (XCProgressView*)[self.view viewWithTag:902];
        xcp.nowValue = self.logojs;
    }
    if (([SharedSettings settings].noFirstRUN && self.logojs >= 7) || (![SharedSettings settings].noFirstRUN && self.logojs == 10)) {
        UIImageView *title = (UIImageView*)[self.view viewWithTag:901];
        if (title) [title removeFromSuperview];
        XCProgressView *xcp = (XCProgressView*)[self.view viewWithTag:902];
        if (xcp) [xcp removeFromSuperview];
        UILabel *zz = (UILabel*)[self.view viewWithTag:904];
        if (zz) [zz removeFromSuperview];
        UIImageView *ll =  (UIImageView*)[self.view viewWithTag:903];
        if (ll) [ll removeFromSuperview];
        if (![SharedSettings settings].noFirstRUN) {
            [SharedSettings settings].noFirstRUN = YES;
            [SharedSettings saveSettings];
            [self UII];
        } else {
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:YES];
            int xp = 0;
            if ([XCFrame deviceID] == 3) xp = 20;
            self.view.frame = CGRectMake(self.view.frame.origin.x+xp, self.view.frame.origin.y, self.view.frame.size.width-20, self.view.frame.size.height);
        }
    }
    self.logojs++;
}
- (void)postTimer
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"time" object:nil];
    if ([SharedSettings settings].running) {
        NSDate *SDate = [self dateFromString:[SharedSettings settings].sTime];
        int sec = [SDate timeIntervalSinceNow];
        float aLP = sec*(-1.0)/[SharedSettings settings].speed;
        float nowLP = [SharedSettings settings].sLP + aLP;
        [SharedSettings settings].nowLP = nowLP; //-1
        [SharedSettings settings].alertLPtime = ([SharedSettings settings].alertLP - nowLP) * [SharedSettings settings].speed;
        [SharedSettings settings].allLPtime = ([SharedSettings settings].allLP - nowLP) * [SharedSettings settings].speed;
        if ([SharedSettings settings].nowLP >= [SharedSettings settings].alertLPtime) {
            [self stopTimer:YES];
        } else {
            int nextLP = [SharedSettings settings].allLPtime%[SharedSettings settings].speed;
            UILabel *timeInfo = (UILabel*)[self.view viewWithTag:106];
            timeInfo.text = [NSString stringWithFormat:@"%d/%d  剩餘：%02d:%02d",[SharedSettings settings].nowLP,[SharedSettings settings].allLP,nextLP/60,nextLP-nextLP/60*60];
            XCProgressView *progress = (XCProgressView*)[self.view viewWithTag:107];
            progress.minValue = 0;
            progress.maxValue = [SharedSettings settings].allLP;
            progress.nowValue = [SharedSettings settings].nowLP*1.0;
            if (!self.isSentLocalNot) {
                NSDate *newalt = [[NSDate new] dateByAddingTimeInterval:[SharedSettings settings].alertLPtime];
                [XCLocalNotification startLocalNotification:@"LP值恢復提醒！查看此消息可以直接進入遊戲~" Date:newalt];
                self.isSentLocalNot = YES;
                [self openAlt:[NSString stringWithFormat:@"新的計時任務已經啓動。\n到達你設定的時間後，\n將通過通知中心提醒你。\n可以 系統設置-通知 修改提醒方式。\n計時中可以將本程序最小化。\n將在%@發出提醒。",[self stringFromDate:newalt]]];
            }
            UILabel *titlebarL = (UILabel*)[self.view viewWithTag:103];
            if (self.runnshow) {
                titlebarL.text = @"LP恢復計時器：正在運行 ◈";
            } else {
                titlebarL.text = @"LP恢復計時器：正在運行";
            }
            self.runnshow = !self.runnshow;
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
