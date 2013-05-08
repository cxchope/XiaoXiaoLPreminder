//
//  XCNumberEditer.m
//  LPTimer
//
//  Created by Chen Terence on 13-5-7.
//  Copyright (c) 2013年 神楽坂雅詩. All rights reserved.
//

#import "XCNumberEditer.h"
#import <QuartzCore/QuartzCore.h>
@implementation XCNumberEditer
@synthesize max = _max, min = _min, now = _now, modeStr = _modeStr;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame MaxValue:(int)max MinValue:(int)min NowValue:(int)now Mode:(NSString*)modestr;
{
    self = [super initWithFrame:frame];
    if (self) {
        if (max > INT32_MAX) {
            max = INT32_MAX;
        }
        if (min < 0) {
            min = 0;
        }
        self.max = max;
        self.min = min;
        self.now = now;
        self.modeStr = modestr;
        self.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = NO;
        self.layer.shadowOpacity = 1;
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowRadius = 5;
        self.layer.shadowOffset = CGSizeMake(0, 0);
        self.layer.shadowPath = [[UIBezierPath bezierPathWithRect:[self bounds]] CGPath];
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 190, 22)];
        title.backgroundColor = [UIColor lightGrayColor];
        title.textColor = [UIColor blackColor];
        title.text = [NSString stringWithFormat:@"輸入範圍:%d-%d",min,max];
        title.tag = 100;
        [self addSubview:title];
        
        UILabel *num = [[UILabel alloc] initWithFrame:CGRectMake(0, title.frame.size.height, self.frame.size.width, 45)];
        num.font = [UIFont systemFontOfSize:30];
        num.backgroundColor = [UIColor whiteColor];
        num.textColor = [UIColor blueColor];
        #if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_6_0
        num.textAlignment = UITextAlignmentRight;
        #else
        num.textAlignment = NSTextAlignmentRight;
        #endif
        num.text = [NSString stringWithFormat:@"%d",now];
        num.tag = 101;
        [self addSubview:num];
        
        UISlider *sil = [[UISlider alloc] initWithFrame:CGRectMake(0, title.frame.size.height + num.frame.size.height, self.frame.size.width, 23)];
        if (now < min) {
            now = min;
        }
        if (now > max) {
            now = max;
        }
        sil.minimumValue = min;
        sil.maximumValue = max;
        sil.value = now;
        sil.tag = 102;
        [sil addTarget:self action:@selector(updateValue:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:sil];
        [sil release];
        [num release];
        [title release];
        
        int btnX = 4; int jiange = 8;
        int btnAY = 94; int btnBY = 127;
        int btnSize = 30;
        for (int i = 1; i <= 5; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            btn.frame = CGRectMake(btnX+(btnSize+jiange)*(i-1), btnAY, btnSize, btnSize);
            [btn setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
            btn.tag = 200 + i;
            [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
        }
        for (int i = 6; i <= 10; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            btn.frame = CGRectMake(btnX+(btnSize+jiange)*(i-6), btnBY, btnSize, btnSize);
            if (i == 10) {
                [btn setTitle:@"0" forState:UIControlStateNormal];
            } else {
                [btn setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
            }
            btn.tag = 200 + i;
            [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
        }
        
        CGSize toolBtnSize = CGSizeMake(self.frame.size.width/3, 30);
        NSArray *toolBtnTxt = [NSArray arrayWithObjects:@"確定",@"退格",@"取消", nil];
        for (int i = 0; i < 3; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            btn.frame = CGRectMake(toolBtnSize.width*i, self.frame.size.height-toolBtnSize.height, toolBtnSize.width, toolBtnSize.height);
            [btn setTitle:[toolBtnTxt objectAtIndex:i] forState:UIControlStateNormal];
            btn.tag = 300 + i;
            [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
        }
    }
    return self;
}
- (void)buttonClick:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    UILabel *num = (UILabel*)[self viewWithTag:101];
    if (btn.tag == 300) {
        NSMutableString *altStr = [NSMutableString string];
        int now = [num.text intValue];
        BOOL alt = NO;
        if (now > _max) {
            [altStr setString:[NSString stringWithFormat:@"你輸入的數值太大啦，\n請輸入%d以下的數字。",_max]];
            alt = YES;
        }
        if (now < _min) {
            [altStr setString:[NSString stringWithFormat:@"你輸入的數值太小啦，\n請輸入%d以上的數字。",_min]];
            alt = YES;
        }
        if (alt) {
            UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"輸入的數字超出範圍" message:altStr delegate:nil cancelButtonTitle:@"返回修改" otherButtonTitles:nil];
            [alert show];
            [alert release];
        } else {
            [self.delegate xcNumberEditerReturnNumber:now isOK:YES Mode:self.modeStr];
            [self removeFromSuperview];
        }
    } else if (btn.tag == 301) {
        if ([num.text isEqualToString:@"0"]) {
            
        } else if (num.text.length-1 == 0 || num.text.length == 0) {
            num.text = @"0";
        } else {
            num.text = [num.text substringToIndex:num.text.length-1];
        }
        [self redAlert:[num.text intValue] changeSilder:YES];
    } else if (btn.tag == 302) {
        [self.delegate xcNumberEditerReturnNumber:0 isOK:NO Mode:self.modeStr];
        [self removeFromSuperview];
    } else {
        if (num.text.length < 9) {
            int numtag = btn.tag - 200;
            int now = [num.text intValue];
            if (numtag == 10) {
                numtag = 0;
            }
            if (now == 0) {
                num.text = [NSString stringWithFormat:@"%d",numtag];
            } else {
                num.text = [NSString stringWithFormat:@"%@%d",num.text,numtag];
            }
            [self redAlert:[num.text intValue] changeSilder:YES];
        }
    }
}
- (void)redAlert:(int)now changeSilder:(BOOL)cs
{
    UILabel *title = (UILabel*)[self viewWithTag:100];
    UILabel *num = (UILabel*)[self viewWithTag:101];
    UISlider *sil = (UISlider*)[self viewWithTag:102];
    if (now > _max || now < _min) {
        if (title.textColor != [UIColor redColor]) {
            title.textColor = [UIColor redColor];
        }
        if (num.textColor != [UIColor redColor]) {
            num.textColor = [UIColor redColor];
        }
        if (now > _max) {
            if (cs) {
                [sil setValue:_max animated:YES];
            }
        } else {
            if (cs) {
                [sil setValue:_min animated:YES];
            }
        }
    } else {
        if (title.textColor != [UIColor blackColor]) {
            title.textColor = [UIColor blackColor];
        }
        if (num.textColor != [UIColor blueColor]) {
            num.textColor = [UIColor blueColor];
        }
        if (cs) {
            [sil setValue:[num.text intValue] animated:YES];
        }
    }
}
- (void)updateValue:(id)sender{
    UISlider *sil = (UISlider*)sender;
    int f = sil.value;
    UILabel *num = (UILabel*)[self viewWithTag:101];
    num.text = [NSString stringWithFormat:@"%d",f];
    [self redAlert:f changeSilder:NO];
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
