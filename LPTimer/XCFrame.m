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
+ (int)deviceID
{
    XCFrame *cf = [[XCFrame alloc] init];
    int did = [cf deviceID];
    [cf release];
    return did;
}
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
    if (devID == 1) { //iphone
        return CGRectMake(18, 49, 447, 193);
    } else if (devID == 2) { //iphone5
        return CGRectMake(18, 49, 535, 193);
    } else if (devID == 3) { //ipad
        return CGRectMake(20, 91, 988, 559);
    }
    NSLog(@"位置信息錯誤~！");
    return CGRectMake(0, 0, 0, 0);
}
- (CGRect)mainViewRects:(NSString*)objectName
{
    int devID = [self deviceID];
    if (devID == 1) { //iphone
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
            return CGRectMake(307, 18, 173, 21);
        } else if ([objectName isEqualToString:@"progress"]) {
            return CGRectMake(341, 6, 126, 9);
        } else if ([objectName isEqualToString:@"bgmBtn"]) {
            return CGRectMake(267, 5, 30, 30);
        }
    } else if (devID == 2) { //iphone5
        if ([objectName isEqualToString:@"bgYuan"]) {
            return CGRectMake(-99, -100, 500, 500);
        } else if ([objectName isEqualToString:@"titlebarIV"]) {
            return CGRectMake(-8, 0, 260, 24);
        } else if ([objectName isEqualToString:@"titlebarL"]) {
            return CGRectMake(10, 1, 212, 21);
        } else if ([objectName isEqualToString:@"youshang"]) {
            return CGRectMake(348, 0, 225, 38);
        } else if ([objectName isEqualToString:@"lpTxt"]) {
            return CGRectMake(395, 0, 42, 21);
        } else if ([objectName isEqualToString:@"timeInfo"]) {
            return CGRectMake(395, 18, 173, 21);
        } else if ([objectName isEqualToString:@"progress"]) {
            return CGRectMake(429, 6, 126, 9);
        } else if ([objectName isEqualToString:@"bgmBtn"]) {
            return CGRectMake(355, 5, 30, 30);
        }
    } else if (devID == 3) { //ipad
        if ([objectName isEqualToString:@"bgYuan"]) {
            return CGRectMake(-232, -218, 1184, 1184);
        } else if ([objectName isEqualToString:@"titlebarIV"]) {
            return CGRectMake(-11, 0, 519, 48);
        } else if ([objectName isEqualToString:@"titlebarL"]) {
            return CGRectMake(20, 14, 398, 21);
        } else if ([objectName isEqualToString:@"youshang"]) {
            return CGRectMake(539, 0, 491, 83);
        } else if ([objectName isEqualToString:@"lpTxt"]) {
            return CGRectMake(638, 8, 40, 33);
        } else if ([objectName isEqualToString:@"timeInfo"]) {
            return CGRectMake(638, 51, 376, 28);
        } else if ([objectName isEqualToString:@"progress"]) {
            return CGRectMake(686, 20, 318, 9);
        } else if ([objectName isEqualToString:@"bgmBtn"]) {
            return CGRectMake(555, 13, 60, 59);
        }
    }
    NSLog(@"位置信息錯誤~！");
    return CGRectMake(0, 0, 0, 0);
}
- (CGRect)mainBtnRects:(NSString*)objectName
{
    int devID = [self deviceID];
    if (devID == 1) { //iphone
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
    } else if (devID == 2) { //iphone5
        if ([objectName isEqualToString:@"btn1"]) {
            return CGRectMake(0, 250, 77, 50);
        } else if ([objectName isEqualToString:@"btn2"]) {
            return CGRectMake(76, 250, 78, 50);
        } else if ([objectName isEqualToString:@"btn3"]) {
            return CGRectMake(152, 250, 77, 50);
        } else if ([objectName isEqualToString:@"btn4"]) {
            return CGRectMake(229, 250, 108, 50);
        } else if ([objectName isEqualToString:@"btn5"]) {
            return CGRectMake(336, 250, 79, 50);
        } else if ([objectName isEqualToString:@"btn6"]) {
            return CGRectMake(414, 250, 77, 50);
        } else if ([objectName isEqualToString:@"btn7"]) {
            return CGRectMake(490, 250, 78, 50);
        }
    } else if (devID == 3) { //ipad
        if ([objectName isEqualToString:@"btn1"]) {
            return CGRectMake(0, 658, 141, 90);
        } else if ([objectName isEqualToString:@"btn2"]) {
            return CGRectMake(139, 658, 140, 90);
        } else if ([objectName isEqualToString:@"btn3"]) {
            return CGRectMake(277, 658, 141, 90);
        } else if ([objectName isEqualToString:@"btn4"]) {
            return CGRectMake(414, 658, 199, 90);
        } else if ([objectName isEqualToString:@"btn5"]) {
            return CGRectMake(609, 658, 140, 90);
        } else if ([objectName isEqualToString:@"btn6"]) {
            return CGRectMake(748, 658, 139, 90);
        } else if ([objectName isEqualToString:@"btn7"]) {
            return CGRectMake(885, 658, 139, 90);
        }
    }
    NSLog(@"位置信息錯誤~！");
    return CGRectMake(0, 0, 0, 0);
}
- (CGRect)mainBtnRectsT:(NSString*)objectName
{
    int devID = [self deviceID];
    if (devID == 1) { //iphone
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
    } else if (devID == 2) { //iphone5
        if ([objectName isEqualToString:@"btn1"]) {
            return CGRectMake(14, 283, 51, 17);
        } else if ([objectName isEqualToString:@"btn2"]) {
            return CGRectMake(92, 283, 51, 17);
        } else if ([objectName isEqualToString:@"btn3"]) {
            return CGRectMake(167, 283, 51, 17);
        } else if ([objectName isEqualToString:@"btn4"]) {
            return CGRectMake(261, 283, 51, 17);
        } else if ([objectName isEqualToString:@"btn5"]) {
            return CGRectMake(352, 283, 51, 17);
        } else if ([objectName isEqualToString:@"btn6"]) {
            return CGRectMake(429, 283, 51, 17);
        } else if ([objectName isEqualToString:@"btn7"]) {
            return CGRectMake(506, 283, 51, 17);
        }
    } else if (devID == 3) { //ipad
        if ([objectName isEqualToString:@"btn1"]) {
            return CGRectMake(32, 726, 82, 17);
        } else if ([objectName isEqualToString:@"btn2"]) {
            return CGRectMake(172, 726, 77, 17);
        } else if ([objectName isEqualToString:@"btn3"]) {
            return CGRectMake(311, 726, 76, 17);
        } else if ([objectName isEqualToString:@"btn4"]) {
            return CGRectMake(477, 726, 77, 17);
        } else if ([objectName isEqualToString:@"btn5"]) {
            return CGRectMake(643, 726, 76, 17);
        } else if ([objectName isEqualToString:@"btn6"]) {
            return CGRectMake(781, 726, 76, 17);
        } else if ([objectName isEqualToString:@"btn7"]) {
            return CGRectMake(918, 726, 76, 17);
        }
    }
    NSLog(@"位置信息錯誤~！");
    return CGRectMake(0, 0, 0, 0);
}
- (UIFont*)mainFont:(NSString*)objectName
{
    int devID = [self deviceID];
    if (devID < 3) { //iphone & iphone5
        if ([objectName isEqualToString:@"titlebarL"]) {
            return [UIFont systemFontOfSize:15];
        } else if ([objectName isEqualToString:@"lpTxt"]) {
            return [UIFont systemFontOfSize:17];
        } else if ([objectName isEqualToString:@"timeInfo"]) {
            return [UIFont systemFontOfSize:17];
        } else if ([objectName isEqualToString:@"btnTxt"]) {
            return [UIFont systemFontOfSize:12];
        }
    } else if (devID == 3) { //ipad
        if ([objectName isEqualToString:@"titlebarL"]) {
            return [UIFont systemFontOfSize:20];
        } else if ([objectName isEqualToString:@"lpTxt"]) {
            return [UIFont systemFontOfSize:30];
        } else if ([objectName isEqualToString:@"timeInfo"]) {
            return [UIFont systemFontOfSize:26];
        } else if ([objectName isEqualToString:@"btnTxt"]) {
            return [UIFont systemFontOfSize:18];
        }
    }
    NSLog(@"字体信息錯誤~！");
    return [UIFont systemFontOfSize:1];
}
+ (UIFont*)tableFont:(int)objectId
{
    int devID = [XCFrame deviceID];
    if (devID < 3) { //iphone & iphone5
        if (objectId == 1) {
            return [UIFont systemFontOfSize:15];
        } else if (objectId == 2) {
            return [UIFont systemFontOfSize:10];
        }
    } else  if (devID == 3) { //ipad
        if (objectId == 1) {
            return [UIFont systemFontOfSize:25];
        } else if (objectId == 2) {
            return [UIFont systemFontOfSize:20];
        }
        
    }
    NSLog(@"字体信息錯誤~！");
    return [UIFont systemFontOfSize:1];
}
+ (CGFloat)cellHeight
{
    int devID = [XCFrame deviceID];
    if (devID < 3) { //iphone & iphone5
        return 25;
    } else if (devID == 3) { //ipad
        return 45;
    }
    NSLog(@"行高信息錯誤~！");
    return 1;
}
@end