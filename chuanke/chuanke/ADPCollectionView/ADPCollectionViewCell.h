//
//  ADPCollectionViewCell.h
//  轮播demo
//
//  Created by SimpleAdapter on 16/1/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADPCollectionViewCell : UICollectionViewCell
//开放一个接口用于接收外界传入的数据 如存放的图片
@property (nonatomic,strong)UIImage * image;
@property (nonatomic,weak)UIImageView * imageView;

@property (nonatomic,assign)CGSize imageSize;
@end
