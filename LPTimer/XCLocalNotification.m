//
//  XCLocalNotification.m
//  LPTimer
//
//  Created by 彩虹の旅途 on 13-5-5.
//  Copyright (c) 2013年 神楽坂雅詩. All rights reserved.
//

#import "XCLocalNotification.h"

@implementation XCLocalNotification
+ (void)startLocalNotification:(NSString*)text TimeInterval:(int)period
{
    UILocalNotification *notification=[[UILocalNotification alloc] init];
    if (notification!=nil)
    {
        NSDate *now=[NSDate new];
        //notification.fireDate=[now addTimeInterval:period];
        notification.fireDate = [now dateByAddingTimeInterval:period];
        notification.timeZone=[NSTimeZone defaultTimeZone];
        //        notification.soundName = @"ping.caf";
        //notification.alertBody=@"TIME！";
        notification.alertBody = text;
        //NSDictionary* info = [NSDictionary dictionaryWithObject:uniqueCodeStr forKey:CODE];
        //notification.userInfo = info;
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        notification.applicationIconBadgeNumber = 2;
        [notification release];
    }
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:1];
}
+ (void)startLocalNotification:(NSString*)text Date:(NSDate*)Date
{
    UILocalNotification *notification=[[UILocalNotification alloc] init];
    if (notification!=nil)
    {
        notification.fireDate = Date;
        notification.timeZone=[NSTimeZone defaultTimeZone];
        notification.alertBody = text;
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        notification.applicationIconBadgeNumber = 2;
        [notification release];
    }
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:1];
}
+ (void)deleteLocalNotification
{
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}
@end
