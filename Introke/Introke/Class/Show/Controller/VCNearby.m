//
//  VCNearby.m
//  Introke
//
//  Created by zhouMR on 16/10/11.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "VCNearby.h"
#import "INTLocationManager.h"
#import "CellNearby.h"
#import "IntMainHandler.h"
#import "INTNear.h"
#import "VCPlayer.h"

#define kMargin 5
#define kWidth 100

static NSString *identifier = @"CellNearby";
@interface VCNearby ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation VCNearby

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI{
    [self.view addSubview:self.collectionView];
    
    MJChiBaoZiHeader *header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(initData)];
    self.collectionView.mj_header = header;
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    // 马上进入刷新状态
    [self.collectionView.mj_header beginRefreshing];
}

- (void)initData{
    [IntMainHandler excuteNearWithSuccess:^(id json) {
        
        INTNear *intNear = (INTNear*)json;
        self.dataSource = intNear.lives;
        [self.collectionView reloadData];
        [self.collectionView.mj_header endRefreshing];
    } withFail:^(id error) {
        NSLog(@"%@",error);
        [self.collectionView.mj_header endRefreshing];
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CellNearby *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    IntNearLive *live = [self.dataSource objectAtIndex:indexPath.row];
    cell.near = live;
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger count = collectionView.width / kWidth;
    CGFloat w = ( collectionView.width - (count+1)*kMargin )/count;
    return CGSizeMake(w, w+20);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:TRUE];
    IntNearLive *near = [self.dataSource objectAtIndex:indexPath.row];
    IntLive *live = [[IntLive alloc]init];
    live.creator.portrait = near.creator.portrait;
    live.streamAddr = near.streamAddr;
    VCPlayer *vc = [[VCPlayer alloc]init];
    vc.live = live;
    [self.navigationController pushViewController:vc animated:TRUE];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    CellNearby *nearCell = (CellNearby*)cell;
    [nearCell showAnimation];
}

- (UICollectionView*)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.sectionInset = UIEdgeInsetsMake(5 , 5 , 0 ,5);
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 0;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT) collectionViewLayout:layout];
        [_collectionView registerClass:[CellNearby class] forCellWithReuseIdentifier:identifier];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, TAB_NAV_STATUS, 0);
    }
    return _collectionView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
