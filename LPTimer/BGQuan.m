//
//  BGQuan.m
//  LPTimer
//
//  Created by Chen Terence on 13-5-6.
//  Copyright (c) 2013年 神楽坂雅詩. All rights reserved.
//

#import "BGQuan.h"

@implementation BGQuan
@synthesize ani = _ani;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
- (void)startAni:(float)speed
{
    CGAffineTransform endAngle = CGAffineTransformMakeRotation(_ani * (M_PI / 180.0f));
    [UIView animateWithDuration:speed delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.transform = endAngle;
    } completion:^(BOOL finished) {
        if (_ani < INT32_MAX) {
            _ani += 10;
            [self startAni:speed];
        }
    }];
}
//-(void)endAnimation
//{
//    ani += 10;
//    [self startAni];
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
