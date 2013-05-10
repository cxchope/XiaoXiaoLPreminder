//
//  settTV.m
//  LPTimer
//
//  Created by 彩虹の旅途 on 13-5-6.
//  Copyright (c) 2013年 神楽坂雅詩. All rights reserved.
//

#import "settTV.h"
#import "settCell.h"
#import "XCFrame.h"
@implementation settTV
@synthesize tableArray = _tableArray, tableView = _tableView;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self chkNowLp];
        self.tableArray = [NSMutableArray arrayWithObjects:
                           @"要啟動計時器，請在下面輸入參數後點擊“開始計時”按鈕。",
                           @"點擊其它按鈕的話將放棄當前輸入的參數。",
                           @"",
                           [NSString stringWithFormat:@"總共LP最大值：%d",[SharedSettings settings].allLP],
                           [NSString stringWithFormat:@"當前剩餘的LP：%d",[SharedSettings settings].nowLP],
                           [NSString stringWithFormat:@"LP提醒值：%d",[SharedSettings settings].alertLP],
                           [NSString stringWithFormat:@"1LP回覆速度(通常不需要修改)：%d秒",[SharedSettings settings].speed],
                           nil];
        self.allLP = [SharedSettings settings].allLP;
        self.nowLP = [SharedSettings settings].nowLP;
        self.alertLP = [SharedSettings settings].alertLP;
        self.speed = [SharedSettings settings].speed;
        UITableView *tableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.backgroundColor = [UIColor clearColor];
        [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        self.tableView = tableView;
        [self addSubview:tableView];
        [tableView release];
    }
    return self;
}
- (void)chkNowLp
{
    if ([SharedSettings settings].nowLP < 0) {
        [SharedSettings settings].nowLP = 0;
    }
    if ([SharedSettings settings].nowLP >= [SharedSettings settings].allLP) {
        [SharedSettings settings].nowLP = [SharedSettings settings].allLP - 1;
    }
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
    return [XCFrame cellHeight];
}
#pragma mark 表格内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    settCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[settCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    cell.textLabel.text = [self.tableArray objectAtIndex:indexPath.row];
    return cell;
}
#pragma mark - 表格选项点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d:%d",indexPath.section,indexPath.row);
    if (indexPath.row == 3) {
        XCNumberEditer *xcnum = [[XCNumberEditer alloc] initWithFrame:CGRectMake(self.frame.size.width - 195, 5, 190, 190) MaxValue:200 MinValue:1 NowValue:self.allLP Mode:@"allLP"];
        xcnum.delegate = self;
        [self addSubview:xcnum];
        [xcnum release];[tableView setUserInteractionEnabled:NO];
    } else if (indexPath.row == 4) {
        XCNumberEditer *xcnum = [[XCNumberEditer alloc] initWithFrame:CGRectMake(self.frame.size.width - 195, 5, 190, 190) MaxValue:self.allLP-1 MinValue:0 NowValue:self.nowLP Mode:@"nowLP"];
        xcnum.delegate = self;
        [self addSubview:xcnum];
        [xcnum release];[tableView setUserInteractionEnabled:NO];
    } else if (indexPath.row == 5) {
        XCNumberEditer *xcnum = [[XCNumberEditer alloc] initWithFrame:CGRectMake(self.frame.size.width - 195, 5, 190, 190) MaxValue:self.allLP MinValue:1 NowValue:self.alertLP Mode:@"alertLP"];
        xcnum.delegate = self;
        [self addSubview:xcnum];
        [xcnum release];[tableView setUserInteractionEnabled:NO];
    } else if (indexPath.row == 6) {
        XCNumberEditer *xcnum = [[XCNumberEditer alloc] initWithFrame:CGRectMake(self.frame.size.width - 195, 5, 190, 190) MaxValue:1800 MinValue:10 NowValue:self.speed Mode:@"speed"];
        xcnum.delegate = self;
        [self addSubview:xcnum];
        [xcnum release];[tableView setUserInteractionEnabled:NO];
    }
}
- (void)xcNumberEditerReturnNumber:(int)num isOK:(BOOL)isok Mode:(NSString*)modestr
{
    if (isok) {
        if ([modestr isEqualToString:@"allLP"]) {
            self.allLP = num;
            [self.tableArray setObject:[NSString stringWithFormat:@"總共LP最大值：%d",self.allLP] atIndexedSubscript:3];
            self.alertLP = num;
            [self.tableArray setObject:[NSString stringWithFormat:@"LP提醒值：%d",self.alertLP] atIndexedSubscript:5];
            if (self.nowLP > num) {
                self.nowLP = num - 1;
            }
            [self.tableArray setObject:[NSString stringWithFormat:@"當前剩餘的LP：%d",self.nowLP] atIndexedSubscript:4];
        } else if ([modestr isEqualToString:@"nowLP"]) {
            self.nowLP = num;
            [self.tableArray setObject:[NSString stringWithFormat:@"當前剩餘的LP：%d",self.nowLP] atIndexedSubscript:4];
        } else if ([modestr isEqualToString:@"alertLP"]) {
            self.alertLP = num;
            [self.tableArray setObject:[NSString stringWithFormat:@"LP提醒值：%d",self.alertLP] atIndexedSubscript:5];
        } else if ([modestr isEqualToString:@"speed"]) {
            self.speed = num;
            [self.tableArray setObject:[NSString stringWithFormat:@"1LP回覆速度(通常不需要修改)：%d秒",self.speed] atIndexedSubscript:6];
        }
    }
    [self.tableView reloadData];
    [_tableView setUserInteractionEnabled:YES];
}
- (void)dealloc
{
    [_tableArray release];
    [_tableView release];
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
