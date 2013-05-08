//
//  settTV.h
//  LPTimer
//
//  Created by 彩虹の旅途 on 13-5-6.
//  Copyright (c) 2013年 神楽坂雅詩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XCNumberEditer.h"
@interface settTV : UIView <UITableViewDelegate, UITableViewDataSource, XCNumberEditerDelegate>
{
    NSMutableArray *_tableArray;
    UITableView *_tableView;
}
@property (nonatomic, retain) NSMutableArray *tableArray;
@property (nonatomic, retain) UITableView *tableView;

@property (nonatomic, assign) int allLP;
@property (nonatomic, assign) int nowLP;
@property (nonatomic, assign) int alertLP;
@property (nonatomic, assign) int speed;
@end