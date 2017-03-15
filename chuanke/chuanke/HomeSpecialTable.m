//
//  HomeRecommentTable.m
//  chuanke
//
//  Created by zhouMR on 16/7/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "HomeSpecialTable.h"
#import "HomeTableHeader.h"
#import "CellHomeSpecial.h"

@interface HomeSpecialTable()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) HomeTableHeader *header;
@property (nonatomic, strong) UICollectionView *collView;
@end
@implementation HomeSpecialTable

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _header = [[HomeTableHeader alloc]initWithFrame:CGRectMake(0, 0, self.width, 35)];
        _header.name.text = @"精品专题";
        [self addSubview:_header];
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 10;
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _collView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 35, DEVICEWIDTH, 305) collectionViewLayout:flowLayout];
        _collView.backgroundColor = [UIColor clearColor];
        _collView.delegate = self;
        _collView.dataSource = self;
        _collView.scrollEnabled = FALSE;
        _collView.showsVerticalScrollIndicator = NO;
        _collView.contentInset = UIEdgeInsetsMake(15,10,10,10);
        [_collView registerClass:[CellHomeSpecial class] forCellWithReuseIdentifier:@"CellHomeSpecial"];
        [self addSubview:_collView];
    }
    return self;
}

- (CGFloat)calHeight{
    return 170;
}

- (void)reload{
    [self.collView reloadData];
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    self.collView.height = frame.size.height-35;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.dataSource.count > 0) {
        if (self.dataSource.count > 4) {
            return  4;
        }
    }
    return self.dataSource.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CellHomeSpecial *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellHomeSpecial" forIndexPath:indexPath];
    Album *data = [self.dataSource objectAtIndex:indexPath.row];
    [cell updateData:data];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((DEVICEWIDTH-30)/2.0, 50);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectHomeSpecial:)]) {
        [self.delegate selectHomeSpecial:[self.dataSource objectAtIndex:indexPath.row]];
    }
}

@end
