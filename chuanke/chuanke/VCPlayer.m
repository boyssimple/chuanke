//
//  VCPlayer.m
//  chuanke
//
//  Created by zhouMR on 16/7/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "VCPlayer.h"
#import "CellPlayer.h"
#import "Course.h"
#import "PlayerBar.h"
#import "PQPlayer.h"

#define PLAYERBAR_HEIGHT 55

@interface VCPlayer ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *table;

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) Course *course;
@property (nonatomic, strong) PlayerBar *playerBar;
@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) UILabel *headerTitle;
@property (nonatomic, strong) PQPlayer *player;
@property (nonatomic, strong) UIButton *btnBack;
@property (nonatomic, assign) NSInteger curIndex;

@end

@implementation VCPlayer

- (void)viewDidLoad {
    [super viewDidLoad];
    [NetTool request:@"mod=course&act=info&do=getClassList&sid=1960305&courseid=107592&version=2.4.1.2&uid=4597633" andblock:^(NSDictionary *dic, NSError *error) {
        NSLog(@"结果：%@",dic);
        self.course = [[Course alloc]init];
        [self.course parse:dic];
        [self loadData];
    }];
    self.curIndex = 0;
    NSURL *videoUrl = [NSURL URLWithString:@"http://w5.dwstatic.com/8/6/1551/380767-100-1450416171.mp4"];
    self.player = [PQPlayer videoPlayView];
    self.player.frame = CGRectMake(0, 0, DEVICEWIDTH, DEVICEWIDTH * 9 / 16);
    [self.view addSubview:self.player];
    [self.player playWith:videoUrl];
    self.player.container = self;
    self.navigationController.navigationBarHidden = TRUE;
    
    [self.view addSubview:self.table];
    [self.view addSubview:self.playerBar];
    [self.view addSubview:self.btnBack];
}

- (void)loadData{
    if(self.course.stepList.count > 0){
        CsStep *step = [self.course.stepList objectAtIndex:0];
        self.dataSource = step.classList;
        if (self.dataSource.count > 0) {
            CsClass *cls = [self.dataSource objectAtIndex:self.curIndex];
            cls.selected = TRUE;
            [self.dataSource replaceObjectAtIndex:self.curIndex withObject:cls];
            Video *v = [cls.videoList objectAtIndex:0];
            if (v) {
//                [self.player playWith:[NSURL URLWithString:v.fileUrl]];
            }
        }
        [self.table reloadData];
        self.headerTitle.text = step.stepName;
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [self.view bringSubviewToFront:self.btnBack];
}

- (void)back{
    [self.player remove];
    self.player = nil;
    [self.navigationController popViewControllerAnimated:TRUE];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"CellPlayer";
    CellPlayer *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[CellPlayer alloc]init];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if(indexPath.row == 0){
        [cell hiddenLine:1];
    }else if(indexPath.row == self.dataSource.count -1){
        [cell hiddenLine:2];
    }
        
    [cell updateData:[self.dataSource objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [self.table deselectRowAtIndexPath:indexPath animated:TRUE];
    
    
    CsClass *curCls = [self.dataSource objectAtIndex:self.curIndex];
    curCls.selected = FALSE;
    [self.dataSource replaceObjectAtIndex:self.curIndex withObject:curCls];
    
    CsClass *cls = [self.dataSource objectAtIndex:indexPath.row];
    cls.selected = TRUE;
    [self.dataSource replaceObjectAtIndex:indexPath.row withObject:cls];
    self.curIndex = indexPath.row;
    [self.table reloadData];
}

- (UITableView *)table{
    if(!_table){
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, self.player.top, DEVICEWIDTH, DEVICEHEIGHT-PLAYERBAR_HEIGHT-self.player.top)];
        _table.backgroundColor = [UIColor clearColor];
        _table.delegate = self;
        _table.dataSource = self;
        _table.rowHeight = 50;
        _table.showsVerticalScrollIndicator = NO;
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        _table.tableHeaderView = self.header;
    }
    return _table;
}

- (UIView *)header{
    if (!_header) {
        _header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 50)];
        [_header addSubview:self.headerTitle];
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 44, DEVICEWIDTH, 1)];
        line.backgroundColor = RGB3(235);
        [_header addSubview:line];
    }
    
    return _header;
}

- (UILabel *)headerTitle{
    if (!_headerTitle) {
        _headerTitle = [[UILabel alloc]initWithFrame:CGRectMake(10, 13, DEVICEWIDTH, 14)];
        _headerTitle.font = [UIFont systemFontOfSize:14];
    }
    return _headerTitle;
}


- (PlayerBar*)playerBar{
    if (!_playerBar) {
        _playerBar = [[PlayerBar alloc]initWithFrame:CGRectMake(0, DEVICEHEIGHT-PLAYERBAR_HEIGHT, DEVICEWIDTH, PLAYERBAR_HEIGHT)];
    }
    return _playerBar;
}

- (UIButton*)btnBack{
    if (!_btnBack) {
        _btnBack = [[UIButton alloc]initWithFrame:CGRectMake(10, 25, 25, 25)];
        [_btnBack setImage:[UIImage imageNamed:@"player_back"] forState:UIControlStateNormal];
        [_btnBack addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnBack;
}
@end
