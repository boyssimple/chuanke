//
//  CellHomeRecomment.m
//  chuanke
//
//  Created by zhouMR on 16/7/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "CellHomeLike.h"
@interface CellHomeLike()
@property (nonatomic, strong) UIImageView *img;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UIImageView *people;
@property (nonatomic, strong) UILabel *sId;
@property (nonatomic, strong) UIImageView *ivSchool;
@property (nonatomic, strong) UILabel *school;
@end

@implementation CellHomeLike

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self)
    {
        _img = [[UIImageView alloc]initWithFrame:CGRectZero];
        _img.contentMode = UIViewContentModeScaleAspectFill;
        _img.clipsToBounds = TRUE;
        [self.contentView addSubview:_img];
        
        _title = [[UILabel alloc]initWithFrame:CGRectZero];
        _title.font = [UIFont systemFontOfSize:12];
        _title.textColor = [UIColor grayColor];
        _title.numberOfLines = 2;
        [self addSubview:_title];
        
        _people = [[UIImageView alloc]initWithFrame:CGRectZero];
        _people.image = [UIImage imageNamed:@"home_people"];
        [self.contentView addSubview:_people];
        
        _sId = [[UILabel alloc]initWithFrame:CGRectZero];
        _sId.font = [UIFont systemFontOfSize:10];
        _sId.textColor = [UIColor grayColor];
        [self addSubview:_sId];
        
        _ivSchool = [[UIImageView alloc]initWithFrame:CGRectZero];
        _ivSchool.image = [UIImage imageNamed:@"home_school"];
        [self.contentView addSubview:_ivSchool];
        
        _school = [[UILabel alloc]initWithFrame:CGRectZero];
        _school.font = [UIFont systemFontOfSize:10];
        _school.textColor = [UIColor grayColor];
        [self addSubview:_school];

    }
    return self;
}

- (void)updateData:(Excellent*)data{
    [self.img sd_setImageWithURL:[NSURL URLWithString:data.photoUrl]];
    self.title.text = data.courseName;
    
    self.sId.text = [NSString stringWithFormat:@"%@",data.student_number];
    self.school.text = data.schoolName;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.img.frame = CGRectMake(10, 10, 90, 65);
    CGSize ts = [self.title sizeThatFits:CGSizeMake(DEVICEWIDTH - 120, MAXFLOAT)];
    self.title.frame = CGRectMake(self.img.left+10, 10, DEVICEWIDTH-120, ts.height);
    
    self.people.frame = CGRectMake(self.title.x-2, 45, 15, 15);
    CGSize ps = [self.title sizeThatFits:CGSizeMake(MAXFLOAT, 10)];
    self.sId.frame = CGRectMake(self.people.left+5, self.people.y+2, ps.width, 10);
    
    self.ivSchool.frame = CGRectMake(self.title.x-2, self.people.top, 15, 15);
    CGSize ss = [self.school sizeThatFits:CGSizeMake(MAXFLOAT, 10)];
    self.school.frame = CGRectMake(self.ivSchool.left+5, self.ivSchool.y+2, ss.width, 10);
}

@end
