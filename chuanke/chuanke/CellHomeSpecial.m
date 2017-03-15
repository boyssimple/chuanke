//
//  CellHomeRecomment.m
//  chuanke
//
//  Created by zhouMR on 16/7/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "CellHomeSpecial.h"
@interface CellHomeSpecial()
@property (nonatomic, strong) UIImageView *img;
@end

@implementation CellHomeSpecial

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self)
    {
        _img = [[UIImageView alloc]initWithFrame:CGRectZero];
        _img.contentMode = UIViewContentModeScaleAspectFill;
        _img.clipsToBounds = TRUE;
        [self.contentView addSubview:_img];
    }
    return self;
}

- (void)updateData:(Album*)data{
    [self.img sd_setImageWithURL:[NSURL URLWithString:data.photoUrl]];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.img.frame = CGRectMake(0, 0, self.width, 50);
}

@end
