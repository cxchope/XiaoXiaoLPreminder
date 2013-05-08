//
//  XCProgressView.h
//  LPTimer
//
//  Created by Chen Terence on 13-5-6.
//  Copyright (c) 2013年 神楽坂雅詩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCProgressView : UIProgressView
{
    float _nowValue;
    float _maxValue;
    float _minValue;
    BOOL _animated;
    BOOL _autoColor;
}
@property (nonatomic, assign) float nowValue;
@property (nonatomic, assign) float maxValue;
@property (nonatomic, assign) float minValue;
@property (nonatomic, assign) BOOL animated;
@property (nonatomic, assign) BOOL autoColor;
@end
