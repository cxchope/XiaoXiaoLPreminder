#import <Foundation/Foundation.h>

@interface LocalNotificationsManager : NSObject

+ (void)addLocalNotificationWithFireDate:(NSDate *)date activityId:(NSInteger)aid activityTitle:(NSString *)title;



+ (BOOL)removeLocalNotificationWithActivityId:(NSInteger)aid;

@end