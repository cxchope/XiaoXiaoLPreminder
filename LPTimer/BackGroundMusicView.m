//
//  BackGroundMusicView.m
//  LPTimer
//
//  Created by Chen Terence on 13-5-6.
//  Copyright (c) 2013年 神楽坂雅詩. All rights reserved.
//

#import "BackGroundMusicView.h"
#import "XCFrame.h"
@implementation BackGroundMusicView
@synthesize thePlayer = _thePlayer, playing = _playing;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//        [button setTitle:@"♪OFF" forState:UIControlStateNormal]; 
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        NSUserDefaults *setting = [NSUserDefaults standardUserDefaults];
        UILabel *txt = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        txt.font = [XCFrame tableFont:2];
        txt.backgroundColor = [UIColor clearColor];
        txt.tag = 100;
        
        [self addSubview:txt];
        
        NSString *musicFilePath = [[NSBundle mainBundle] pathForResource:@"bgm" ofType:@"m4a"];
        NSURL *musicURL = [[NSURL alloc] initFileURLWithPath:musicFilePath];
        AVAudioPlayer *thePlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:musicURL error:nil];
        [thePlayer prepareToPlay];
        [thePlayer setVolume:1];
        thePlayer.numberOfLoops = -1;
        if (![SharedSettings settings].noFirstRUN) {
            [setting setBool:YES forKey:@"Music"];
        }
        if ([setting boolForKey:@"Music"]) {
            txt.text = @"♪ O N";
            self.playing = YES;
            [thePlayer play];
        } else {
            txt.text = @"♪ OFF";
            self.playing = NO;
        }
        self.thePlayer = thePlayer;
        [txt release];
        [musicURL release];
        [thePlayer release];
    }
    return self;
}
- (void)buttonClick:(id)sender
{
    UILabel *txt = (UILabel*)[self viewWithTag:100];
    if (self.playing) {
        [self.thePlayer stop];
        txt.text = @"♪ OFF";
        self.playing = NO;
    } else {
        [self.thePlayer play];
        txt.text = @"♪ O N";
        self.playing = YES;
    }
    NSUserDefaults *setting = [NSUserDefaults standardUserDefaults];
    [setting setBool:self.playing forKey:@"Music"];
    [setting synchronize];
}
- (void)dealloc
{
    [_thePlayer release];
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
