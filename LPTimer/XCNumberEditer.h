//
//  XCNumberEditer.h
//  LPTimer
//
//  Created by Chen Terence on 13-5-7.
//  Copyright (c) 2013年 神楽坂雅詩. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol XCNumberEditerDelegate <NSObject>
- (void)xcNumberEditerReturnNumber:(int)num isOK:(BOOL)isok Mode:(NSString*)modestr;
@end

@interface XCNumberEditer : UIView
{
    int _max;
    int _min;
    int _now;
    NSString *_modeStr;
}

- (id)initWithFrame:(CGRect)frame MaxValue:(int)max MinValue:(int)min NowValue:(int)now Mode:(NSString*)modestr;
@property (nonatomic, retain) NSString *modeStr;
@property (nonatomic, assign) id<XCNumberEditerDelegate> delegate;
@property (nonatomic, assign) int max;
@property (nonatomic, assign) int min;
@property (nonatomic, assign) int now;
@end
