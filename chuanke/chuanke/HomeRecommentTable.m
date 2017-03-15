//
//  HomeRecommentTable.m
//  chuanke
//
//  Created by zhouMR on 16/7/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "HomeRecommentTable.h"
#import "HomeTableHeader.h"
#import "CellHomeRecomment.h"

@interface HomeRecommentTable()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) HomeTableHeader *header;
@property (nonatomic, strong) UICollectionView *collView;
@end
@implementation HomeRecommentTable

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _header = [[HomeTableHeader alloc]initWithFrame:CGRectMake(0, 0, self.width, 35)];
        _header.name.text = @"好评推荐";
        [self addSubview:_header];
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 10;
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _collView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 35, DEVICEWIDTH, 305) collectionViewLayout:flowLayout];
        _collView.backgroundColor = [UIColor clearColor];
        _collView.delegate = self;
        _collView.dataSource = self;
        _collView.scrollEnabled = FALSE;
        _collView.showsVerticalScrollIndicator = NO;
        _collView.contentInset = UIEdgeInsetsMake(15,10,0,10);
        [_collView registerClass:[CellHomeRecomment class] forCellWithReuseIdentifier:@"CellHomeRecomment"];
        [self addSubview:_collView];
    }
    return self;
}

- (void)reload{
    [self.collView reloadData];
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    self.collView.height = frame.size.height-35;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CellHomeRecomment *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellHomeRecomment" forIndexPath:indexPath];
    Recommend *data = [self.dataSource objectAtIndex:indexPath.row];
    [cell updateData:data];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((DEVICEWIDTH-30)/2.0, 145);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectHomeRecomment:)]) {
        [self.delegate selectHomeRecomment:[self.dataSource objectAtIndex:indexPath.row]];
    }
}

@end
