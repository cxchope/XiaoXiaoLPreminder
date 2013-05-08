//
//  BackGroundMusicView.h
//  LPTimer
//
//  Created by Chen Terence on 13-5-6.
//  Copyright (c) 2013年 神楽坂雅詩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface BackGroundMusicView : UIView
{
    AVAudioPlayer *_thePlayer;
    BOOL _playing;
}
@property (nonatomic, retain) AVAudioPlayer *thePlayer;
@property (nonatomic, assign) BOOL playing;
@end
