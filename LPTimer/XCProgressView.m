//
//  XCProgressView.m
//  LPTimer
//
//  Created by Chen Terence on 13-5-6.
//  Copyright (c) 2013年 神楽坂雅詩. All rights reserved.
//

#import "XCProgressView.h"

@implementation XCProgressView
@synthesize nowValue = _nowValue, maxValue = _maxValue, minValue = _minValue, animated = _animated, autoColor = _autoColor;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.nowValue = 0.5;
        self.minValue = 0.0;
        self.maxValue = 1.0;
        self.animated = YES;
        self.autoColor = YES;
    }
    return self;
}

- (float)calcValue:(float)nowValue
{
//    float now = 1-(self.maxValue-self.minValue)*0.001)*nowValue;
    float now = (nowValue-self.minValue)/(self.maxValue-self.minValue);
    return now;
}
- (void)setNowValue:(float)nowValue
{
    if (nowValue > _maxValue) {
        NSLog(@"XCProgress:%f超出最大值范围，当前值变更为%f",nowValue,_maxValue);
        nowValue = _maxValue;
    }
    if (nowValue < _minValue) {
        NSLog(@"XCProgress:%f低于最小值范围，当前值变更为%f",nowValue,_minValue);
        nowValue = _minValue;
    }
    float newVol = [self calcValue:nowValue];
    [self toProgress:newVol];
    _nowValue = nowValue;
}
- (void)setMaxValue:(float)maxValue
{
    float max = [self calcValue:maxValue];
    if (self.progress > max) {
        NSLog(@"XCProgress:最大值小于当前值%f，当前值变更为%f",_nowValue,maxValue);
        [self toProgress:max];
        _nowValue = maxValue;
    }
    _maxValue = maxValue;
}
- (void)setMinValue:(float)minValue
{
    float min = [self calcValue:minValue];
    if (self.progress < min) {
        NSLog(@"XCProgress:最小值大于当前值%f，当前值变更为%f",_nowValue,minValue);
        [self toProgress:min];
        _nowValue = minValue;
    }
    _minValue = minValue;
}
- (void)toProgress:(float)value
{
    if (self.autoColor) {
        float unit = 1.0/3;
        if (value > unit*2) {
            if (self.progressTintColor != [UIColor blueColor])
            self.progressTintColor = [UIColor blueColor];
        } else if (value > unit*1) {
            if (self.progressTintColor != [UIColor yellowColor])
            self.progressTintColor = [UIColor yellowColor];
        } else if (value > unit*0) {
            if (self.progressTintColor != [UIColor redColor])
            self.progressTintColor = [UIColor redColor];
        }
    }
    [self setProgress:value animated:self.animated];
}

- (void)dealloc
{
    [super dealloc];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
