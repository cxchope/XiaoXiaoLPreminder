//
//  AboutTV.m
//  LPTimer
//
//  Created by Chen Terence on 13-5-6.
//  Copyright (c) 2013年 神楽坂雅詩. All rights reserved.
// ラブライブ！ スクールアイドルフェスティバル copyright: 2013 プロジェクトラブライブ！, ©KLabGames, ©bushiroad All Rights Reserved

#import "AboutTV.h"
#import "AboutCell.h"
#import "XCFrame.h"
#import "XCLocalNotification.h"
@implementation AboutTV
@synthesize tableArray = _tableArray, tableView = _tableView, yl = _yl;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor clearColor];
        self.yl = NO;
        self.tableArray = [NSMutableArray arrayWithObjects:
                           NSLocalizedString(@"aboutTV1", @""),
                           NSLocalizedString(@"aboutTV2", @""),
                           NSLocalizedString(@"aboutTV3", @""),
                           NSLocalizedString(@"aboutTV4", @""),
                           @" ",
                           NSLocalizedString(@"aboutTV6", @""),
                           @"「ラブライブ！ スクールアイドルフェスティバル」",
                           NSLocalizedString(@"aboutTV8", @""),
                           NSLocalizedString(@"aboutTV9", @""),
                           @" ",
                           NSLocalizedString(@"aboutTV11", @""),
                           NSLocalizedString(@"aboutTV12", @""),
                           NSLocalizedString(@"aboutTV13", @""),
                           NSLocalizedString(@"aboutTV14", @""),
                           @" ",
                           NSLocalizedString(@"aboutTV16", @""),
                           NSLocalizedString(@"aboutTV17", @""),
                           @" ",
                           NSLocalizedString(@"aboutTV19", @""),
                           nil];
        UITableView *tableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.backgroundColor = [UIColor clearColor];
//        tableView.separatorColor = [UIColor clearColor];
        [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [self addSubview:tableView];
        self.tableView = tableView;
        [tableView release];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tt:) name:@"time" object:nil];
    }
    return self;
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
    AboutCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[AboutCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
//        UIView *backgroundView = [[UIView alloc] initWithFrame:cell.frame];
//        backgroundView.backgroundColor = [UIColor colorWithRed:250.0/255.0 green:100.0/255.0 blue:95.0/255.0 alpha:1.0];
//        backgroundView.alpha = 0.5;
//        UIActivityIndicatorView *juhua = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray] autorelease];
//        juhua.frame = CGRectMake(cell.frame.size.width-40, cell.frame.size.height/2, 0, 0);
//        [juhua startAnimating];
//        [backgroundView addSubview:juhua];
        
//        cell.selectedBackgroundView = backgroundView;
//        [backgroundView release];
    }
    cell.textLabel.text = [self.tableArray objectAtIndex:indexPath.row];
    return cell;
}
#pragma mark - 表格选项点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d:%d",indexPath.section,indexPath.row);
    if (indexPath.row == 7) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/jp/app/raburaibu!-sukuruaidorufesutibaru/id626776655?mt=8"]];
    } else if (indexPath.row == 8) {
        [SharedSettings openGAME];
    } else if (indexPath.row == 3) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://plus.google.com/105938465531761409080/about"]];
    } else if (indexPath.row == 10 || indexPath.row == 11) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://creativecommons.org/licenses/by-nc/3.0/"]];
    } else if (indexPath.row == 16) {
        [self resetSettings];
    }
}
- (void)resetSettings
{
    UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"警告"
                                                  message:@"真的要刪除所有設置嗎？\n完成后程序將自動退出。"
                                                 delegate:self
                                        cancelButtonTitle:@"取消"
                                        otherButtonTitles:@"刪除并退出",nil];
    [alert show];
    [alert release];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"請等待"
                                                      message:@"完成後程式將自動退出"
                                                     delegate:nil
                                            cancelButtonTitle:nil
                                            otherButtonTitles:nil];
        [alert show];
        [alert release];
        [NSTimer scheduledTimerWithTimeInterval:3 target: self selector: @selector(deleteTimer:) userInfo: nil repeats: NO];
        [XCLocalNotification deleteLocalNotification];
        [SharedSettings settings].nowLP = [SharedSettings settings].alertLPtime;
        [SharedSettings settings].alertLPtime = 0;
        [SharedSettings settings].allLPtime = 0;
        [SharedSettings settings].running = NO;
        [SharedSettings settings].readyrunning = NO;
        [SharedSettings settings].noFirstRUN = NO;
        [SharedSettings saveSettings];
    }
}
- (void)deleteTimer:(NSTimer *)timer
{
    exit(0);
}
- (void)tt:(NSNotification *)no
{
    if (_yl) {
        [self.tableArray setObject:@"ლ(╹◡╹ლ) 歡迎使用LP提醒工具 ＼(・ω・＼)SAN值!" atIndexedSubscript:0];//(」・ω・)」SAN值!
        _yl = NO;
    } else {
        [self.tableArray setObject:@"ლ(╹◡╹ლ) 歡迎使用LP提醒工具 (／・ω・)／ピンチ" atIndexedSubscript:0];
        _yl = YES;
    }
    [self.tableView reloadData];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
