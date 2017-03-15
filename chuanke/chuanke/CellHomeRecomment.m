//
//  CellHomeRecomment.m
//  chuanke
//
//  Created by zhouMR on 16/7/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "CellHomeRecomment.h"
@interface CellHomeRecomment()
@property (nonatomic, strong) UIImageView *img;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *desc;
@end

@implementation CellHomeRecomment

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self)
    {
        _img = [[UIImageView alloc]initWithFrame:CGRectZero];
        _img.contentMode = UIViewContentModeScaleAspectFill;
        _img.clipsToBounds = TRUE;
        [self.contentView addSubview:_img];
        
        _title = [[UILabel alloc]initWithFrame:CGRectZero];
        _title.textColor = [UIColor blackColor];
        _title.font = [UIFont systemFontOfSize:10];
        _title.text = @"教你几招玩转单传";
        [self.contentView addSubview:_title];
        
        _desc = [[UILabel alloc]initWithFrame:CGRectZero];
        _desc.textColor = [UIColor grayColor];
        _desc.font = [UIFont systemFontOfSize:10];
        _desc.text = @"教你几招玩转单传";
        [self.contentView addSubview:_desc];
    }
    return self;
}

- (void)updateData:(Recommend*)data{
    [self.img sd_setImageWithURL:[NSURL URLWithString:data.photoUrl]];
    self.title.text = data.courseName;
    self.desc.text = data.brief;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.img.frame = CGRectMake(0, 0, self.width, 100);
    self.title.frame = CGRectMake(0, self.img.top+5, self.width, 10);
    self.desc.frame = CGRectMake(0, self.title.top+5, self.width, 10);
}

@end
