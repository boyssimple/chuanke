//
//  CellPlayer.m
//  chuanke
//
//  Created by zhouMR on 16/7/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "CellPlayer.h"
@interface CellPlayer()
@property (nonatomic, strong) UIImageView *img;
@property (nonatomic, strong) UIView *dot;
@property (nonatomic, strong) UIView *lineTop;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *time;
@end

@implementation CellPlayer

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self)
    {
        _img = [[UIImageView alloc]initWithFrame:CGRectZero];
        _img.contentMode = UIViewContentModeScaleAspectFill;
        _img.clipsToBounds = TRUE;
        _img.image = [UIImage imageNamed:@"player_video_icon"];
        [self.contentView addSubview:_img];
        
        _dot = [[UIView alloc]initWithFrame:CGRectZero];
        _dot.layer.cornerRadius = 5;
        _dot.layer.borderColor = [UIColor grayColor].CGColor;
        _dot.layer.borderWidth = 1.0;
        [self.contentView addSubview:_dot];
        
        
        _lineTop = [[UIView alloc]initWithFrame:CGRectZero];
        _lineTop.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_lineTop];
        
        _line = [[UIView alloc]initWithFrame:CGRectZero];
        _line.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_line];
        
        _title = [[UILabel alloc]initWithFrame:CGRectZero];
        _title.font = [UIFont systemFontOfSize:12];
        _title.textColor = [UIColor grayColor];
        [self addSubview:_title];
        
        _time = [[UILabel alloc]initWithFrame:CGRectZero];
        _time.font = [UIFont systemFontOfSize:12];
        _time.textColor = [UIColor grayColor];
        [self addSubview:_time];
    }
    return self;
}


- (void)hiddenLine:(int)type{
    if (type == 1) {
        self.lineTop.hidden = TRUE;
    }else{
        self.line.hidden = TRUE;
    }
}

- (void)updateData:(CsClass*)data{
    self.title.text = data.className;
    
    int t = ceilf(data.vLength / 60.0);
    self.time.text = [NSString stringWithFormat:@"%d分钟",t];
    
    if (data.selected) {
        self.title.textColor = APPCOLOR;
        self.time.textColor = APPCOLOR;
    }else{
        self.title.textColor = [UIColor grayColor];
        self.time.textColor = [UIColor grayColor];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.img.frame = CGRectMake(10, 10, 30, 15);
    self.dot.frame = CGRectMake(self.img.left+10, self.img.y+3, 10, 10);
    self.line.frame = CGRectMake(self.dot.x+(self.dot.width-1)/2.0, self.dot.top, 1, self.height-self.dot.top);
    self.lineTop.frame = CGRectMake(self.line.x, 0, 1, self.dot.y);
    
    
    CGSize ss = [self.title sizeThatFits:CGSizeMake(MAXFLOAT, 12)];
    self.title.frame = CGRectMake(self.dot.left+10, self.img.y+2, ss.width, 12);
    
    CGSize ts = [self.time sizeThatFits:CGSizeMake(MAXFLOAT, 12)];
    self.time.frame = CGRectMake(self.width-ts.width-10, self.title.y, ts.width, 12);
}

@end
