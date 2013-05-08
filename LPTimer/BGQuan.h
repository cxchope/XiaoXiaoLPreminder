//
//  BGQuan.h
//  LPTimer
//
//  Created by Chen Terence on 13-5-6.
//  Copyright (c) 2013年 神楽坂雅詩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BGQuan : UIImageView
{
    int _ani;
}
@property (nonatomic, assign) int ani;
- (void)startAni:(float)speed;
@end
