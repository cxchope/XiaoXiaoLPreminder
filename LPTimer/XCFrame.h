//
//  XCFrame.h
//  LPTimer
//
//  Created by Chen Terence on 13-5-6.
//  Copyright (c) 2013年 神楽坂雅詩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCFrame : NSObject
- (int)deviceID;
+ (CGRect)tableRect;
- (CGRect)tableRect;
- (CGRect)mainViewRects:(NSString*)objectName;
- (CGRect)mainBtnRects:(NSString*)objectName;
- (CGRect)mainBtnRectsT:(NSString*)objectName;
@end
