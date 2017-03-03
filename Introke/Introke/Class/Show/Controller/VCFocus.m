//
//  VCFocus.m
//  Introke
//
//  Created by zhouMR on 16/10/11.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "VCFocus.h"
#import "IntMainHandler.h"
#import "IntFocus.h"
#import "CellFocus.h"
#import "VCPlayer.h"
#import "INTLocationManager.h"

@interface VCFocus ()
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation VCFocus

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBase];
}

- (void)initBase{
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, TAB_NAV_STATUS, 0);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    MJChiBaoZiHeader *header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(initData)];
    self.tableView.mj_header = header;
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
}

- (void)initData{
    [[INTLocationManager sharedManager]getGps];
    
    [IntMainHandler excuteFocusWithSuccess:^(id json) {
        IntFocus *intFocus = (IntFocus*)json;
        self.dataSource = intFocus.lives;
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    } withFail:^(id error) {
        NSLog(@"%@",error);
        [self.tableView.mj_header endRefreshing];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [CellFocus calHeight];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"CellFocus";
    CellFocus *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[CellFocus alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    IntLive *live = [self.dataSource objectAtIndex:indexPath.row];
    [cell updateData:live];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:TRUE];
    
    IntLive *live = [self.dataSource objectAtIndex:indexPath.row];
    VCPlayer *vc = [[VCPlayer alloc]init];
    vc.live = live;
    [self.navigationController pushViewController:vc animated:TRUE];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
