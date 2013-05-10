//
//  SharedSettings.m
//  PrettyGirl
//
//  Created by 陈霄驰 on 13-1-23.
//  Copyright (c) 2013年 im@chenxiaochi.com. All rights reserved.
//

#import "SharedSettings.h"
@implementation SharedSettings
+ (SharedSettings *)settings {
    static SharedSettings *settings;
    @synchronized(self) {
        if(!settings) {
            settings = [[SharedSettings alloc] init];
            settings.isNetworkBusy = NO;
        }
    }
    return settings;
}
+ (BOOL)netWorkNotBusy
{
    //如果当前标记为网络正在忙碌
    if ([SharedSettings settings].isNetworkBusy) {
        UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"您发送微博速度太快了。请休息一下，等待上条微博发送完毕。" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
        [alert show];
        [alert release];
        //通知调用者不要继续
        return NO;
    } else {
        //如果当前标记为网络没有正在忙碌
        //准备开始新任务，标记为正在忙碌
        [SharedSettings settings].isNetworkBusy = YES;
    }
    //通知调用者请继续 
    return YES;
}
+ (float)pictureHeight:(UIImage *)image Width:(float)width
{
    CGSize imgsize = image.size;
    //[image release];
    if (width > imgsize.width) {
        return imgsize.height;
    } else {
        float scale = (imgsize.height / imgsize.width) * width;
        return scale;
    } //    
}
+ (void)loadSettings
{
    NSUserDefaults *setting = [NSUserDefaults standardUserDefaults];
    [SharedSettings settings].noFirstRUN = [setting boolForKey:@"isFirstRUN"];
    if ([SharedSettings settings].noFirstRUN == NO) {
        [SharedSettings resetSettings];
        [SharedSettings saveSettings];
    } else {
        [SharedSettings settings].sTime = [setting objectForKey:@"sTime"];
        [SharedSettings settings].sLP = [setting integerForKey:@"sLP"];
        [SharedSettings settings].allLP = [setting integerForKey:@"allLP"];
        [SharedSettings settings].speed = [setting integerForKey:@"speed"];
        [SharedSettings settings].alertLP = [setting integerForKey:@"alertLP"];
        [SharedSettings settings].nowLP = [setting integerForKey:@"nowLP"];
        [SharedSettings settings].running = NO;
        [SharedSettings settings].readyrunning = [setting boolForKey:@"readyrunning"];
        NSLog(@"载入进度=%d",[SharedSettings settings].readyrunning);
    }
}
+ (void)saveSettings
{
    NSUserDefaults *setting = [NSUserDefaults standardUserDefaults];
    [setting setBool:[SharedSettings settings].noFirstRUN forKey:@"isFirstRUN"];
    [setting setObject:[SharedSettings settings].sTime forKey:@"sTime"];
    [setting setInteger:[SharedSettings settings].sLP forKey:@"sLP"];
    [setting setInteger:[SharedSettings settings].allLP forKey:@"allLP"];
    [setting setInteger:[SharedSettings settings].speed forKey:@"speed"];
    [setting setInteger:[SharedSettings settings].alertLP forKey:@"alertLP"];
    [setting setInteger:[SharedSettings settings].nowLP forKey:@"nowLP"];
    [setting setBool:[SharedSettings settings].readyrunning forKey:@"readyrunning"];
    NSLog(@"保存进度=%d",[SharedSettings settings].readyrunning);
    [setting synchronize];
}
+ (void)resetSettings
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *destDateString = [dateFormatter stringFromDate:[NSDate date]];
    [dateFormatter release];
    [SharedSettings settings].sTime = destDateString;
    [SharedSettings settings].sLP = 0;
    [SharedSettings settings].allLP = 1;
    [SharedSettings settings].speed = 360;
    [SharedSettings settings].alertLP = 1;
    [SharedSettings settings].nowLP = 0;
    [SharedSettings settings].running = NO;
    [SharedSettings settings].readyrunning = NO;
}
+ (void)openGAME
{
    NSURL *gameuid = [NSURL URLWithString:@"fb119355104914816:/"];
    if ([[UIApplication sharedApplication] canOpenURL:gameuid]) {
        
    }
    
    

    [[UIApplication sharedApplication] openURL:gameuid];
}
@end
