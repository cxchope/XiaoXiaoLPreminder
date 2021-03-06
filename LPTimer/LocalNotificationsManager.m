#import "LocalNotificationsManager.h"

@implementation LocalNotificationsManager

+ (void)addLocalNotificationWithFireDate:(NSDate *)date activityId:(NSInteger)aid activityTitle:(NSString *)title {
    
    NSDate *t = [NSDate dateWithTimeIntervalSinceNow:7200.0f];      // 2*60*60 2h
    
    NSComparisonResult result = [t compare:date];
    
    if (result == -1) {
        
        UILocalNotification *notification=[[UILocalNotification alloc] init];
        
        notification.fireDate = [date dateByAddingTimeInterval:-7200.0f];
        
        notification.timeZone = [NSTimeZone defaultTimeZone];
        
        notification.applicationIconBadgeNumber = 1;
        
        notification.soundName = UILocalNotificationDefaultSoundName;
        
        notification.alertBody = [NSString stringWithFormat:@"%@ 活动马上就要开始了",title];
        
        NSDictionary *dic =
        
        [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:aid], @"activityid", nil];
        
        notification.userInfo = dic;
        
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        
        [notification release];
        
    }
    
}

+ (BOOL)removeLocalNotificationWithActivityId:(NSInteger)aid //取消提醒

{
    
    UIApplication *application = [UIApplication sharedApplication];
    
    NSArray *localNotifications = [[UIApplication sharedApplication] scheduledLocalNotifications];
    
    for (UILocalNotification *obj in localNotifications) {
        
        NSInteger activityId = [[obj.userInfo objectForKey:@"activityid"] intValue];
        
        if (aid == activityId) {
            
            [application cancelLocalNotification:obj];
            
            return YES;
            
        }
        
    }
    
    return NO;
    
}

@end