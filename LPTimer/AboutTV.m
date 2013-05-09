//
//  AboutTV.m
//  LPTimer
//
//  Created by Chen Terence on 13-5-6.
//  Copyright (c) 2013年 神楽坂雅詩. All rights reserved.
// ラブライブ！ スクールアイドルフェスティバル copyright: 2013 プロジェクトラブライブ！, ©KLabGames, ©bushiroad All Rights Reserved

#import "AboutTV.h"
#import "AboutCell.h"
@implementation AboutTV
@synthesize tableArray = _tableArray, tableView = _tableView, yl = _yl;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor clearColor];
        self.yl = NO;
        self.tableArray = [NSMutableArray arrayWithObjects:
                           @"ლ(╹◡╹ლ) 歡迎使用LP提醒工具 ლ(╹◡╹ლ)",
                           @"   本程序可以幫你防止LP的浪費。",
                           @"   by 神楽坂雅詩 (點擊訪問作者Google+)",
                           @" ",
                           @"本程序僅供學習交流使用，圖標素材取自遊戲",
                           @"「ラブライブ！ スクールアイドルフェスティバル」",
                           @" ﹣ 點這裡從AppStore下載此遊戲",
                           @" ﹣ 點這裡打開本機中已經安裝的此遊戲",
                           @" ",
                           @"本作品采用此许可协议进行许可(點擊訪問CC)：",
                           @" ﹣ 知识共享署名-非商业性使用 3.0 未本地化版本",
                           @"   本軟件為開放源代碼軟件，可在署名的前提下自由傳播，",
                           @"   您不得将本作品用于商业目的，不得發佈到AppStore。",
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
    return 25;
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
    if (indexPath.row == 6) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/jp/app/raburaibu!-sukuruaidorufesutibaru/id626776655?mt=8"]];
    } else if (indexPath.row == 7) {
        [SharedSettings openGAME];
    } else if (indexPath.row == 2) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://plus.google.com/105938465531761409080/about"]];
    } else if (indexPath.row == 9 || indexPath.row == 10) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://creativecommons.org/licenses/by-nc/3.0/"]];
    }
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
