//
//  ADPCollectionViewCell.m
//  轮播demo
//
//  Created by SimpleAdapter on 16/1/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ADPCollectionViewCell.h"
@interface ADPCollectionViewCell()


@end@implementation ADPCollectionViewCell
//初始化方法
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //设置自定义的属性 如图片
        [self setUpUI];
        
    }
    return  self;
}

//设置界面
-(void)setUpUI
{
    //添加图片
    UIImageView * imageView = [[UIImageView alloc]init];
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    [self.contentView addSubview:imageView];
    
    self.imageView = imageView;
    
}
//重写外界传入的图片数组的setter方法 给imageView设置图片
-(void)setImage:(UIImage *)image
{
    _image = image;
    
    self.imageView.image = image;
    
}

//设置子视图frame
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(0, 0, self.imageSize.width, self.imageSize.height);
}
@end
