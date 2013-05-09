//
//  XCAlertView.m
//  LPTimer
//
//  Created by Chen Terence on 13-5-9.
//  Copyright (c) 2013年 神楽坂雅詩. All rights reserved.
//

#import "XCAlertView.h"

@implementation XCAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id)initWithText:(NSString*)text
{
    self = [super initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width-20)];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        UIView *back = [[UIView alloc] initWithFrame:self.frame];
        back.backgroundColor = [UIColor blackColor];
        back.alpha = 0.5;
        [self addSubview:back];
        [back release];
        
        UIImageView *windowImg = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"diglog" ofType:@"png"]]];
        int wImgJ = 10;
        windowImg.frame = CGRectMake(wImgJ, wImgJ, self.frame.size.width-wImgJ-wImgJ, self.frame.size.height-wImgJ-wImgJ);
        windowImg.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:windowImg];
        
        UIImage *okBtnImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"okbtn" ofType:@"png"]];
        UIButton *okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        CGSize okBtnSize = CGSizeMake(okBtnImg.size.width/2, okBtnImg.size.height/2);
        okBtn.frame = CGRectMake((self.frame.size.width-okBtnSize.width)/2, windowImg.frame.size.height + windowImg.frame.origin.y - 10 - okBtnSize.height, okBtnSize.width, okBtnSize.height);
        okBtn.contentMode = UIViewContentModeScaleAspectFit;
        [okBtn setBackgroundImage:okBtnImg forState:UIControlStateNormal];
        [okBtn addTarget:self action:@selector(okClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:okBtn];
        
        UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        int cancelSize = 50;
        cancelBtn.frame = CGRectMake(windowImg.frame.origin.x + windowImg.frame.size.width - cancelSize, windowImg.frame.origin.y, cancelSize, cancelSize);
        [cancelBtn addTarget:self action:@selector(okClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cancelBtn];
        
        UILabel *txt = [[UILabel alloc] initWithFrame:CGRectMake(windowImg.frame.origin.x + cancelSize, windowImg.frame.origin.y + cancelSize, windowImg.frame.size.width-cancelSize-cancelSize, windowImg.frame.size.height-cancelSize-cancelSize-10)];
        #if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_6_0
        txt.textAlignment = UITextAlignmentCenter;
        txt.lineBreakMode = UILineBreakModeWordWrap;
        #else
        txt.textAlignment = NSTextAlignmentCenter;
        txt.lineBreakMode = NSLineBreakByWordWrapping;
        #endif
        txt.numberOfLines = 0;//上面两行设置多行显示
        txt.text = text;
        txt.backgroundColor = [UIColor clearColor];
        [self addSubview:txt];
        [txt release];
        [windowImg release];
    }
    return self;
}
- (void)okClick:(id)sender
{
    [self removeFromSuperview];
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
