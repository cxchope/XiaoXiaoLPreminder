//
//  XCLocalNotification.h
//  LPTimer
//
//  Created by 彩虹の旅途 on 13-5-5.
//  Copyright (c) 2013年 神楽坂雅詩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCLocalNotification : NSObject

//本地通知和计时器
+ (void)startLocalNotification:(NSString*)text TimeInterval:(int)period;
+ (void)startLocalNotification:(NSString*)text Date:(NSDate*)Date;
+ (void)deleteLocalNotification;

@end
