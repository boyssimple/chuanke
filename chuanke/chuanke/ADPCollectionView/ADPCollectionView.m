//
//  ADPCollectionView.m
//  轮播demo
//
//  Created by SimpleAdapter on 16/1/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ADPCollectionView.h"
#import "ADPCollectionViewCell.h"
@interface ADPCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)NSArray * imageArray;

//全局属性图片滚动到的位置
@property (nonatomic,assign)NSInteger index;

@property (nonatomic,strong)NSTimer * timer;

@property(nonatomic,assign)CGFloat timeInterval;

//为了确定图片高度和宽度
@property (nonatomic,assign)CGSize collectionViewSize;

@property (nonatomic,assign)UIPageControl * page;


@end


@implementation ADPCollectionView
//实例化collectionView的方法
+(instancetype)collectionViewWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray Direction:(UICollectionViewScrollDirection)direction timeInterval:(CGFloat)timeInterval view:(UIView *)view{
    
    //实例化流水布局
    //    YJYYCollectionViewFlowlayout * flowlayout = [YJYYCollectionViewFlowlayout createFlowlayoutWithClassName:@"YJYYCollectionView"];
    UICollectionViewFlowLayout* flowlayout=[[UICollectionViewFlowLayout alloc]init];
    flowlayout.scrollDirection=direction;
    flowlayout.itemSize = CGSizeMake(frame.size.width, frame.size.height);
    
    //设置最小行和列间距
    flowlayout.minimumLineSpacing = 0;
    
    flowlayout.minimumInteritemSpacing = 0;
    
    //设置组内边距
    flowlayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    //实例化collectionView
    ADPCollectionView * collectionView = [[ADPCollectionView alloc]initWithFrame:frame collectionViewLayout:flowlayout];
    
    collectionView.backgroundColor = [UIColor grayColor];
    
    //给全局属性赋值
    collectionView.imageArray = imageArray;
    
    collectionView.timeInterval = timeInterval;
    
    //添加定时器
    [collectionView addTimer];
    
    
    
    //添加pageController
    UIPageControl * page = [UIPageControl new];
    page.currentPage = 0;
    
    page.numberOfPages = imageArray.count;
    
    page.currentPageIndicatorTintColor = [UIColor redColor];
    
    page.pageIndicatorTintColor = [UIColor whiteColor];
    //根据图片张数获取page的宽高
    CGSize  pageSize = [page sizeForNumberOfPages:collectionView.imageArray.count];
    
    page.frame = CGRectMake(0, 0, pageSize.width, pageSize.height);
    
    page.center = CGPointMake(collectionView.center.x, CGRectGetMaxY(collectionView.frame)-7);
    
    collectionView.page = page;
    
    collectionView.collectionViewSize = frame.size;
    
    //添加collectionView
    [view addSubview:collectionView];
    
    //添加pageControl
    [view addSubview:page];
    return collectionView;
}

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        //设置界面
        [self setUpUI];
    }
    
    return self;
}

-(void)setUpUI
{
    //滚动条取消
    self.showsVerticalScrollIndicator = NO;
    
    self.showsHorizontalScrollIndicator = NO;
    
    //弹簧效果
    self.bounces = NO;
    
    //翻页效果
    self.pagingEnabled = YES;
    
    //设置代理和数据源
    self.dataSource = self;
    
    self.delegate = self;
    
    //注册cell 一般cell我们自定义
    [self registerClass:[ADPCollectionViewCell class] forCellWithReuseIdentifier:@"ADPCollectionViewCell"];
    
    self.index = 1000;
    
    NSIndexPath * indexPath = [NSIndexPath indexPathForItem:self.index inSection:0];
    
    //默认一开始滚动到第1000张图片的位置
    [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

-(void)addTimer
{
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterval target:self selector:@selector(scrollImage) userInfo:nil repeats:YES];
    
    //添加到运行循环
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    self.timer = timer;
}

-(void)deleteTimer
{
    [self.timer invalidate];
    
    self.timer = nil;
}


//计时器的方法 自动滚动图片
-(void)scrollImage
{
    //调用计时器方法是 让图片索引++ 滚动图片
    self.index++;
    
    NSIndexPath *indexpath = [NSIndexPath indexPathForItem:self.index inSection:0];
    
    [self scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    
    self.page.currentPage = self.index%self.imageArray.count;
}

//数据源方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    //因为图片需要无限滚动 所以 返回一个无限大的数
    return 1000*1000;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ADPCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ADPCollectionViewCell" forIndexPath:indexPath];
    
    //取出图片赋值给cell
//    cell.image = self.imageArray[indexPath.item%self.imageArray.count];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:self.imageArray[indexPath.item%self.imageArray.count]]];
    cell.imageSize = self.collectionViewSize;
    
    return cell;
}


//当手指拖动图片时
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    [self deleteTimer];
}

//滚动结束之后发送通知 让控制器接收通知 设置page的当前页数
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/scrollView.bounds.size.width;
    
    self.index = index;
    
    self.page.currentPage = self.index%self.imageArray.count;
    
    [self addTimer];
}



@end
