//
//  XCFrame.m
//  LPTimer
//
//  Created by Chen Terence on 13-5-6.
//  Copyright (c) 2013年 神楽坂雅詩. All rights reserved.
//

#import "XCFrame.h"
#import "UIDevice+Resolutions.h"
@implementation XCFrame
- (int)deviceID
{
    UIDeviceResolution dr =[UIDevice currentResolution];
    if (dr == UIDevice_iPhoneStandardRes || dr == UIDevice_iPhoneHiRes) {
        //iphone
        return 1;
    } else if (dr == UIDevice_iPhoneTallerHiRes) {
        //iphone5
        return 2;
    } else if (dr == UIDevice_iPadStandardRes || dr == UIDevice_iPadHiRes) {
        //ipad
        return 3;
    }
    NSLog(@"設備判斷錯誤！程序退出。");
    exit(0);
    return 0;
}
+ (CGRect)tableRect
{
    XCFrame *cxf = [[XCFrame alloc] init];
    CGRect r = [cxf tableRect];
    [cxf release];
    return r;
}
- (CGRect)tableRect
{
    int devID = [self deviceID];
    if (devID == 1) {
        return CGRectMake(18, 49, 447, 193);
    }
    NSLog(@"位置信息錯誤~！");
    return CGRectMake(0, 0, 0, 0);
}
- (CGRect)mainViewRects:(NSString*)objectName
{
    int devID = [self deviceID];
    if (devID == 1) {
        if ([objectName isEqualToString:@"bgYuan"]) {
            return CGRectMake(-99, -100, 500, 500);
        } else if ([objectName isEqualToString:@"titlebarIV"]) {
            return CGRectMake(-8, 0, 260, 24);
        } else if ([objectName isEqualToString:@"titlebarL"]) {
            return CGRectMake(10, 1, 212, 21);
        } else if ([objectName isEqualToString:@"youshang"]) {
            return CGRectMake(260, 0, 225, 38);
        } else if ([objectName isEqualToString:@"lpTxt"]) {
            return CGRectMake(307, 0, 42, 21);
        } else if ([objectName isEqualToString:@"timeInfo"]) {
            return CGRectMake(307, 18, 153, 21);
        } else if ([objectName isEqualToString:@"progress"]) {
            return CGRectMake(341, 6, 126, 9);
        } else if ([objectName isEqualToString:@"bgmBtn"]) {
            return CGRectMake(267, 5, 30, 30);
        }
    }
    NSLog(@"位置信息錯誤~！");
    return CGRectMake(0, 0, 0, 0);
}
- (CGRect)mainBtnRects:(NSString*)objectName
{
    int devID = [self deviceID];
    if (devID == 1) {
        if ([objectName isEqualToString:@"btn1"]) {
            return CGRectMake(0, 250, 77, 50);
        } else if ([objectName isEqualToString:@"btn2"]) {
            return CGRectMake(60, 250, 78, 50);
        } else if ([objectName isEqualToString:@"btn3"]) {
            return CGRectMake(122, 250, 77, 50);
        } else if ([objectName isEqualToString:@"btn4"]) {
            return CGRectMake(186, 250, 108, 50);
        } else if ([objectName isEqualToString:@"btn5"]) {
            return CGRectMake(277, 250, 79, 50);
        } else if ([objectName isEqualToString:@"btn6"]) {
            return CGRectMake(341, 250, 77, 50);
        } else if ([objectName isEqualToString:@"btn7"]) {
            return CGRectMake(402, 250, 78, 50);
        }
    }
    NSLog(@"位置信息錯誤~！");
    return CGRectMake(0, 0, 0, 0);
}
- (CGRect)mainBtnRectsT:(NSString*)objectName
{
    int devID = [self deviceID];
    if (devID == 1) {
        if ([objectName isEqualToString:@"btn1"]) {
            return CGRectMake(10, 283, 51, 17);
        } else if ([objectName isEqualToString:@"btn2"]) {
            return CGRectMake(74, 283, 51, 17);
        } else if ([objectName isEqualToString:@"btn3"]) {
            return CGRectMake(135, 283, 51, 17);
        } else if ([objectName isEqualToString:@"btn4"]) {
            return CGRectMake(215, 283, 51, 17);
        } else if ([objectName isEqualToString:@"btn5"]) {
            return CGRectMake(291, 283, 51, 17);
        } else if ([objectName isEqualToString:@"btn6"]) {
            return CGRectMake(354, 283, 51, 17);
        } else if ([objectName isEqualToString:@"btn7"]) {
            return CGRectMake(416, 283, 51, 17);
        }
    }
    NSLog(@"位置信息錯誤~！");
    return CGRectMake(0, 0, 0, 0);
}
@end