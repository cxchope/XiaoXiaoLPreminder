//
//  settCell.m
//  LPTimer
//
//  Created by 彩虹の旅途 on 13-5-6.
//  Copyright (c) 2013年 神楽坂雅詩. All rights reserved.
//

#import "settCell.h"

@implementation settCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.font = [UIFont systemFontOfSize:15];
        self.textLabel.shadowColor = [UIColor orangeColor];
        self.textLabel.shadowOffset = CGSizeMake(2, 2);
//        UISlider *sil = [[UISlider alloc] initWithFrame:CGRectMake(self.frame.size.width-50, 2, 100, 9)];
//        [self addSubview:sil];
//        UITextField *ttf = [[UITextField alloc] initWithFrame:CGRectMake(sil.frame.origin.x + sil.frame.size.width + 5, sil.frame.origin.y, 50, sil.frame.size.height)];
//        ttf.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
//        ttf.textColor = [UIColor whiteColor];
//        ttf.text = @"000";
//        ttf.font = [UIFont systemFontOfSize:12];
//        ttf.borderStyle = UITextBorderStyleBezel;
//        [self addSubview:ttf];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
