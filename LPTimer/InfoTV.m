//
//  InfoTV.m
//  LPTimer
//
//  Created by Chen Terence on 13-5-6.
//  Copyright (c) 2013年 神楽坂雅詩. All rights reserved.
//

#import "InfoTV.h"
#import "InfoCell.h"
@implementation InfoTV
@synthesize tableArray = _tableArray, tableView = _tableView;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tableArray = [NSMutableArray arrayWithObjects:
                           @"本机時間： 00:00",
                           @"服務器所在地區時間： 00:00",
                           @"",
                           @"LP提醒值： 00",
                           @"距離最近一次發出提醒還有： 00:00",
                           @"LP完全恢復大約還需要： 00:00",
                           nil];
        UITableView *tableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.backgroundColor = [UIColor clearColor];
        [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [self addSubview:tableView];
        self.tableView = tableView;
        [tableView release];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tt:) name:@"time" object:nil];
    }
    return self;
}
- (NSString*)time:(BOOL)isLoacl
{
    NSDate* nowDate = [ NSDate date ];
    NSTimeZone *timename = nil;
    NSString *title = nil;
    if (isLoacl) {
        timename = [NSTimeZone localTimeZone];
        title = @"本機時間：";
    } else {
        timename = [NSTimeZone timeZoneWithName:@"Asia/Tokyo"];
        title = @"服務器所在地區時間：";
    }
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init ];
    [outputFormatter setDateFormat:@"YYYY年MM月dd日 HH时mm分ss秒"];
    [outputFormatter setTimeZone:timename];
    NSString *newDateString = [NSString stringWithFormat:@"%@%@",title,[outputFormatter stringFromDate:nowDate]];
    [outputFormatter release];
    return newDateString;
}
#pragma mark - 表格组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1; //Tableview有多少组
}
#pragma mark 表格行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableArray count];
}
#pragma mark 行高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 25;
}
#pragma mark 表格内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    InfoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[InfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    cell.textLabel.text = [self.tableArray objectAtIndex:indexPath.row];
    return cell;
}
#pragma mark - 表格选项点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d:%d",indexPath.section,indexPath.row);
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_tableArray release];
    [_tableView release];
    [super dealloc];
}
- (void)tt:(NSNotification *)no
{
    [self.tableArray setObject:[self time:YES] atIndexedSubscript:0];
    [self.tableArray setObject:[self time:NO] atIndexedSubscript:1];
    
    [self.tableArray setObject:[NSString stringWithFormat:@"LP提醒值：%d",[SharedSettings settings].alertLP] atIndexedSubscript:3];
    [self.tableArray setObject:[NSString stringWithFormat:@"距離最近一次發出提醒還有：%@",[self timeCalc:[SharedSettings settings].alertLPtime]] atIndexedSubscript:4];
    [self.tableArray setObject:[NSString stringWithFormat:@"LP完全恢復大約還需要：%@",[self timeCalc:[SharedSettings settings].allLPtime]] atIndexedSubscript:5];
    [self.tableView reloadData];
}
- (NSString*)timeCalc:(int)s
{
    return [NSString stringWithFormat:@"%d时%d分%d秒",s/3600,s/60-s/3600*60,s-s/60*60];
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
