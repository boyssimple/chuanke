//
//  VCMain.m
//  Introke
//
//  Created by zhouMR on 16/10/10.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "VCMain.h"
#import "INTMainNavView.h"

@interface VCMain ()<UIScrollViewDelegate,INTMainNavViewDelegate>
@property (nonatomic, strong) UIScrollView *contentScrollView;
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, strong) NSArray *vcList;
@property (nonatomic, strong) INTMainNavView *navView;
@end

@implementation VCMain

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.contentScrollView];
    [self setupNav];
    [self configVC];
}

- (void)setupNav{
    self.navigationItem.titleView = self.navView;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStylePlain target:self action:@selector(search:)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStylePlain target:self action:@selector(search:)];
}

- (void)search:(UIBarButtonItem*)bar{
    NSLog(@"点了我");
}

- (void)configVC{
    for (NSInteger i = 0 ;i<self.vcList.count;i++) {
        NSString *vcName = [self.vcList objectAtIndex:i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc]init];
        vc.title = [self.dataList objectAtIndex:i];
        [self addChildViewController:vc];
    }
    self.contentScrollView.contentSize = CGSizeMake(DEVICE_WIDTH * self.vcList.count, 0);
    self.contentScrollView.contentOffset = CGPointMake(DEVICE_WIDTH, 0);
    [self scrollViewDidEndScrollingAnimation:self.contentScrollView];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x / DEVICE_WIDTH;
    [self.navView selectIndex:index];
    UIViewController *vc = [self.childViewControllers objectAtIndex:index];
    if ([vc isViewLoaded]) {
        return;
    }
    vc.view.frame = CGRectMake(DEVICE_WIDTH * index, 0, DEVICE_WIDTH, scrollView.height);
    [self.contentScrollView addSubview:vc.view];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
}

#pragma mark - INTMainNavViewDelegate
- (void)navBarTitleClick:(NSInteger)index{
    CGPoint point = CGPointMake(index*DEVICE_WIDTH, self.contentScrollView.contentOffset.y);
    [self.contentScrollView setContentOffset:point animated:TRUE];
}

#pragma mark - getter setter

- (NSArray*)dataList{
    if (!_dataList) {
        _dataList = @[@"关注",@"热门",@"附近"];
    }
    return _dataList;
}

- (NSArray*)vcList{
    if (!_vcList) {
        _vcList = @[@"VCAttention",@"VCFocus",@"VCNearby"];
    }
    return _vcList;
}

- (UIScrollView*)contentScrollView{
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
        _contentScrollView.pagingEnabled = YES;
        _contentScrollView.delegate = self;
        _contentScrollView.showsHorizontalScrollIndicator = FALSE;
    }
    return _contentScrollView;
}

- (INTMainNavView*)navView{
    if (!_navView) {
        _navView = [[INTMainNavView alloc]initWithFrame:CGRectMake(0, 0, 200, 50) withTitles:self.dataList];
        _navView.delegate = self;
    }
    return _navView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
