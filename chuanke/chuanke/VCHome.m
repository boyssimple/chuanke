//
//  VCHome.m
//  chuanke
//
//  Created by zhouMR on 16/7/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "VCHome.h"
#import "Home.h"
#import "ADPCollectionView.h"
#import "HomeCategory.h"

#import "HomeRecommentTable.h"
#import "HomeSpecialTable.h"
#import "HomeLikeTable.h"
#import "VCPlayer.h"

@interface VCHome ()<HomeRecommentDelegate,HomeSpecialDelegate,HomeLikeDelegate>
@property (nonatomic, strong) UIScrollView *scroll;
@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) HomeRecommentTable *recomment;
@property (nonatomic, strong) HomeSpecialTable *special;
@property (nonatomic, strong) HomeLikeTable *like;
@property (nonatomic, strong) Home *home;
@end

@implementation VCHome

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.scroll];
    NSDictionary *param = [[NSDictionary alloc]initWithObjectsAndKeys:@"9ca6a93969f05c510a62fb78e521402e",@"api_sign", nil];
    
    [NetTool requestPostWith:@"mod=index&act=index&do=index" withParams:[param mutableCopy] andblock:^(NSDictionary *dic, NSError *error) {
        self.home = [[Home alloc]init];
        [self.home parse:dic];
        
        [self reloadView];
        NSLog(@"结果：%@",dic);
    }];
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = FALSE;
}

- (void)reloadView{
    [self loadFocus];
    [self loadPraise];
    [self loadAlbum];
    [self loadExcellent];
    
    self.recomment.y = self.header.top+10;
    self.special.y = self.recomment.top+10;
    self.special.height = [self.special calHeight];
    self.like.y = self.special.top+10;
    self.like.height = [self.like calHeight:self.home.excellentDatas];
    self.scroll.contentSize = CGSizeMake(_scroll.contentSize.width, self.like.top+10);
}

- (void)loadFocus{
    NSMutableArray *arr = [NSMutableArray array];
    for (Recommend *r in self.home.focusDatas) {
        [arr addObject:r.photoUrl];
    }
    
    [ADPCollectionView collectionViewWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 120)
                                    imageArray:arr
                                     Direction:UICollectionViewScrollDirectionHorizontal
                                  timeInterval:5
                                          view:self.self.header];
}

- (void)loadPraise{
    self.recomment.dataSource = self.home.praiseDatas;
    [self.recomment reload];
}


- (void)loadAlbum{
    self.special.dataSource = self.home.albumDatas;
    [self.special reload];
}

- (void)loadExcellent{
    self.like.dataSource = self.home.excellentDatas;
    [self.like reload];
}

#pragma mark HomeRecommentDelegate

- (void)selectHomeRecomment:(Recommend *)data{
    VCPlayer *vc  = [[VCPlayer alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:TRUE];
}

- (void)selectHomeSpecial:(Album *)data{
    VCPlayer *vc  = [[VCPlayer alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:TRUE];
}

- (void)selectHomeLike:(Excellent *)data{
    VCPlayer *vc  = [[VCPlayer alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:TRUE];
}

- (UIScrollView*)scroll{
    if (!_scroll) {
        _scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHEIGHT)];
        _scroll.showsVerticalScrollIndicator = NO;
        _scroll.showsHorizontalScrollIndicator = NO;
        _scroll.backgroundColor = RGB3(235);
        _scroll.contentSize = CGSizeMake(_scroll.contentSize.width, 2000);
        [_scroll addSubview:self.header];
        
        [_scroll addSubview:self.recomment];
        [_scroll addSubview:self.special];
        [_scroll addSubview:self.like];
    }
    return _scroll;
}

- (HomeRecommentTable*)recomment{
    if (!_recomment) {
        _recomment = [[HomeRecommentTable alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 340)];
        _recomment.delegate = self;
    }
    return _recomment;
}

- (HomeSpecialTable*)special{
    if (!_special) {
        _special = [[HomeSpecialTable alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 340)];
    }
    return _special;
}


- (HomeLikeTable*)like{
    if (!_like) {
        _like = [[HomeLikeTable alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 340)];
    }
    return _like;
}



- (UIView *)header{
    if (!_header) {
        _header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 210)];
        _header.backgroundColor = [UIColor whiteColor];
        CGFloat m = (DEVICEWIDTH-200)/8.0;
        for (int i=0; i< 4; i++) {
            HomeCategory *c = [[HomeCategory alloc]initWithFrame:CGRectMake((i*2+1)*m+i*50, 130, 50, 52)];
            [_header addSubview:c];
            if (i == 0) {
                c.title.text = @"编程";
            }else if(i == 1){
                c.title.text = @"办公软件";
            }else if(i == 2){
                c.title.text = @"英语";
            }else if(i == 3){
                c.title.text = @"今日直播";
            }
        }
        
    }
    return _header;
}
@end
