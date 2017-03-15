//
//  ADPCollectionView.h
//  轮播demo
//
//  Created by SimpleAdapter on 16/1/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADPCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource>
/**
 *  视图上面添加轮播效果
 *
 *  @param frame        轮播视图的位置，大小
 *  @param imageArray   轮播图片的数组
 *  @param timeInterval 轮播时间的间隔
 *  @param view         轮播视图的父视图
 *
 *  @return 轮播视图
 */
+(instancetype)collectionViewWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray Direction:(UICollectionViewScrollDirection)direction timeInterval:(CGFloat )timeInterval view:(UIView *)view;
@end
